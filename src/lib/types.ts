/**
 * Domain types for CPT Deals.
 * These mirror the Supabase schema in supabase/migrations exactly, so the
 * same code path works against local seed data or a live Supabase project.
 */

/** ISO weekday numbers: Monday = 1 ... Sunday = 7. */
export type Weekday = 1 | 2 | 3 | 4 | 5 | 6 | 7;

export const WEEKDAYS: readonly Weekday[] = [1, 2, 3, 4, 5, 6, 7] as const;

export const WEEKDAY_NAMES: Record<Weekday, string> = {
  1: 'Monday',
  2: 'Tuesday',
  3: 'Wednesday',
  4: 'Thursday',
  5: 'Friday',
  6: 'Saturday',
  7: 'Sunday',
};

export const WEEKDAY_SHORT: Record<Weekday, string> = {
  1: 'Mon',
  2: 'Tue',
  3: 'Wed',
  4: 'Thu',
  5: 'Fri',
  6: 'Sat',
  7: 'Sun',
};

/**
 * The suburbs this site covers. Adding one here is not enough on its own —
 * the database has a matching allowlist, so an out-of-area venue cannot be
 * saved by mistake.
 */
export const SUBURBS = [
  'Gardens',
  'Tamboerskloof',
  'Oranjezicht',
  'Vredehoek',
  'Cape Town City Centre',
  'Sea Point',
  'Green Point',
  'Mouille Point',
  'Camps Bay',
] as const;

export type Suburb = (typeof SUBURBS)[number];

/** Short labels for the suburb filter row, where space is tight. */
export const SUBURB_SHORT: Record<Suburb, string> = {
  Gardens: 'Gardens',
  Tamboerskloof: 'Tamboerskloof',
  Oranjezicht: 'Oranjezicht',
  Vredehoek: 'Vredehoek',
  'Cape Town City Centre': 'City Centre',
  'Sea Point': 'Sea Point',
  'Green Point': 'Green Point',
  'Mouille Point': 'Mouille Point',
  'Camps Bay': 'Camps Bay',
};

export type SpecialCategory = 'food' | 'drinks' | 'breakfast' | 'lunch' | 'dinner' | 'happy_hour';

export const SPECIAL_CATEGORIES: readonly SpecialCategory[] = [
  'food',
  'drinks',
  'breakfast',
  'lunch',
  'dinner',
  'happy_hour',
] as const;

export const CATEGORY_LABELS: Record<SpecialCategory, string> = {
  food: 'Food',
  drinks: 'Drinks',
  breakfast: 'Breakfast',
  lunch: 'Lunch',
  dinner: 'Dinner',
  happy_hour: 'Happy hour',
};

export type DietaryTag = 'vegetarian' | 'vegan' | 'halaal';

export type SourceType =
  | 'official_website'
  | 'official_menu'
  | 'booking_page'
  | 'google_business'
  | 'publication'
  | 'social'
  /** Seen and photographed in the venue — the strongest evidence there is. */
  | 'in_person';

export const SOURCE_TYPE_LABELS: Record<SourceType, string> = {
  official_website: 'Restaurant website',
  official_menu: 'Menu',
  booking_page: 'Booking page',
  google_business: 'Google listing',
  publication: 'Publication',
  social: 'Social media',
  in_person: 'Photographed in the venue',
};

export type VerificationStatus = 'unverified' | 'verified' | 'needs_recheck' | 'rejected';

export type PublicHolidayStatus = 'unknown' | 'valid' | 'not_valid';

export interface Restaurant {
  id: string;
  name: string;
  slug: string;
  description: string | null;
  categories: string[];
  street_address: string;
  suburb: string;
  latitude: number | null;
  longitude: number | null;
  phone: string | null;
  website_url: string | null;
  booking_url: string | null;
  instagram_url: string | null;
  facebook_url: string | null;
  google_maps_url: string | null;
  image_url: string | null;
  active: boolean;
  last_checked_at: string | null;
  created_at: string;
  updated_at: string;
}

