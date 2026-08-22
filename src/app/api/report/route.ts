import { NextResponse } from 'next/server';
import { z } from 'zod';
import { createServerSupabase } from '@/lib/supabase/server';

export const runtime = 'nodejs';
export const dynamic = 'force-dynamic';

const ReportSchema = z.object({
  special_id: z.string().uuid('That special could not be identified.'),
  report_type: z.enum(
    [
      'special_ended',
      'price_incorrect',
      'times_incorrect',
      'restaurant_closed',
      'address_incorrect',
      'other',
    ],
    { message: 'Please choose one of the listed reasons.' },
  ),
  comment: z.string().trim().max(500, 'Please keep the comment under 500 characters.').optional(),
  /** Honeypot. Validated loosely so a bot gets a success response, not a hint. */
  website: z.string().optional(),
});

/**
 * Rate limiting.
 *
 * Held in memory, so it bounds one serverless instance rather than the whole
 * site. That is enough to stop a naive flood; the database also has a
 * per-special uniqueness guard. For heavier protection, move this to a shared
 * store (see docs/DEPLOYMENT.md).
 */
const WINDOW_MS = 60 * 60 * 1000;
const MAX_PER_WINDOW = 5;
const hits = new Map<string, number[]>();

function rateLimited(key: string): boolean {
  const now = Date.now();
  const recent = (hits.get(key) ?? []).filter((time) => now - time < WINDOW_MS);
  if (recent.length >= MAX_PER_WINDOW) {
    hits.set(key, recent);
    return true;
  }
  recent.push(now);
  hits.set(key, recent);
  // Keep the map from growing without bound on a long-lived instance.
  if (hits.size > 5000) hits.clear();
  return false;
}

function clientKey(request: Request): string {
  const forwarded =
    request.headers.get('x-nf-client-connection-ip') ?? request.headers.get('x-forwarded-for');
  return (forwarded ?? 'unknown').split(',')[0].trim();
}

export async function POST(request: Request) {
  let payload: unknown;
  try {
    payload = await request.json();
  } catch {
    return NextResponse.json({ error: 'That request could not be read.' }, { status: 400 });
  }

  const parsed = ReportSchema.safeParse(payload);
  if (!parsed.success) {
    const message = parsed.error.issues[0]?.message ?? 'Please check the form and try again.';
    return NextResponse.json({ error: message }, { status: 400 });
  }

  // A filled honeypot is a bot. Answer as though it worked so it learns nothing.
  if (parsed.data.website) {
    return NextResponse.json({ ok: true });
  }

  if (rateLimited(clientKey(request))) {
    return NextResponse.json(
      { error: 'That is a lot of reports in one go. Please try again later.' },
      { status: 429 },
    );
  }

  const supabase = await createServerSupabase();
  if (!supabase) {
    // Running on local seed data — accept the report but say so plainly in logs.
    console.info('[report] Supabase not configured; report not stored', {
      special_id: parsed.data.special_id,
      report_type: parsed.data.report_type,
    });
    return NextResponse.json({ ok: true, stored: false });
  }

  const { error } = await supabase.from('reports').insert({
    special_id: parsed.data.special_id,
    report_type: parsed.data.report_type,
    comment: parsed.data.comment?.length ? parsed.data.comment : null,
  });

  if (error) {
    console.error('[report] insert failed', error.message);
    return NextResponse.json(
      { error: 'The report could not be saved. Please try again.' },
      { status: 500 },
    );
  }

  return NextResponse.json({ ok: true, stored: true });
}
