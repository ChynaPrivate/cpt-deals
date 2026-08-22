'use client';

/**
 * Thin data helpers for the admin dashboard. Every call goes through the
 * browser Supabase client with the anon key — row-level security decides what
 * an approved administrator may actually do.
 */
import type { SupabaseClient } from '@supabase/supabase-js';
import type { Report, ResearchQueueItem, Restaurant, Special, Weekday } from '@/lib/types';

export async function listRestaurants(supabase: SupabaseClient): Promise<Restaurant[]> {
  const { data, error } = await supabase.from('restaurants').select('*').order('name');
  if (error) throw new Error(error.message);
  return (data ?? []) as Restaurant[];
}

export async function listSpecials(supabase: SupabaseClient): Promise<Special[]> {
  const { data, error } = await supabase
    .from('specials')
    .select('*')
    .order('updated_at', { ascending: false });
  if (error) throw new Error(error.message);
  return (data ?? []) as Special[];
}

export async function listReports(supabase: SupabaseClient): Promise<Report[]> {
  const { data, error } = await supabase
    .from('reports')
    .select('*')
    .order('created_at', { ascending: false });
  if (error) throw new Error(error.message);
  return (data ?? []) as Report[];
}

export async function listResearchQueue(supabase: SupabaseClient): Promise<ResearchQueueItem[]> {
  const { data, error } = await supabase
    .from('research_queue')
    .select('*')
    .order('detected_at', { ascending: false });
  if (error) throw new Error(error.message);
  return (data ?? []) as ResearchQueueItem[];
}

export async function saveRestaurant(
  supabase: SupabaseClient,
  restaurant: Partial<Restaurant>,
): Promise<void> {
  const { error } = restaurant.id
    ? await supabase.from('restaurants').update(restaurant).eq('id', restaurant.id)
    : await supabase.from('restaurants').insert(restaurant);
  if (error) throw new Error(error.message);
}

export async function saveSpecial(
  supabase: SupabaseClient,
  special: Partial<Special>,
): Promise<void> {
  const { error } = special.id
    ? await supabase.from('specials').update(special).eq('id', special.id)
    : await supabase.from('specials').insert(special);
  if (error) throw new Error(error.message);
}

/** Mark verified and stamp today's Cape Town date as the check date. */
export async function verifySpecial(
  supabase: SupabaseClient,
  id: string,
  todayIso: string,
): Promise<void> {
  const { error } = await supabase
    .from('specials')
    .update({ verification_status: 'verified', last_verified_at: todayIso })
    .eq('id', id);
  if (error) throw new Error(error.message);
}

export async function setSpecialFlags(
  supabase: SupabaseClient,
  id: string,
  flags: Partial<Pick<Special, 'featured' | 'active' | 'verification_status'>>,
): Promise<void> {
  const { error } = await supabase.from('specials').update(flags).eq('id', id);
  if (error) throw new Error(error.message);
}

export async function updateReport(
  supabase: SupabaseClient,
  id: string,
  status: Report['status'],
): Promise<void> {
  const { error } = await supabase.from('reports').update({ status }).eq('id', id);
  if (error) throw new Error(error.message);
}

export async function updateResearchItem(
  supabase: SupabaseClient,
  id: string,
  patch: Partial<ResearchQueueItem>,
): Promise<void> {
  const { error } = await supabase.from('research_queue').update(patch).eq('id', id);
  if (error) throw new Error(error.message);
}

/**
 * Possible duplicates: the same venue with a very similar title, or the same
 * venue and price sharing a weekday. Flagged for a human, never auto-merged.
 */
export function findDuplicates(specials: Special[]): Array<[Special, Special]> {
  const normalise = (value: string) =>
    value
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, ' ')
      .trim();

  const pairs: Array<[Special, Special]> = [];
  for (let i = 0; i < specials.length; i += 1) {
    for (let j = i + 1; j < specials.length; j += 1) {
      const a = specials[i];
      const b = specials[j];
      if (a.restaurant_id !== b.restaurant_id) continue;

      const sameTitle = normalise(a.title) === normalise(b.title);
      const overlapDays = a.days_of_week.some((day: Weekday) => b.days_of_week.includes(day));
      const samePrice = a.price !== null && a.price === b.price;

      if (sameTitle || (overlapDays && samePrice && a.category === b.category)) {
        pairs.push([a, b]);
      }
    }
  }
  return pairs;
}
