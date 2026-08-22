import { describe, expect, it } from 'vitest';
import {
  applyFilters,
  countsByDay,
  countsBySuburb,
  inSuburbs,
  distanceKm,
  freshnessLabel,
  isPubliclyVisible,
  publishedSpecials,
  sortSpecials,
  specialsForDay,
} from '@/lib/specials';
import { joinSeed, RESTAURANTS_SEED, SPECIALS_SEED } from '@/lib/data/seed';
import {
  SUBURBS,
  type Restaurant,
  type Special,
  type SpecialWithRestaurant,
  type Weekday,
} from '@/lib/types';
import type { ZonedNow } from '@/lib/time';

const TODAY = '2026-08-20';
const NOW: ZonedNow = { date: TODAY, weekday: 4, minutes: 17 * 60 };

const venue: Restaurant = {
  ...RESTAURANTS_SEED[0],
  id: 'venue-1',
  latitude: -33.93,
  longitude: 18.41,
};

let counter = 0;

/** A plain, published special. Every field the tests care about is explicit. */
function make(overrides: Partial<Special>): SpecialWithRestaurant {
  counter += 1;
  return {
    ...SPECIALS_SEED[0],
    id: `test-${counter}`,
    restaurant_id: venue.id,
    days_of_week: [1, 2, 3, 4, 5, 6, 7] as Weekday[],
    price: null,
    original_price: null,
    dietary_tags: [],
    start_time: null,
    end_time: null,
    valid_from: null,
    valid_until: null,
    last_verified_at: '2026-08-20',
    verification_status: 'verified',
    featured: false,
    active: true,
    ...overrides,
    restaurant: venue,
  };
}

describe('the public gate', () => {
  it('hides anything that is not active, verified and in date', () => {
    expect(isPubliclyVisible(make({}), TODAY)).toBe(true);
    expect(isPubliclyVisible(make({ active: false }), TODAY)).toBe(false);
    expect(isPubliclyVisible(make({ verification_status: 'unverified' }), TODAY)).toBe(false);
    expect(isPubliclyVisible(make({ verification_status: 'needs_recheck' }), TODAY)).toBe(false);
    expect(isPubliclyVisible(make({ valid_until: '2026-08-19' }), TODAY)).toBe(false);
    expect(isPubliclyVisible(make({ valid_from: '2026-08-21' }), TODAY)).toBe(false);
  });

  it('hides specials belonging to an inactive restaurant', () => {
    const hidden = { ...make({}), restaurant: { ...venue, active: false } };
    expect(publishedSpecials([hidden], TODAY)).toHaveLength(0);
  });

  it('includes an offer on the exact first and last day of its window', () => {
    expect(isPubliclyVisible(make({ valid_from: TODAY, valid_until: TODAY }), TODAY)).toBe(true);
  });
});

describe('choosing a day', () => {
  const monday = make({ days_of_week: [1], title: 'Monday only' });
  const weekend = make({ days_of_week: [6, 7], title: 'Weekend' });
  const everyday = make({ title: 'Every day' });

  it('returns only specials that run on the chosen day', () => {
    const all = [monday, weekend, everyday];
    expect(
      specialsForDay(all, 1, TODAY)
        .map((s) => s.title)
        .sort(),
    ).toEqual(['Every day', 'Monday only']);
    expect(
      specialsForDay(all, 6, TODAY)
        .map((s) => s.title)
        .sort(),
    ).toEqual(['Every day', 'Weekend']);
    expect(specialsForDay(all, 3, TODAY).map((s) => s.title)).toEqual(['Every day']);
  });

  it('counts each day independently, including multi-day offers', () => {
    const counts = countsByDay([monday, weekend, everyday], TODAY);
    expect(counts[1]).toBe(2);
    expect(counts[2]).toBe(1);
    expect(counts[6]).toBe(2);
    expect(counts[7]).toBe(2);
  });

  it('counts nothing for a day with no verified specials', () => {
    const counts = countsByDay([monday], TODAY);
    expect(counts[4]).toBe(0);
  });
});

