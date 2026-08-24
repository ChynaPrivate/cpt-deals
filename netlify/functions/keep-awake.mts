/**
 * Keep-alive ping for Supabase's free plan.
 *
 * Free Supabase projects pause after a week with no database activity, and a
 * paused project takes the site's data with it. A quiet Tuesday in winter is
 * not a reason for CPT Happy Hours to go dark, so this runs every other day and
 * makes the cheapest possible query — one row, one column.
 *
 * It uses the public anon key and reads exactly what any visitor may read, so
 * it needs no elevated privileges and adds no attack surface. On a paid plan
 * this function is harmless; you can delete it or leave it.
 *
 * Exits quietly when Supabase is not configured, like every other job here.
 */
import type { Config } from '@netlify/functions';
import { createClient } from '@supabase/supabase-js';

export default async function handler(): Promise<Response> {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  if (!url || !anonKey) {
    return Response.json(
      { ok: true, skipped: true, reason: 'Supabase is not configured.' },
      { status: 200 },
    );
  }

  const supabase = createClient(url, anonKey, { auth: { persistSession: false } });

  const { error } = await supabase.from('restaurants').select('id').limit(1);

  if (error) {
    // Surface it in the Netlify function log rather than failing loudly: a
    // missed ping is not worth an alert, but a run of them means something.
    return Response.json({ ok: false, error: error.message }, { status: 200 });
  }

  return Response.json({ ok: true, pinged: true });
}

/** 05:10 UTC (07:10 SAST) every other day — well inside the one-week window. */
export const config: Config = {
  schedule: '10 5 */2 * *',
};
