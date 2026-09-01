/**
 * Selection, filtering and sorting rules for published specials.
 * Kept free of React so it can be unit-tested directly.
 */
import {
  formatRand,
  formatTimeRange,
  isExpiringSoon,
  isOpenNow,
  isWithinValidity,
  needsRecheck,
  runsOnDay,
  type ZonedNow,
} from './time';
import { filterSuburbFor, WEEKDAY_NAMES } from './types';
import type {
  FilterKey,
  SortKey,
  SpecialCategory,
  SpecialKind,
  SpecialWithRestaurant,
  Suburb,
  Weekday,
} from './types';

/**
 * The public gate. A special reaches visitors only when it is active, has been
 * verified by an administrator, and today falls inside its validity window.
 * The same rules are enforced in the database by row-level security.
 */
export function isPubliclyVisible(
  special: Pick<
    SpecialWithRestaurant,
    'active' | 'verification_status' | 'valid_from' | 'valid_until'
  >,
  isoDate: string,
): boolean {
  if (!special.active) return false;
  if (special.verification_status !== 'verified') return false;
  return isWithinValidity(special, isoDate);
}

/**
 * Narrow to the chosen suburbs. An empty selection means "everywhere", which
 * is what a visitor sees when they first arrive.
 */
/**
 * The message that goes into a WhatsApp thread when someone shares a special.
 *
 * Written to survive being read on its own, with no card around it: what the
 * offer is, where, when, and what it costs. Plain text with newlines, because
 * that is all a share sheet carries — no markdown, no formatting.
 *
 * The link is added by the share button rather than here, so this stays a pure
 * function and the tests do not need a browser.
 */
export function shareMessage(special: SpecialWithRestaurant): string {
  const price = formatRand(special.price);
  const when = formatTimeRange(special.start_time, special.end_time);
  const days = special.days_of_week
    .slice()
    .sort((a, b) => a - b)
    .map((day) => WEEKDAY_NAMES[day])
    .join(', ');

  const headline = price ? `${special.title} — ${price}` : special.title;
  const lines = [
    `${headline} at ${special.restaurant.name}`,
    special.restaurant.street_address,
    // "Every day" reads better than listing all seven.
    special.days_of_week.length === 7 ? `Every day, ${when}` : `${days} — ${when}`,
  ];
  return lines.join('\n');
}

/**
 * Free-text search across the fields someone would actually type.
 *
 * Venue name, offer title, description, category and street address, plus the
 * suburb — so "Kloof", "burger", "Long Street" and "Chicks" all find something.
 * Every word in the query must match somewhere, in any field and in any order:
 * "sea point sushi" narrows, rather than returning everything in Sea Point.
 *
 * Accents are stripped on both sides, so searching "cafe" finds "Café" and
 * "mas" finds "Una Más" — a phone keyboard makes accents hard work, and nobody
 * should have to produce one to find a taqueria.
 */
function normalise(text: string): string {
  return text
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase();
}

export function searchSpecials(
  all: SpecialWithRestaurant[],
  query: string,
): SpecialWithRestaurant[] {
  const words = normalise(query).split(/\s+/).filter(Boolean);
  if (words.length === 0) return all;

  return all.filter((special) => {
    const haystack = normalise(
      [
        special.restaurant.name,
        special.restaurant.street_address,
        special.restaurant.suburb,
        special.restaurant.categories.join(' '),
        special.title,
        special.description,
        special.category,
      ].join(' '),
    );
    return words.every((word) => haystack.includes(word));
  });
}

export function inSuburbs(
  all: SpecialWithRestaurant[],
  suburbs: Suburb[],
): SpecialWithRestaurant[] {
  if (suburbs.length === 0) return all;
  // Match on the filter group, so choosing Green Point also brings in Mouille
  // Point and choosing Gardens brings in the slopes above it.
  return all.filter((special) => suburbs.includes(filterSuburbFor(special.restaurant.suburb)));
}

/**
 * Which half of the site a special belongs to. Breakfast, lunch and dinner are
 * food; happy hour sits with drinks, which is how people read it even when a
 * few bars discount snacks alongside the cocktails.
 */