describe('suburbs', () => {
  const gardens = make({ title: 'Gardens one' });
  const seaPoint: SpecialWithRestaurant = {
    ...make({ title: 'Sea Point one' }),
    restaurant: { ...venue, id: 'venue-2', suburb: 'Sea Point' },
  };
  const all = [gardens, seaPoint];

  it('shows every suburb when none is selected', () => {
    expect(publishedSpecials(all, TODAY, [])).toHaveLength(2);
    expect(specialsForDay(all, 4, TODAY, [])).toHaveLength(2);
  });

  it('narrows to the chosen suburbs', () => {
    expect(inSuburbs(all, ['Sea Point']).map((s) => s.title)).toEqual(['Sea Point one']);
    expect(specialsForDay(all, 4, TODAY, ['Gardens']).map((s) => s.title)).toEqual(['Gardens one']);
  });

  it('combines several chosen suburbs', () => {
    expect(inSuburbs(all, ['Gardens', 'Sea Point'])).toHaveLength(2);
  });

  it('counts per day within the chosen suburbs', () => {
    expect(countsByDay(all, TODAY, ['Sea Point'])[4]).toBe(1);
    expect(countsByDay(all, TODAY, [])[4]).toBe(2);
  });

  it('counts per suburb for the chosen day', () => {
    const counts = countsBySuburb(all, TODAY, 4);
    expect(counts.Gardens).toBe(1);
    expect(counts['Sea Point']).toBe(1);
  });

  it('reports zero for a suburb with nothing on that day', () => {
    const mondayOnly: SpecialWithRestaurant = {
      ...make({ days_of_week: [1], title: 'Monday only' }),
      restaurant: { ...venue, id: 'venue-3', suburb: 'Camps Bay' },
    };
    expect(countsBySuburb([mondayOnly], TODAY, 4)['Camps Bay']).toBeUndefined();
    expect(countsBySuburb([mondayOnly], TODAY, 1)['Camps Bay']).toBe(1);
  });
});

describe('filters', () => {
  const cheapFood = make({ category: 'food', price: 90, title: 'Cheap food' });
  const midDinner = make({ category: 'dinner', price: 225, title: 'Set menu' });
  const pricyDrinks = make({ category: 'drinks', price: 300, title: 'Fancy drinks' });
  const veg = make({ category: 'food', price: null, dietary_tags: ['vegetarian'], title: 'Veg' });
  const all = [cheapFood, midDinner, pricyDrinks, veg];

  it('returns everything when nothing is selected', () => {
    expect(applyFilters(all, [], NOW)).toHaveLength(4);
  });

  it('combines category filters with OR', () => {
    const result = applyFilters(all, ['food', 'drinks'], NOW).map((s) => s.title);
    expect(result.sort()).toEqual(['Cheap food', 'Fancy drinks', 'Veg']);
  });

  it('applies price ceilings', () => {
    expect(applyFilters(all, ['under_150'], NOW).map((s) => s.title)).toEqual(['Cheap food']);
    expect(
      applyFilters(all, ['under_250'], NOW)
        .map((s) => s.title)
        .sort(),
    ).toEqual(['Cheap food', 'Set menu']);
  });

  it('excludes discount-only offers from price filters', () => {
    expect(applyFilters([veg], ['under_250'], NOW)).toHaveLength(0);
  });

  it('combines a category filter with a price filter using AND', () => {
    expect(applyFilters(all, ['food', 'under_150'], NOW).map((s) => s.title)).toEqual([
      'Cheap food',
    ]);
  });

  it('matches vegan as vegetarian too', () => {
    const vegan = make({ dietary_tags: ['vegan'], title: 'Vegan' });
    expect(applyFilters([vegan], ['vegetarian'], NOW).map((s) => s.title)).toEqual(['Vegan']);
  });

  it('filters by open now', () => {
    const openNow = make({ days_of_week: [4], start_time: '16:00', end_time: '18:00' });
    const closedNow = make({ days_of_week: [4], start_time: '08:00', end_time: '10:00' });
    expect(applyFilters([openNow, closedNow], ['open_now'], NOW)).toHaveLength(1);
  });
});

