/**
 * Pulling the price out of a special's title.
 *
 * Most titles end with the money — "Two Aperol Spritz for R215", "Margarita
 * Social — R300", "Date night, R785". On a card that already shows a price in
 * orange, saying it twice reads like a mistake, so the card strips it from the
 * title and shows it once.
 *
 * This is display only. The stored title is left exactly as researched, because
 * that is what the source said.
 *
 * Two guards keep it from mangling anything:
 *
 * 1. The amount must be at the very END of the title. "R50 margaritas on
 *    Mondays" and "Prego Wednesdays, R200 with a Duchess Spritz" both keep
 *    their price, because removing it would leave a broken sentence.
 * 2. There must be exactly ONE amount. "Two courses R220, three courses R280"
 *    is left alone — stripping the last number would be actively misleading.
 */

/** Any rand amount: R215, R1,100, R62.50, R 90. */
const AMOUNT = /R\s?\d[\d\s.,]*\d|R\s?\d/g;

/**
 * A trailing amount, with whatever joins it to the rest of the title:
 * " for R215", " — R300", ", R785", " R420".
 */
const TRAILING = /\s*(?:[—–,-]\s*)?(?:for\s+)?(R\s?\d[\d.,]*)\s*$/;

export interface TitleAndPrice {
  /** The title with a trailing price removed, or the original title. */
  title: string;
  /** The price found in the title, normalised ("R215"), or null. */
  price: string | null;
}

export function splitTitlePrice(rawTitle: string): TitleAndPrice {
  const amounts = rawTitle.match(AMOUNT);
  // No price, or more than one — leave the title exactly as it is.
  if (!amounts || amounts.length !== 1) return { title: rawTitle, price: null };

  const trailing = TRAILING.exec(rawTitle);
  if (!trailing) return { title: rawTitle, price: null };

  const title = rawTitle
    .slice(0, trailing.index)
    .trimEnd()
    .replace(/[—–,:-]$/, '')
    .trimEnd();
  // A title that is nothing but a price stays whole; there would be no card left.
  if (title.length === 0) return { title: rawTitle, price: null };

  return { title, price: trailing[1].replace(/\s/g, '') };
}
