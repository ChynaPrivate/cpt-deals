/**
 * The single data-access layer for the public site.
 *
 * When Supabase credentials are present it reads from the database; otherwise
 * it falls back to the verified seed data in seed.ts. Nothing else in the app
 * needs to know which one is in use.
 */
import { createServerSupabase } from '../supabase/server';
import { isSupabaseConfigured } from '../supabase/config';
import type { Restaurant, Special, SpecialWithRestaurant } from '../types';
import { joinSeed, RESTAURANTS_SEED } from './seed';

export type DataSource = 'supabase' | 'seed';

export function activeDataSource(): DataSource {
  return isSupabaseConfigured() ? 'supabase' : 'seed';
}

interface SpecialRow extends Special {
  restaurant: Restaurant | Restaurant[] | null;
}

function normaliseRow(row: SpecialRow): SpecialWithRestaurant | null {
  const restaurant = Array.isArray(row.restaurant) ? row.restaurant[0] : row.restaurant;
  if (!restaurant) return null;
  const { restaurant: _ignored, ...special } = row;
  void _ignored;
  return { ...(special as Special), restaurant };
}

const SPECIAL_COLUMNS = `
  id, restaurant_id, title, description, price, original_price, category,
  dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until,
  terms, booking_required, public_holiday_status, source_url, source_type,
  source_published_at, last_verified_at, verification_status, featured, active,
  created_at, updated_at,
  restaurant:restaurants(*)
`;

/**
 * Every special a visitor may see. Expiry, verification and active flags are
 * enforced again by row-level security, so a misconfigured client cannot leak
 * unverified rows.
 */
export async function getPublicSpecials(): Promise<SpecialWithRestaurant[]> {
  const supabase = await createServerSupabase();
  if (!supabase) return joinSeed();

  const { data, error } = await supabase
    .from('specials')
    .select(SPECIAL_COLUMNS)
    .eq('active', true)
    .eq('verification_status', 'verified');

  if (error) {
    throw new Error(`Could not load specials: ${error.message}`);
  }

  return ((data ?? []) as unknown as SpecialRow[])
    .map(normaliseRow)
    .filter((row): row is SpecialWithRestaurant => row !== null);
}

export async function getRestaurants(): Promise<Restaurant[]> {
  const supabase = await createServerSupabase();
  if (!supabase) return RESTAURANTS_SEED;

  const { data, error } = await supabase
    .from('restaurants')
    .select('*')
    .eq('active', true)
    .order('name');

  if (error) throw new Error(`Could not load restaurants: ${error.message}`);
  return (data ?? []) as Restaurant[];
}