export interface Special {
  id: string;
  restaurant_id: string;
  title: string;
  description: string;
  /** Price in South African rand. Null when the offer is a discount rather than a fixed price. */
  price: number | null;
  original_price: number | null;
  category: SpecialCategory;
  dietary_tags: DietaryTag[];
  days_of_week: Weekday[];
  /** 24-hour "HH:MM". Null means "all day". */
  start_time: string | null;
  end_time: string | null;
  valid_from: string | null;
  valid_until: string | null;
  terms: string | null;
  booking_required: boolean;
  public_holiday_status: PublicHolidayStatus;
  source_url: string;
  source_type: SourceType;
  source_published_at: string | null;
  /** Photograph of the board this came from. Admin evidence, never shown publicly. */
  photo_url: string | null;
  last_verified_at: string;
  verification_status: VerificationStatus;
  featured: boolean;
  active: boolean;
  created_at: string;
  updated_at: string;
}

/** A special joined to its restaurant — the shape the UI renders. */
export interface SpecialWithRestaurant extends Special {
  restaurant: Restaurant;
}

export type ReportType =
  | 'special_ended'
  | 'price_incorrect'
  | 'times_incorrect'
  | 'restaurant_closed'
  | 'address_incorrect'
  | 'other';

export const REPORT_TYPE_LABELS: Record<ReportType, string> = {
  special_ended: 'The special has ended',
  price_incorrect: 'The price is incorrect',
  times_incorrect: 'The times are incorrect',
  restaurant_closed: 'The restaurant has closed',
  address_incorrect: 'The address is incorrect',
  other: 'Something else',
};

export interface Report {
  id: string;
  special_id: string;
  report_type: ReportType;
  comment: string | null;
  created_at: string;
  status: 'new' | 'reviewing' | 'resolved' | 'dismissed';
}

export interface ResearchQueueItem {
  id: string;
  restaurant_id: string | null;
  /** Free-form record of the candidate offer exactly as it was found. */
  proposed_special_data: Record<string, unknown>;
  source_url: string;
  photo_url: string | null;
  detected_at: string;
  confidence: 'low' | 'medium' | 'high';
  review_status: 'pending' | 'approved' | 'rejected' | 'needs_more_evidence';
  reviewer_notes: string | null;
  created_at: string;
  updated_at: string;
}

export type SortKey =
  'recommended' | 'price_asc' | 'nearest' | 'recently_verified' | 'expiring_soon';

export const SORT_LABELS: Record<SortKey, string> = {
  recommended: 'Recommended',
  price_asc: 'Lowest price',
  nearest: 'Nearest',
  recently_verified: 'Recently verified',
  expiring_soon: 'Expiring soon',
};

export type FilterKey =
  | 'food'
  | 'drinks'
  | 'breakfast'
  | 'lunch'
  | 'dinner'
  | 'happy_hour'
  | 'vegetarian'
  | 'under_150'
  | 'under_250'
  | 'open_now';

export const FILTER_LABELS: Record<FilterKey, string> = {
  food: 'Food',
  drinks: 'Drinks',
  breakfast: 'Breakfast',
  lunch: 'Lunch',
  dinner: 'Dinner',
  happy_hour: 'Happy hour',
  vegetarian: 'Vegetarian',
  under_150: 'Under R150',
  under_250: 'Under R250',
  open_now: 'Open now',
};

/**
 * The top-level split a visitor makes first: am I after something to eat, or
 * something to drink? Every category maps to exactly one of these, so the two
 * halves always add up to the whole.
 */
export type SpecialKind = 'all' | 'food' | 'drinks';

export const KIND_LABELS: Record<SpecialKind, string> = {
  all: 'Everything',
  food: 'Food',
  drinks: 'Drinks',
};

export const DISCLAIMER =
  'Specials can change without notice. Please confirm with the restaurant before visiting.';

export const SITE_NAME = 'CPT Deals';
export const SITE_TAGLINE = 'What’s on special in Cape Town today?';
