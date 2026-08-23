/**
 * Picks a pictogram for a venue from the categories it already carries.
 *
 * The card used to fall back to the first letter of the name when a venue had
 * no image, which meant a screen full of orange squares reading H, M, R, T.
 * A drawing of what the place actually serves is quicker to scan and does not
 * pretend to be a logo.
 *
 * Deliberately NOT a fetched photo. A restaurant's own photographs and logos
 * belong to the restaurant, and this site has no licence to republish them —
 * so `image_url` stays the way a real logo gets in, filled by an administrator
 * who has permission, and this is what shows until then.
 */
export type VenueIcon =
  | 'cocktail'
  | 'wine'
  | 'beer'
  | 'burger'
  | 'pizza'
  | 'pasta'
  | 'sushi'
  | 'taco'
  | 'steak'
  | 'seafood'
  | 'coffee'
  | 'plate';

/**
 * Ordered most specific first. Three orderings matter and are each easy to get
 * wrong:
 *
 * - Food beats drink. Mamacita's is tagged Mexican AND Cocktails; on a site
 *   about what to eat and drink tonight, the taco tells you more than a third
 *   cocktail glass in a row would.
 * - Burger sits above pizza, so Hudsons The Burger Joint is not drawn as a
 *   pizza slice.
 * - Pizza sits above pasta, so somewhere doing both reads as a pizzeria while
 *   Scala Pasta Bar does not.
 *
 * A bare "Bar" tag is handled separately, below — nearly every restaurant on
 * the site carries one, and letting it match here turned fine-dining rooms
 * into cocktail bars.
 */
const RULES: ReadonlyArray<readonly [VenueIcon, readonly string[]]> = [
  ['wine', ['wine bar', 'wine']],
  ['sushi', ['sushi', 'japanese', 'ramen', 'asian', 'korean', 'thai', 'yakiniku']],
  ['taco', ['mexican', 'tacos', 'taco']],
  ['burger', ['burgers', 'burger']],
  ['pizza', ['pizza']],
  ['pasta', ['pasta', 'italian']],
  ['steak', ['steakhouse', 'grill', 'braai', 'butcher']],
  ['seafood', ['seafood', 'fish', 'oyster', 'belgian']],
  ['coffee', ['café', 'cafe', 'coffee', 'breakfast', 'bakery', 'brunch', 'pastry', 'deli']],
  ['beer', ['beer', 'pub', 'brewery', 'irish', 'tavern', 'ale']],
  ['cocktail', ['cocktails', 'cocktail', 'tequila', 'tiki', 'lounge', 'rooftop', 'late night']],
];

/** Tags that mean "this is a place you eat", so a stray "Bar" should not win. */
const DINING = ['restaurant', 'fine dining', 'bistro', 'tasting menu', 'hotel restaurant'];

export function venueIcon(categories: readonly string[]): VenueIcon {
  const haystack = categories.map((c) => c.toLowerCase());
  const has = (needles: readonly string[]) =>
    haystack.some((c) => needles.some((n) => c.includes(n)));

  for (const [icon, needles] of RULES) {
    if (has(needles)) return icon;
  }

  // Only now does a plain "Bar" count, and only for somewhere that is not
  // primarily a dining room.
  if (has(['bar']) && !has(DINING)) return 'cocktail';

  return 'plate';
}