export function kindOf(category: SpecialCategory): Exclude<SpecialKind, 'all'> {
  return category === 'drinks' || category === 'happy_hour' ? 'drinks' : 'food';
}

/** Narrow to food or drinks. 'all' is the pass-through the site opens on. */
export function inKind(all: SpecialWithRestaurant[], kind: SpecialKind): SpecialWithRestaurant[] {
  if (kind === 'all') return all;
  return all.filter((special) => kindOf(special.category) === kind);
}

export function publishedSpecials(
  all: SpecialWithRestaurant[],
  isoDate: string,
  suburbs: Suburb[] = [],
  kind: SpecialKind = 'all',
): SpecialWithRestaurant[] {
  return inKind(
    inSuburbs(
      all.filter((special) => special.restaurant.active && isPubliclyVisible(special, isoDate)),
      suburbs,
    ),
    kind,
  );
}

/** Specials shown when a visitor taps a weekday button. */
export function specialsForDay(
  all: SpecialWithRestaurant[],
  day: Weekday,
  isoDate: string,
  suburbs: Suburb[] = [],
  kind: SpecialKind = 'all',
): SpecialWithRestaurant[] {
  return publishedSpecials(all, isoDate, suburbs, kind).filter((special) =>
    runsOnDay(special, day),
  );
}

/** Verified-special count shown beside each weekday button. */
export function countsByDay(
  all: SpecialWithRestaurant[],
  isoDate: string,
  suburbs: Suburb[] = [],
  kind: SpecialKind = 'all',
): Record<Weekday, number> {
  const counts = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0 } as Record<Weekday, number>;
  for (const special of publishedSpecials(all, isoDate, suburbs, kind)) {
    for (const day of special.days_of_week) counts[day] += 1;
  }
  return counts;
}

/** How many specials each suburb has today, for the suburb filter row. */
export function countsBySuburb(
  all: SpecialWithRestaurant[],
  isoDate: string,
  day: Weekday,
  kind: SpecialKind = 'all',
): Record<string, number> {
  const counts: Record<string, number> = {};
  for (const special of publishedSpecials(all, isoDate, [], kind)) {
    if (!runsOnDay(special, day)) continue;
    const suburb = filterSuburbFor(special.restaurant.suburb);
    counts[suburb] = (counts[suburb] ?? 0) + 1;
  }
  return counts;
}

export interface Coords {
  latitude: number;
  longitude: number;
}

/** Great-circle distance in kilometres. */
export function distanceKm(a: Coords, b: Coords): number {
  const toRad = (deg: number) => (deg * Math.PI) / 180;
  const earthRadiusKm = 6371;
  const dLat = toRad(b.latitude - a.latitude);
  const dLon = toRad(b.longitude - a.longitude);
  const lat1 = toRad(a.latitude);
  const lat2 = toRad(b.latitude);
  const h = Math.sin(dLat / 2) ** 2 + Math.sin(dLon / 2) ** 2 * Math.cos(lat1) * Math.cos(lat2);
  return 2 * earthRadiusKm * Math.asin(Math.min(1, Math.sqrt(h)));
}

export function distanceForSpecial(
  special: SpecialWithRestaurant,
  from: Coords | null,
): number | null {
  if (!from) return null;
  const { latitude, longitude } = special.restaurant;
  if (latitude === null || longitude === null) return null;
  return distanceKm(from, { latitude, longitude });
}

function matchesFilter(special: SpecialWithRestaurant, filter: FilterKey, now: ZonedNow): boolean {
  switch (filter) {
    case 'food':
    case 'drinks':
    case 'breakfast':
    case 'lunch':
    case 'dinner':
    case 'happy_hour':
      return special.category === filter;
    case 'vegetarian':
      return special.dietary_tags.includes('vegetarian') || special.dietary_tags.includes('vegan');
    case 'under_150':
      return special.price !== null && special.price < 150;
    case 'under_250':
      return special.price !== null && special.price < 250;
    case 'open_now':
      return isOpenNow(special, now);
    default:
      return true;
  }
}

const CATEGORY_FILTERS: FilterKey[] = [
  'food',
  'drinks',
  'breakfast',
  'lunch',
  'dinner',
  'happy_hour',
];
const PRICE_FILTERS: FilterKey[] = ['under_150', 'under_250'];

