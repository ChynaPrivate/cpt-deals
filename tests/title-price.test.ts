import { describe, expect, it } from 'vitest';
import { splitTitlePrice } from '../src/lib/title-price';
import { SPECIALS_SEED } from '../src/lib/data/seed';

describe('splitTitlePrice', () => {
  it('strips a trailing "for R…"', () => {
    expect(splitTitlePrice('Two Aperol Spritz for R215')).toEqual({
      title: 'Two Aperol Spritz',
      price: 'R215',
    });
  });

  it('strips a trailing dash and amount', () => {
    expect(splitTitlePrice('Margarita Social — R300')).toEqual({
      title: 'Margarita Social',
      price: 'R300',
    });
  });

  it('strips a trailing comma and amount', () => {
    expect(splitTitlePrice('Date night — three courses for two, R785')).toEqual({
      title: 'Date night — three courses for two',
      price: 'R785',
    });
  });

  it('handles decimals and thousands separators', () => {
    expect(splitTitlePrice('Sharing menu for two — R1,100').price).toBe('R1,100');
    expect(splitTitlePrice('Soup of the day R62.50').price).toBe('R62.50');
  });

  it('leaves a price alone when it is not at the end', () => {
    expect(splitTitlePrice('R50 margaritas on Mondays')).toEqual({
      title: 'R50 margaritas on Mondays',
      price: null,
    });
    expect(splitTitlePrice('Prego Wednesdays, R200 with a Duchess Spritz').price).toBeNull();
    expect(splitTitlePrice('Souvla Sunday lunch — R395 for two').price).toBeNull();
  });

  it('leaves titles with two amounts entirely alone', () => {
    expect(splitTitlePrice('Winter menu — two courses R220, three courses R280')).toEqual({
      title: 'Winter menu — two courses R220, three courses R280',
      price: null,
    });
  });

  it('leaves titles with no amount alone', () => {
    expect(splitTitlePrice('Happy hour — 30% off')).toEqual({
      title: 'Happy hour — 30% off',
      price: null,
    });
  });

  it('never returns an empty title', () => {
    expect(splitTitlePrice('R215')).toEqual({ title: 'R215', price: null });
  });

  /**
   * The real guard: run every published title through it and make sure nothing
   * comes back empty, longer than it started, or ending in stray punctuation.
   */
  it('never mangles a title in the seed', () => {
    for (const special of SPECIALS_SEED) {
      const { title, price } = splitTitlePrice(special.title);
      expect(title.length).toBeGreaterThan(0);
      expect(title.length).toBeLessThanOrEqual(special.title.length);
      expect(title).not.toMatch(/[—–,:-]$/);
      if (price === null) expect(title).toBe(special.title);
      else expect(special.title).toContain(price.replace(/\s/g, ''));
    }
  });
});
