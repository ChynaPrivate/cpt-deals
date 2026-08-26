/**
 * Scheduled Instagram sweep.
 *
 * Once a day, ask Meta's Business Discovery API for the recent posts of every
 * listed venue that has an Instagram account, and drop anything that reads
 * like an offer into the research queue for a human to look at.
 *
 * It never publishes. Everything it finds lands as `review_status: 'pending'`,
 * exactly like a photographed board.
 *
 * Switching it on needs three environment variables in Netlify:
 *   IG_BUSINESS_ID            your own Instagram Professional account's ID
 *   IG_ACCESS_TOKEN           a long-lived token for the linked Facebook Page
 *   SUPABASE_SERVICE_ROLE_KEY so the job can write with no user session
 *
 * The service-role key is used here and nowhere else. It never reaches the
 * browser: Netlify Functions run server-side, and this file is not part of the
 * Next.js client bundle.
 */
import type { Config } from '@netlify/functions';
import { createClient } from '@supabase/supabase-js';
import {
  businessDiscoveryUrl,
  candidatesFrom,
  confidenceFor,
  dedupeByHandle,
  handleFromUrl,
  type IgMedia,
  type VenueRef,
} from '../../src/lib/instagram/discover.js';
import { PROSPECTS } from '../../src/lib/data/prospects.js';

/** Meta allows 200 calls an hour; this is well inside that and kind to it. */
const DELAY_BETWEEN_ACCOUNTS_MS = 1_500;
const sleep = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));

interface DiscoveryResponse {
  business_discovery?: { username?: string; media?: { data?: IgMedia[] } };
  error?: { message?: string; code?: number };
}

export default async function handler(): Promise<Response> {
  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const igBusinessId = process.env.IG_BUSINESS_ID;
  const accessToken = process.env.IG_ACCESS_TOKEN;

  if (!supabaseUrl || !serviceKey) {
    return Response.json({ ok: false, reason: 'Supabase is not configured.' }, { status: 200 });
  }
  if (!igBusinessId || !accessToken) {
    // Not an error: the sweep is simply switched off until Meta is set up.
    return Response.json(
      { ok: true, skipped: true, reason: 'IG_BUSINESS_ID or IG_ACCESS_TOKEN not set.' },
      { status: 200 },
    );
  }

  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { persistSession: false },
  });

  const { data: restaurants, error: readError } = await supabase
    .from('restaurants')
    .select('id, name, instagram_url')
    .eq('active', true)
    .not('instagram_url', 'is', null);

  if (readError) {
    return Response.json({ ok: false, reason: readError.message }, { status: 500 });
  }

  const listed: VenueRef[] = (restaurants ?? []).flatMap((row) => {
    const handle = handleFromUrl(row.instagram_url as string | null);
    if (!handle) return [];
    return [{ id: row.id as string, name: row.name as string, handle }];
  });

  // Watch a handful of accounts for venues that are not listed yet. Most of
  // Kloof Street publishes its specials on Instagram and nowhere else, so
  // waiting for them to turn up on a review site means never listing them.
  // A hit files with no restaurant attached and a person types it up.
  const listedHandles = new Set(listed.map((v) => v.handle.toLowerCase()));
  const prospects: VenueRef[] = PROSPECTS.filter(
    (p) => !listedHandles.has(p.handle.toLowerCase()),
  ).map((p) => ({ id: null, name: `${p.name} (not yet listed — ${p.suburb})`, handle: p.handle }));

  // One account, one sweep. Several venues legitimately share an Instagram
  // account — Hudsons has two branches on it, Tiger's Milk three — and reading
  // the same account once per branch wastes Meta calls and gives the dedup
  // guard below more work to do than it should have.
  const venues: VenueRef[] = dedupeByHandle([...listed, ...prospects]);

  if (venues.length === 0) {
    return Response.json({
      ok: true,
      checked: 0,
      added: 0,
      note: 'No venues have an Instagram URL.',
    });
  }

  // Everything already in the queue, so a post is never raised twice.
  const { data: existing } = await supabase.from('research_queue').select('source_url');
  const seen = new Set((existing ?? []).map((row) => row.source_url as string));

  const now = new Date();
  const problems: string[] = [];
  let added = 0;
  let checked = 0;

  for (const venue of venues) {
    try {
      const response = await fetch(businessDiscoveryUrl(igBusinessId, venue.handle, accessToken), {
        signal: AbortSignal.timeout(15_000),
      });
      const body = (await response.json()) as DiscoveryResponse;

      if (body.error) {
        // A personal (non-Professional) account simply cannot be read. Not a fault.
        problems.push(`${venue.handle}: ${body.error.message ?? 'unreadable'}`);
        continue;
      }
      checked += 1;

      const media = body.business_discovery?.media?.data ?? [];
      const candidates = candidatesFrom(venue, media, now, seen);

      for (const candidate of candidates) {
        // Claim the permalink BEFORE the insert is awaited. candidatesFrom
        // filtered against `seen` as it was when this venue started, so two
        // posts in one batch could otherwise race to the same row.
        if (seen.has(candidate.permalink)) continue;
        seen.add(candidate.permalink);

        const { error: insertError } = await supabase.from('research_queue').insert({
          restaurant_id: candidate.restaurantId,
          proposed_special_data: {
            restaurant: candidate.restaurantName,
            instagram_handle: candidate.handle,
            caption: candidate.caption,
            posted_at: candidate.postedAt,
            why_flagged: candidate.reasons,
            note: `Instagram post from ${candidate.postedAt}. Read the caption, then confirm with the restaurant before publishing.`,
          },
          source_url: candidate.permalink,
          detected_at: new Date().toISOString().slice(0, 10),
          confidence: confidenceFor(candidate.score),
          review_status: 'pending',
          reviewer_notes:
            'Found automatically on Instagram. Nothing here is published until you type it up and mark it verified.',
        });
        if (insertError) {
          // Leave the permalink claimed. A failed insert wrote nothing, and
          // retrying it inside the same run would fail the same way.
          problems.push(`${venue.handle}: ${insertError.message}`);
        } else {
          added += 1;
        }
      }
    } catch (caught) {
      problems.push(`${venue.handle}: ${caught instanceof Error ? caught.message : 'failed'}`);
    }

    await sleep(DELAY_BETWEEN_ACCOUNTS_MS);
  }

  // Netlify's function log shows whatever the run prints. Without this a
  // healthy run leaves no trace at all, which reads exactly like a dead
  // function — and sent us looking for a broken token that was fine.
  const summary = { venues: venues.length, checked, added, problems: problems.length };
  console.log('instagram-sweep', JSON.stringify(summary));
  for (const problem of problems) console.log('instagram-sweep problem:', problem);

  return Response.json({ ok: true, ...summary, problems });
}

/** Once a day, early morning Cape Town time (04:30 UTC is 06:30 SAST). */
export const config: Config = {
  schedule: '30 4 * * *',
};
