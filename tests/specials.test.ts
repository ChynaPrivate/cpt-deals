import { describe, expect, it } from 'vitest';
import {
  applyFilters,
  countsByDay,
  countsByKind,
  countsBySuburb,
  inKind,
  kindOf,
  inSuburbs,
  searchSpecials,
  shareMessage,
  distanceKm,
  freshnessLabel,
  isPubliclyVisible,
  publishedSpecials,
  sortSpecials,
  specialsForDay,
} from '@/lib/specials';
import { joinSeed, RESTAURANTS_SEED, SPECIALS_SEED } from '@/lib/data/seed';
import {
  FILTER_SUBURBS,
  SUBURBS,
  SUBURB_FILTER_GROUP,
  filterSuburbFor,
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

describe('the food / drinks split', () => {
  it('puts every category on exactly one side', () => {
    expect(kindOf('food')).toBe('food');
    expect(kindOf('breakfast')).toBe('food');
    expect(kindOf('lunch')).toBe('food');
    expect(kindOf('dinner')).toBe('food');
    expect(kindOf('drinks')).toBe('drinks');
    expect(kindOf('happy_hour')).toBe('drinks');
  });

  it('splits the real seed data with nothing left over', () => {
    const all = joinSeed();
    const food = inKind(all, 'food').length;
    const drinks = inKind(all, 'drinks').length;
    expect(food + drinks).toBe(all.length);
    expect(food).toBeGreaterThan(0);
    expect(drinks).toBeGreaterThan(0);
  });

  it("'all' is a pass-through", () => {
    const all = joinSeed();
    expect(inKind(all, 'all')).toHaveLength(all.length);
  });

  it('narrows a day to one side', () => {
    const supper = make({ category: 'dinner', days_of_week: [4] as Weekday[] });
    const pint = make({ category: 'happy_hour', days_of_week: [4] as Weekday[] });
    const all = [supper, pint];

    expect(specialsForDay(all, 4, TODAY, [], 'all')).toHaveLength(2);
    expect(specialsForDay(all, 4, TODAY, [], 'food')).toHaveLength(1);
    expect(specialsForDay(all, 4, TODAY, [], 'drinks')).toHaveLength(1);
    expect(specialsForDay(all, 4, TODAY, [], 'drinks')[0].id).toBe(pint.id);
  });

  it('carries the split through to the weekday counts', () => {
    const supper = make({ category: 'dinner', days_of_week: [4] as Weekday[] });
    const pint = make({ category: 'drinks', days_of_week: [4] as Weekday[] });
    const all = [supper, pint];

    expect(countsByDay(all, TODAY, [], 'all')[4]).toBe(2);
    expect(countsByDay(all, TODAY, [], 'food')[4]).toBe(1);
    expect(countsByDay(all, TODAY, [], 'drinks')[4]).toBe(1);
  });

  it('counts both sides regardless of which is selected, so the toggle never reads zero by accident', () => {
    const supper = make({ category: 'lunch', days_of_week: [4] as Weekday[] });
    const pint = make({ category: 'happy_hour', days_of_week: [4] as Weekday[] });
    const counts = countsByKind([supper, pint], TODAY, 4);
    expect(counts.food).toBe(1);
    expect(counts.drinks).toBe(1);
  });

  it('ignores specials that do not run on the chosen day', () => {
    const monday = make({ category: 'drinks', days_of_week: [1] as Weekday[] });
    const counts = countsByKind([monday], TODAY, 4);
    expect(counts.drinks).toBe(0);
  });
});

describe('the seed matches what the database will accept', () => {
  it('gives every special both a start and an end time, or neither', () => {
    // Postgres enforces this with the specials_times_paired constraint, and it
    // caught a listing that had a start with no end. Catching it here means
    // finding out at `npm test` rather than halfway through a push.
    const halfTimed = SPECIALS_SEED.filter(
      (s) => (s.start_time === null) !== (s.end_time === null),
    );
    expect(halfTimed.map((s) => s.title)).toEqual([]);
  });
});

describe('FILTER_SUBURBS', () => {
  it('only offers suburbs the database actually allows', () => {
    for (const suburb of FILTER_SUBURBS) {
      expect(SUBURBS).toContain(suburb);
    }
  });

  it('is exactly six, so the grid stays two by three', () => {
    expect(FILTER_SUBURBS).toHaveLength(6);
    expect(new Set(FILTER_SUBURBS).size).toBe(6);
  });

  it('hides no listing — every seeded suburb still has venues that show under All suburbs', () => {
    const seeded = new Set(RESTAURANTS_SEED.map((r) => r.suburb));
    for (const suburb of seeded) {
      expect(SUBURBS).toContain(suburb);
    }
  });

  /**
   * The real guard on grouping: every suburb a venue actually sits in must be
   * reachable from one of the six buttons. If someone adds a venue in a new
   * suburb and forgets to group it, this fails rather than the listing quietly
   * becoming unfilterable.
   */
  it('leaves no seeded suburb unreachable from a filter button', () => {
    for (const restaurant of RESTAURANTS_SEED) {
      expect(FILTER_SUBURBS).toContain(filterSuburbFor(restaurant.suburb));
    }
  });

  it('groups each stray suburb onto a suburb that has a button', () => {
    for (const [from, to] of Object.entries(SUBURB_FILTER_GROUP)) {
      expect(SUBURBS).toContain(from);
      expect(FILTER_SUBURBS).toContain(to);
      // A group must not point at another grouped suburb, or the chain breaks.
      expect(SUBURB_FILTER_GROUP).not.toHaveProperty(to as string);
    }
  });

  it('leaves an ungrouped suburb as itself', () => {
    expect(filterSuburbFor('Sea Point')).toBe('Sea Point');
    expect(filterSuburbFor('Mouille Point')).toBe('Green Point');
    expect(filterSuburbFor('Oranjezicht')).toBe('Gardens');
  });
});

describe('search', () => {
  const kloof: SpecialWithRestaurant = {
    ...make({ title: 'Two-for-one burgers', description: 'Buy one, get one.' }),
    restaurant: {
      ...venue,
      id: 'v-kloof',
      name: 'Una M\u00e1s Mezcaler\u00eda',
      street_address: '117 Kloof Street',
      suburb: 'Gardens',
      categories: ['Mexican', 'Cocktails'],
    },
  };
  const long: SpecialWithRestaurant = {
    ...make({ title: '2 Chicken Sandos', description: 'Schnitzel burgers, two for R140.' }),
    restaurant: {
      ...venue,
      id: 'v-long',
      name: 'Chicks and Chops',
      street_address: '163 Long Street',
      suburb: 'Cape Town City Centre',
      categories: ['Chicken', 'Burgers'],
    },
  };
  const all = [kloof, long];
  const titles = (q: string) => searchSpecials(all, q).map((s) => s.title);

  it('returns everything for an empty or whitespace query', () => {
    expect(searchSpecials(all, '')).toHaveLength(2);
    expect(searchSpecials(all, '   ')).toHaveLength(2);
  });

  it('finds a venue by name', () => {
    expect(titles('chicks')).toEqual(['2 Chicken Sandos']);
  });

  it('finds a venue by street, which is how people describe a place', () => {
    expect(titles('kloof')).toEqual(['Two-for-one burgers']);
    expect(titles('long street')).toEqual(['2 Chicken Sandos']);
  });

  it('searches the offer text and the category, not just the venue', () => {
    expect(titles('sandos')).toEqual(['2 Chicken Sandos']);
    expect(titles('schnitzel')).toEqual(['2 Chicken Sandos']);
    expect(titles('mexican')).toEqual(['Two-for-one burgers']);
  });

  it('ignores accents, because a phone keyboard makes them hard work', () => {
    expect(titles('una mas')).toEqual(['Two-for-one burgers']);
    expect(titles('mezcaleria')).toEqual(['Two-for-one burgers']);
  });

  it('requires every word, so extra words narrow rather than widen', () => {
    expect(titles('chicken sandos')).toEqual(['2 Chicken Sandos']);
    // "burgers" matches both; adding "chicks" should leave only one.
    expect(titles('burgers')).toHaveLength(2);
    expect(titles('burgers chicks')).toEqual(['2 Chicken Sandos']);
  });

  it('matches words in any order', () => {
    expect(titles('sandos chicken')).toEqual(titles('chicken sandos'));
  });

  it('is case-insensitive', () => {
    expect(titles('CHICKS')).toEqual(titles('chicks'));
  });

  it('returns nothing when nothing matches, rather than everything', () => {
    expect(searchSpecials(all, 'sushi')).toEqual([]);
  });
});

describe('the share message', () => {
  const base = {
    ...venue,
    id: 'v-share',
    name: 'Chicks and Chops',
    street_address: '163 Long Street',
    suburb: 'Cape Town City Centre' as const,
  };

  it('reads on its own, with no card around it', () => {
    const special: SpecialWithRestaurant = {
      ...make({
        title: '2 Chicken Sandos',
        price: 140,
        days_of_week: [3],
        start_time: '11:00',
        end_time: '23:59',
      }),
      restaurant: base,
    };
    expect(shareMessage(special)).toBe(
      '2 Chicken Sandos \u2014 R140 at Chicks and Chops\n' +
        '163 Long Street\n' +
        'Wednesday \u2014 11:00am \u2013 11:59pm',
    );
  });

  it('leaves the dash out when there is no price', () => {
    const special: SpecialWithRestaurant = {
      ...make({ title: 'Happy hour', price: null, days_of_week: [5] }),
      restaurant: base,
    };
    expect(shareMessage(special)).toContain('Happy hour at Chicks and Chops');
    expect(shareMessage(special)).not.toContain('\u2014 null');
  });

  it('says "Every day" rather than listing all seven', () => {
    const special: SpecialWithRestaurant = {
      ...make({ title: 'All week', days_of_week: [1, 2, 3, 4, 5, 6, 7] }),
      restaurant: base,
    };
    expect(shareMessage(special)).toContain('Every day');
    expect(shareMessage(special)).not.toContain('Monday, Tuesday');
  });

  it('lists several days in weekday order, however they were stored', () => {
    const special: SpecialWithRestaurant = {
      ...make({ title: 'Weekend', days_of_week: [7, 5, 6] }),
      restaurant: base,
    };
    expect(shareMessage(special)).toContain('Friday, Saturday, Sunday');
  });

  it('falls back to "All day" when no times are set', () => {
    const special: SpecialWithRestaurant = {
      ...make({ title: 'Any time', days_of_week: [2], start_time: null, end_time: null }),
      restaurant: base,
    };
    expect(shareMessage(special)).toContain('Tuesday \u2014 All day');
  });
});