/**
 * Filters combine as: category filters OR together, price filters OR together,
 * and the remaining filters AND with everything else. That matches how people
 * read a filter row — "food or drinks, under R250, open now".
 */
export function applyFilters(
  specials: SpecialWithRestaurant[],
  active: FilterKey[],
  now: ZonedNow,
): SpecialWithRestaurant[] {
  if (active.length === 0) return specials;

  const categories = active.filter((f) => CATEGORY_FILTERS.includes(f));
  const prices = active.filter((f) => PRICE_FILTERS.includes(f));
  const others = active.filter((f) => !CATEGORY_FILTERS.includes(f) && !PRICE_FILTERS.includes(f));

  return specials.filter((special) => {
    if (categories.length && !categories.some((f) => matchesFilter(special, f, now))) {
      return false;
    }
    if (prices.length && !prices.some((f) => matchesFilter(special, f, now))) {
      return false;
    }
    return others.every((f) => matchesFilter(special, f, now));
  });
}

/** Sort in place-safe fashion (returns a new array). */
export function sortSpecials(
  specials: SpecialWithRestaurant[],
  sort: SortKey,
  now: ZonedNow,
  from: Coords | null,
): SpecialWithRestaurant[] {
  const list = [...specials];

  switch (sort) {
    case 'price_asc':
      return list.sort((a, b) => {
        const priceA = a.price ?? Number.POSITIVE_INFINITY;
        const priceB = b.price ?? Number.POSITIVE_INFINITY;
        if (priceA !== priceB) return priceA - priceB;
        return a.title.localeCompare(b.title);
      });

    case 'nearest':
      return list.sort((a, b) => {
        // Venues without published coordinates sort last rather than disappearing.
        const distA = distanceForSpecial(a, from) ?? Number.POSITIVE_INFINITY;
        const distB = distanceForSpecial(b, from) ?? Number.POSITIVE_INFINITY;
        if (distA !== distB) return distA - distB;
        return a.restaurant.name.localeCompare(b.restaurant.name);
      });

    case 'recently_verified':
      return list.sort((a, b) => b.last_verified_at.localeCompare(a.last_verified_at));

    case 'expiring_soon':
      return list.sort((a, b) => {
        const endA = a.valid_until ?? '9999-12-31';
        const endB = b.valid_until ?? '9999-12-31';
        if (endA !== endB) return endA.localeCompare(endB);
        return a.title.localeCompare(b.title);
      });

    case 'recommended':
    default:
      return list.sort((a, b) => {
        if (a.featured !== b.featured) return a.featured ? -1 : 1;
        const openA = isOpenNow(a, now);
        const openB = isOpenNow(b, now);
        if (openA !== openB) return openA ? -1 : 1;
        const soonA = isExpiringSoon(a, now.date);
        const soonB = isExpiringSoon(b, now.date);
        if (soonA !== soonB) return soonA ? -1 : 1;
        if (a.last_verified_at !== b.last_verified_at) {
          return b.last_verified_at.localeCompare(a.last_verified_at);
        }
        return a.restaurant.name.localeCompare(b.restaurant.name);
      });
  }
}

/** Badge state shown on a card. */
export function freshnessLabel(
  special: SpecialWithRestaurant,
  isoDate: string,
): 'expiring_soon' | 'needs_recheck' | 'verified' {
  if (isExpiringSoon(special, isoDate)) return 'expiring_soon';
  if (needsRecheck(special, isoDate)) return 'needs_recheck';
  return 'verified';
}

/** How many food and drinks specials run on a given day, for the toggle labels. */
export function countsByKind(
  all: SpecialWithRestaurant[],
  isoDate: string,
  day: Weekday,
  suburbs: Suburb[] = [],
): Record<Exclude<SpecialKind, 'all'>, number> {
  const counts = { food: 0, drinks: 0 };
  for (const special of publishedSpecials(all, isoDate, suburbs)) {
    if (!runsOnDay(special, day)) continue;
    counts[kindOf(special.category)] += 1;
  }
  return counts;
}
