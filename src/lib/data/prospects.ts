/**
 * Instagram accounts of venues that are NOT yet listed, for the nightly sweep
 * to watch.
 *
 * The sweep already scans every listed venue's `instagram_url`, which keeps
 * existing listings fresh. This is the other half: places that clearly run
 * specials but whose offers have never appeared anywhere the open web can read
 * — most of Kloof Street, in other words. Watching their accounts turns
 * discovery from a manual afternoon into something that happens while nobody
 * is looking.
 *
 * Nothing here is published. A hit lands in the research queue with no
 * restaurant attached, exactly like a photographed board, and a person types
 * it up.
 *
 * ONLY VERIFIED HANDLES BELONG HERE. Every one below was resolved through the
 * Business Discovery API and checked against the venue's address. Guessing has
 * roughly a one-in-three hit rate and the misses are not harmless — earlier
 * guesses resolved to unrelated businesses in the United States, Albania and
 * Colombia. A wrong handle here would quietly file another country's specials
 * into the queue.
 *
 * `city` is carried from the start so Johannesburg and Durban are new entries
 * rather than a new mechanism.
 *
 * A venue that gets listed should be removed from here — the sweep skips
 * duplicates at runtime, but a test fails if one lingers, so the list cannot
 * quietly rot into a second copy of the restaurant table.
 */
export interface Prospect {
  handle: string;
  name: string;
  suburb: string;
  city: string;
  /** Why it is worth watching — shown to whoever reviews the queue. */
  note?: string;
}

export const PROSPECTS: Prospect[] = [
  // ---------------------------------------------------------------- Gardens
  {
    handle: 'unclaimedbar',
    name: 'Unclaimed Bar',
    suburb: 'Gardens',
    city: 'Cape Town',
    note: '55 Kloof Street. Ran priced drink specials through the World Cup; posts them nowhere else.',
  },
  {
    handle: 'therapyrestaurant',
    name: 'Therapy',
    suburb: 'Gardens',
    city: 'Cape Town',
    note: '5 Park Road. Posts priced offers regularly, though several are hookah rather than food or drink.',
  },
  {
    handle: 'kloofkonbini',
    name: 'Kloof Konbini',
    suburb: 'Gardens',
    city: 'Cape Town',
    note: '121 Kloof Street. Japanese street food, posts often, no specials found yet.',
  },
  {
    handle: 'onosbay',
    name: 'Onosbay',
    suburb: 'Gardens',
    city: 'Cape Town',
    note: '105 Kloof Street. The most active poster on the street by some margin.',
  },
  {
    handle: 'c__a__r__g__o',
    name: 'Cargo',
    suburb: 'Tamboerskloof',
    city: 'Cape Town',
    note: '158 Kloof Street. Credited with a R20 happy hour but has not posted since June 2025 — watch in case it wakes up.',
  },

  // --------------------------------------------------- Cape Town City Centre
  {
    handle: 'theginbar',
    name: 'The Gin Bar',
    suburb: 'Cape Town City Centre',
    city: 'Cape Town',
    note: '64A Wale Street, behind Honest Chocolate. Posts cocktail specials by the weekend.',
  },
  {
    handle: 'talkingtostrangersbar',
    name: 'Talking to Strangers',
    suburb: 'Cape Town City Centre',
    city: 'Cape Town',
    note: '61 Loop Street.',
  },
  {
    handle: 'theathleticclubandsocial',
    name: 'The Athletic Club & Social',
    suburb: 'Cape Town City Centre',
    city: 'Cape Town',
    note: '35 Buitengracht Street. Runs a regular Wine & Social evening.',
  },
  {
    handle: 'openwine_za',
    name: 'Openwine',
    suburb: 'Cape Town City Centre',
    city: 'Cape Town',
    note: 'Posts a wine of the week; worth watching for a by-the-glass offer.',
  },
  {
    handle: 'publikwine',
    name: 'Publik Wine Bar',
    suburb: 'Cape Town City Centre',
    city: 'Cape Town',
    note: 'Runs bar takeovers rather than standing specials, but they are dated and priced.',
  },
  {
    handle: 'leoswinebar',
    name: "Leo's Wine Bar",
    suburb: 'Cape Town City Centre',
    city: 'Cape Town',
  },

  {
    handle: 'soukcpt',
    name: 'Souk',
    suburb: 'Cape Town City Centre',
    city: 'Cape Town',
    note: '163 Long Street, above Chicks and Chops. Cocktail bar, Wed-Sun 6pm-2am. Its own menu page rate-limits, so Instagram may be the only readable source for a happy hour.',
  },
  {
    handle: 'gypsyrabbitcpt',
    name: 'Gypsy Rabbit',
    suburb: 'Cape Town City Centre',
    city: 'Cape Town',
    note: '110 Bree Street. Website is an empty JavaScript shell and there is no Dineplan page, so social is the only channel. Handle unconfirmed \u2014 @gypsyrabbitct also appears in the wild; a sweep error naming the wrong account settles it.',
  },

  // -------------------------------------------------------------- Sea Point
  {
    handle: 'arthursminisuper',
    name: "Arthur's Mini Super",
    suburb: 'Sea Point',
    city: 'Cape Town',
  },
  {
    handle: 'maggylous',
    name: "Maggy Lou's",
    suburb: 'Sea Point',
    city: 'Cape Town',
    note: 'Breakfast and brunch — the category the site is thinnest on.',
  },
  {
    handle: 'kleinskys',
    name: "Kleinsky's Delicatessen",
    suburb: 'Sea Point',
    city: 'Cape Town',
    note: 'Breakfast and deli.',
  },
  {
    handle: 'bootleggercoffeecompany',
    name: 'Bootlegger Coffee Company',
    suburb: 'Sea Point',
    city: 'Cape Town',
    note: 'Chain, but the Sea Point branch is credited with an early-bird coffee price and an evening happy hour.',
  },
];
