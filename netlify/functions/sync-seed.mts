/**
 * Pushes the verified seed data into Supabase.
 *
 * WHY THIS EXISTS
 *
 * The seed lives in src/lib/data/seed.ts and is the single source of truth for
 * what the site shows. Getting it into the database used to mean opening the
 * Supabase SQL editor and pasting supabase/seed.sql in by hand — fine once,
 * miserable as a habit, and impossible when nobody is at a browser. This runs
 * the same upserts from a scheduled function instead, so a git push is all it
 * takes: Netlify builds, the next run syncs, the site picks the changes up.
 *
 * It is deliberately idempotent. Restaurants and specials are upserted on their
 * id, so a corrected price or a newly discovered expiry date overwrites the old
 * row. Research-queue candidates are inserted but never updated, because once
 * an administrator has reviewed one, a sync must not reset their decision back
 * to pending. That mirrors supabase/seed.sql exactly, and the two are generated
 * from the same data.
 *
 * SECURITY
 *
 * This needs the service-role key: the tables are closed to everyone except
 * approved administrators, which is the whole point of the row-level security.
 * The key is read from the environment inside a server-side function and never
 * reaches the browser — the CSP would not let it out even if it did. Set it in
 * Netlify under Site configuration → Environment variables as
 * SUPABASE_SERVICE_ROLE_KEY, scoped to the production context. Do not put it in
 * .env files that are committed, and do not paste it into this file.
 *
 * Without the key the function does nothing and says so, so it is safe to
 * deploy before the variable exists.
 *
 * MANUAL RUNS
 *
 * Scheduled invocations always proceed. A manual HTTP request must carry
 * SEED_SYNC_TOKEN, either as an `x-sync-token` header or a `token` query
 * parameter — otherwise anyone who guessed the URL could rewrite the listings.
 * Leave SEED_SYNC_TOKEN unset and manual runs are refused outright.
 */
import type { Config } from '@netlify/functions';
import { createClient } from '@supabase/supabase-js';

import { RESEARCH_QUEUE_SEED, RESTAURANTS_SEED, SPECIALS_SEED } from '../../src/lib/data/seed';

/** Postgres rejects an oversized statement, so send the rows in batches. */
const BATCH = 50;

function chunk<T>(rows: T[], size: number): T[][] {
  const out: T[][] = [];
  for (let i = 0; i < rows.length; i += size) out.push(rows.slice(i, i + size));
  return out;
}

export default async function handler(request: Request): Promise<Response> {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!url || !serviceKey) {
    return Response.json({
      ok: true,
      skipped: true,
      reason:
        'SUPABASE_SERVICE_ROLE_KEY (or the project URL) is not set. Add it in Netlify to enable syncing.',
    });
  }

  // Netlify posts { next_run } on a scheduled invocation. Anything else is a
  // person or a script, and has to prove it.
  let scheduled = false;
  try {
    const body = await request.clone().json();
    scheduled = typeof body?.next_run === 'string';
  } catch {
    scheduled = false;
  }

  if (!scheduled) {
    const expected = process.env.SEED_SYNC_TOKEN;
    const supplied =
      request.headers.get('x-sync-token') ?? new URL(request.url).searchParams.get('token') ?? '';
    if (!expected || supplied !== expected) {
      return Response.json(
        { ok: false, error: 'Manual runs require a valid SEED_SYNC_TOKEN.' },
        { status: 401 },
      );
    }
  }

  const supabase = createClient(url, serviceKey, { auth: { persistSession: false } });
  const errors: string[] = [];

  for (const rows of chunk(RESTAURANTS_SEED, BATCH)) {
    const { error } = await supabase.from('restaurants').upsert(rows, { onConflict: 'id' });
    if (error) errors.push(`restaurants: ${error.message}`);
  }

  for (const rows of chunk(SPECIALS_SEED, BATCH)) {
    const { error } = await supabase.from('specials').upsert(rows, { onConflict: 'id' });
    if (error) errors.push(`specials: ${error.message}`);
  }

  // Insert only. A reviewed candidate keeps whatever an administrator decided.
  for (const rows of chunk(RESEARCH_QUEUE_SEED, BATCH)) {
    const { error } = await supabase
      .from('research_queue')
      .upsert(rows, { onConflict: 'id', ignoreDuplicates: true });
    if (error) errors.push(`research_queue: ${error.message}`);
  }

  const counts = {
    restaurants: RESTAURANTS_SEED.length,
    specials: SPECIALS_SEED.length,
    research_queue: RESEARCH_QUEUE_SEED.length,
  };

  if (errors.length) {
    return Response.json({ ok: false, counts, errors }, { status: 200 });
  }

  return Response.json({ ok: true, synced: counts, scheduled });
}

/** 03:20 UTC — 05:20 in Cape Town, before anyone opens the site. */
export const config: Config = {
  schedule: '20 3 * * *',
};
