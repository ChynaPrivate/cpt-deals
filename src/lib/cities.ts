/**
 * The cities this site covers.
 *
 * Until now the whole thing was Cape Town, and "which suburbs exist" was a
 * single flat list. Plettenberg Bay is the first second city, so the shape had
 * to change — but only in one direction: a city now owns its own suburb list,
 * its own filter buttons and its own copy, and everything else derives from
 * this file.
 *
 * Two things were deliberately NOT done here:
 *
 * 1. The Cape Town page keeps living at "/". Moving it to "/cape-town" would
 *    have been tidier, but every share link already sent into WhatsApp points
 *    at the old URL, and anyone who added the site to their home screen has
 *    "/" as their start_url. A tidier route is not worth breaking those.
 *
 * 2. No per-city timezone. Both cities are Africa/Johannesburg and South
 *    Africa has one zone, so a `timezone` field would be a column that never
 *    varies. It goes in when a city outside SAST does.
 */

/** Slugs are the URL segment. Cape Town's is empty because it lives at "/". */
export const CITIES = [
  {
    slug: '',
    name: 'Cape Town',
    /** Shown under the logo. */
    label: 'Cape Town',
    /** Used in page titles and share text. */
    longName: 'Cape Town',
    tagline: "What's on special in Cape Town today?",
    blurb:
      'The Happy Hours lists offers at venues in the Cape Town City Bowl and the near Atlantic Seaboard. Every listing links to the source it was checked against.',
    suburbs: [
      'Gardens',
      'Tamboerskloof',
      'Oranjezicht',
      'Vredehoek',
      'Cape Town City Centre',
      'Sea Point',
      'Green Point',
      'Mouille Point',
      'Camps Bay',
      'Victoria & Alfred Waterfront',
    ],
    /** Which suburbs get a filter button. The thin ones are grouped instead. */
    filterSuburbs: [
      'Gardens',
      'Cape Town City Centre',
      'Sea Point',
      'Green Point',
      'Camps Bay',
      'Victoria & Alfred Waterfront',
    ],
  },
  {
    slug: 'plett',
    name: 'Plettenberg Bay',
    /* Short, because the switch puts both cities on one line and
       "CAPE TOWN · PLETTENBERG BAY" wraps mid-word on a 320px phone. It is
       also what everyone actually calls it. */
    label: 'Plett',
    longName: 'Plettenberg Bay',
    tagline: "What's on special in Plett today?",
    blurb:
      'The Happy Hours lists offers at venues in and around Plettenberg Bay. Every listing links to the source it was checked against. Plett is seasonal — a lot of offers here run only out of season, so the dates matter more than they do in the city.',
    /*
      Area names as Plett Tourism and the venues themselves use them, rather
      than anything invented. Keurbooms (the river and N2 village) and
      Keurboomstrand (the coastal strip) really are treated as separate places
      locally, and Harkerville and The Crags are distinct enough that folding
      them together would put a forest lodge and an N2 farm stall under one
      button.
    */
    suburbs: [
      'Plett Central',
      'Lookout Beach',
      'Central Beach',
      'Beacon Isle',
      'Robberg Beach',
      'Piesang Valley',
      'Keurbooms',
      'Keurboomstrand',
      'The Crags',
      'Harkerville',
      'Goose Valley',
      'Bitou Valley',
      "Nature's Valley",
    ],
    /*
      Only four buttons to start with. The rule from Cape Town applies: a
      button that reads "0" most days is noise, and Plett launches with a
      handful of venues. The rest are reachable under "All areas" and get a
      button once they can carry listings on most days.
    */
    filterSuburbs: ['Plett Central', 'Keurbooms', 'The Crags', 'Harkerville'],
  },
] as const;

export type City = (typeof CITIES)[number];
export type CityName = City['name'];
export type CitySlug = City['slug'];

/** Every suburb across every city — this is the database's allowlist. */
export const ALL_SUBURBS = CITIES.flatMap((city) => city.suburbs as readonly string[]);

export function cityBySlug(slug: string): City | undefined {
  return CITIES.find((city) => city.slug === slug);
}

export function cityByName(name: string): City | undefined {
  return CITIES.find((city) => city.name === name);
}

/** The path a city's page lives at. Cape Town is "/", the rest are "/<slug>". */
export function cityPath(city: City): string {
  return city.slug === '' ? '/' : `/${city.slug}`;
}

/**
 * Which city a suburb belongs to.
 *
 * Used to scope a list of specials without a database round trip, and to catch
 * a venue filed under a suburb that does not belong to the city it claims.
 */
export function cityForSuburb(suburb: string): City | undefined {
  return CITIES.find((city) => (city.suburbs as readonly string[]).includes(suburb));
}