describe('sorting', () => {
  const cheap = make({ price: 90, title: 'B cheap', last_verified_at: '2026-08-01' });
  const dear = make({ price: 300, title: 'A dear', last_verified_at: '2026-08-19' });
  const noPrice = make({ price: null, title: 'C no price', last_verified_at: '2026-08-10' });
  const list = [dear, cheap, noPrice];

  it('sorts by price with discount offers last', () => {
    expect(sortSpecials(list, 'price_asc', NOW, null).map((s) => s.title)).toEqual([
      'B cheap',
      'A dear',
      'C no price',
    ]);
  });

  it('sorts by most recently verified', () => {
    expect(sortSpecials(list, 'recently_verified', NOW, null).map((s) => s.title)).toEqual([
      'A dear',
      'C no price',
      'B cheap',
    ]);
  });

  it('sorts by soonest end date, with no-end-date offers last', () => {
    const soon = make({ valid_until: '2026-08-25', title: 'Soon' });
    const later = make({ valid_until: '2026-12-01', title: 'Later' });
    const never = make({ title: 'Never' });
    expect(
      sortSpecials([never, later, soon], 'expiring_soon', NOW, null).map((s) => s.title),
    ).toEqual(['Soon', 'Later', 'Never']);
  });

  it('puts featured offers first under Recommended', () => {
    const featured = make({ featured: true, title: 'Featured' });
    const plain = make({ title: 'Plain' });
    expect(sortSpecials([plain, featured], 'recommended', NOW, null)[0].title).toBe('Featured');
  });

  it('keeps venues without coordinates last when sorting by distance', () => {
    const near: SpecialWithRestaurant = {
      ...make({ title: 'Near' }),
      restaurant: { ...venue, latitude: -33.93, longitude: 18.41 },
    };
    const far: SpecialWithRestaurant = {
      ...make({ title: 'Far' }),
      restaurant: { ...venue, latitude: -33.98, longitude: 18.46 },
    };
    const unknown: SpecialWithRestaurant = {
      ...make({ title: 'Unknown' }),
      restaurant: { ...venue, latitude: null, longitude: null },
    };
    const here = { latitude: -33.929, longitude: 18.409 };
    expect(sortSpecials([unknown, far, near], 'nearest', NOW, here).map((s) => s.title)).toEqual([
      'Near',
      'Far',
      'Unknown',
    ]);
  });

  it('leaves order stable when location was declined', () => {
    const result = sortSpecials(list, 'nearest', NOW, null).map((s) => s.title);
    expect(result).toHaveLength(3);
  });
});

describe('distance', () => {
  it('measures a short Cape Town hop in kilometres', () => {
    const gardens = { latitude: -33.9295, longitude: 18.4098 };
    const seaPoint = { latitude: -33.9165, longitude: 18.3854 };
    const km = distanceKm(gardens, seaPoint);
    expect(km).toBeGreaterThan(2);
    expect(km).toBeLessThan(4);
  });
});

describe('freshness badge', () => {
  it('prefers expiring soon over the stale warning', () => {
    expect(freshnessLabel(make({ valid_until: '2026-08-22' }), TODAY)).toBe('expiring_soon');
    expect(freshnessLabel(make({ last_verified_at: '2026-06-01' }), TODAY)).toBe('needs_recheck');
    expect(freshnessLabel(make({}), TODAY)).toBe('verified');
  });
});

describe('the bundled seed data', () => {
  const seeded = joinSeed();

  it('publishes something on every day of the week', () => {
    const counts = countsByDay(seeded, TODAY);
    for (const day of [1, 2, 3, 4, 5, 6, 7] as Weekday[]) {
      expect(counts[day]).toBeGreaterThan(0);
    }
  });

  it('only contains venues in suburbs the site covers', () => {
    for (const restaurant of RESTAURANTS_SEED) {
      expect(SUBURBS).toContain(restaurant.suburb);
    }
  });

  it('covers more than one suburb', () => {
    const suburbs = new Set(RESTAURANTS_SEED.map((r) => r.suburb));
    expect(suburbs.size).toBeGreaterThan(1);
  });

  it('records a source URL and a verification date for every special', () => {
    for (const special of SPECIALS_SEED) {
      expect(special.source_url).toMatch(/^https?:\/\//);
      expect(special.last_verified_at).toMatch(/^\d{4}-\d{2}-\d{2}$/);
      expect(special.days_of_week.length).toBeGreaterThan(0);
    }
  });

  it('never publishes an offer that has already ended', () => {
    for (const special of SPECIALS_SEED) {
      if (special.valid_until) expect(special.valid_until >= TODAY).toBe(true);
    }
  });
});
