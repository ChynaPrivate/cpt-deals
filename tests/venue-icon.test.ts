import { describe, expect, it } from 'vitest';
import { RESTAURANTS_SEED } from '@/lib/data/seed';
import { venueIcon } from '@/lib/venue-icon';

describe('venue icons', () => {
  it('reads the most specific category, not the first one that matches', () => {
    // Yatai is tagged both Japanese and Bar; it is a ramen bar, not a cocktail bar.
    expect(venueIcon(['Bar', 'Japanese', 'Ramen'])).toBe('sushi');
    // A wine bar must not match on the word "bar".
    expect(venueIcon(['Wine bar', 'Bar'])).toBe('wine');
    // Food beats drink: Mamacita's is a Mexican restaurant that also mixes
    // cocktails, and the taco says more than a third cocktail glass would.
    expect(venueIcon(['Mexican', 'Cocktails', 'Bar', 'Tacos'])).toBe('taco');
    // But a cocktail bar with nothing but small plates is still a cocktail bar.
    expect(venueIcon(['Cocktails', 'Bar', 'Small plates'])).toBe('cocktail');
  });

  it('falls back to a plate when nothing matches', () => {
    expect(venueIcon(['Restaurant'])).toBe('plate');
    expect(venueIcon([])).toBe('plate');
  });

  it('does not turn a dining room into a cocktail bar on a stray Bar tag', () => {
    expect(venueIcon(['Restaurant', 'Fine dining', 'Bar'])).toBe('plate');
    expect(venueIcon(['Bistro', 'Bar'])).toBe('plate');
    // Somewhere that really is just a bar still gets the glass.
    expect(venueIcon(['Bar'])).toBe('cocktail');
  });

  it('gives every seeded venue an icon, and not all the same one', () => {
    const icons = RESTAURANTS_SEED.map((r) => venueIcon(r.categories));
    expect(icons).toHaveLength(RESTAURANTS_SEED.length);
    // If the mapping silently stopped working, everything would be a plate.
    const plates = icons.filter((i) => i === 'plate').length;
    expect(plates).toBeLessThan(RESTAURANTS_SEED.length / 3);
    expect(new Set(icons).size).toBeGreaterThanOrEqual(6);
  });
});
