import { describe, expect, it } from 'vitest';
import {
  businessDiscoveryUrl,
  candidatesFrom,
  confidenceFor,
  handleFromUrl,
  isRecent,
  scoreCaption,
  type IgMedia,
} from '@/lib/instagram/discover';

describe('reading a handle out of a URL', () => {
  it('handles the shapes Instagram URLs actually come in', () => {
    expect(handleFromUrl('https://www.instagram.com/rickscapetown/')).toBe('rickscapetown');
    expect(handleFromUrl('https://instagram.com/extrablatt_cpt')).toBe('extrablatt_cpt');
    expect(handleFromUrl('https://www.instagram.com/the_woodlands_eatery/?hl=en')).toBe(
      'the_woodlands_eatery',
    );
    expect(handleFromUrl('https://www.instagram.com/c__a__r__g__o/')).toBe('c__a__r__g__o');
  });

  it('rejects post links and Instagram’s own routes', () => {
    expect(handleFromUrl('https://www.instagram.com/p/Cabc123/')).toBeNull();
    expect(handleFromUrl('https://www.instagram.com/reel/Cxyz/')).toBeNull();
    expect(handleFromUrl('https://www.instagram.com/explore/search/keyword/?q=x')).toBeNull();
    expect(handleFromUrl('https://facebook.com/someone')).toBeNull();
    expect(handleFromUrl(null)).toBeNull();
  });
});

describe('spotting an offer in a caption', () => {
  it('flags a caption with a price and a day', () => {
    const signal = scoreCaption('Burger night every Tuesday — two for one, all day long!');
    expect(signal.matched).toBe(true);
    expect(signal.reasons.join(' ')).toContain('day of the week');
  });

  it('flags a rand price on its own', () => {
    expect(scoreCaption('Two margaritas for R100 this week').matched).toBe(true);
  });

  it('flags a percentage off', () => {
    expect(scoreCaption('50% off all pizza today').matched).toBe(true);
  });

  it('ignores an ordinary food post', () => {
    expect(scoreCaption('New season menu drops tomorrow. Swipe for a look.').matched).toBe(false);
    expect(scoreCaption('Sunshine and a cold one 🍺').matched).toBe(false);
    expect(scoreCaption(undefined).matched).toBe(false);
  });

  it('scores a rich caption higher than a thin one', () => {
    const rich = scoreCaption('Happy hour Thursday — half price cocktails, R60 a glass');
    const thin = scoreCaption('Our winter menu is here');
    expect(rich.score).toBeGreaterThan(thin.score);
  });

  it('maps a score onto a confidence level', () => {
    expect(confidenceFor(9)).toBe('high');
    expect(confidenceFor(6)).toBe('medium');
    expect(confidenceFor(3)).toBe('low');
  });
});

describe('recency', () => {
  const now = new Date('2026-08-22T10:00:00Z');
  it('accepts a recent post and rejects an old one', () => {
    expect(isRecent('2026-08-20T09:00:00+0000', now)).toBe(true);
    expect(isRecent('2026-05-01T09:00:00+0000', now)).toBe(false);
  });
  it('rejects a post dated in the future, and nonsense', () => {
    expect(isRecent('2027-01-01T09:00:00+0000', now)).toBe(false);
    expect(isRecent('not a date', now)).toBe(false);
  });
});

describe('building candidates', () => {
  const now = new Date('2026-08-22T10:00:00Z');
  const venue = { id: 'r1', name: "Rick's Café Américain", handle: 'rickscapetown' };

  const media: IgMedia[] = [
    {
      id: '1',
      caption: 'Two-for-one burgers every Tuesday, all day long',
      permalink: 'https://www.instagram.com/p/AAA/',
      timestamp: '2026-08-19T12:00:00+0000',
    },
    {
      id: '2',
      caption: 'What a sunset from the roof terrace',
      permalink: 'https://www.instagram.com/p/BBB/',
      timestamp: '2026-08-20T18:00:00+0000',
    },
    {
      id: '3',
      caption: 'Half price margaritas — R55 each — this Wednesday only',
      permalink: 'https://www.instagram.com/p/CCC/',
      timestamp: '2026-08-21T09:00:00+0000',
    },
    {
      id: '4',
      caption: 'Sunday roast is back, R185',
      permalink: 'https://www.instagram.com/p/OLD/',
      timestamp: '2026-01-05T09:00:00+0000',
    },
  ];

  it('keeps only recent posts that look like offers', () => {
    const found = candidatesFrom(venue, media, now, new Set());
    expect(found.map((c) => c.permalink)).toEqual([
      'https://www.instagram.com/p/CCC/',
      'https://www.instagram.com/p/AAA/',
    ]);
  });

  it('sorts the strongest signal first', () => {
    const found = candidatesFrom(venue, media, now, new Set());
    expect(found[0].score).toBeGreaterThanOrEqual(found[1].score);
  });

  it('never raises a post that is already in the queue', () => {
    const seen = new Set(['https://www.instagram.com/p/CCC/']);
    const found = candidatesFrom(venue, media, now, seen);
    expect(found.map((c) => c.permalink)).toEqual(['https://www.instagram.com/p/AAA/']);
  });

  it('carries the caption through verbatim as evidence', () => {
    const found = candidatesFrom(venue, media, now, new Set());
    expect(found[0].caption).toBe('Half price margaritas — R55 each — this Wednesday only');
    expect(found[0].restaurantId).toBe('r1');
    expect(found[0].postedAt).toBe('2026-08-21');
  });
});

describe('the Graph API request', () => {
  it('asks for the fields the sweep needs, for one account', () => {
    const url = businessDiscoveryUrl('12345', 'rickscapetown', 'token-abc', 5);
    expect(url).toContain('graph.facebook.com');
    expect(url).toContain('/12345?');
    expect(decodeURIComponent(url)).toContain('business_discovery.username(rickscapetown)');
    expect(decodeURIComponent(url)).toContain('media.limit(5)');
    expect(decodeURIComponent(url)).toContain('caption');
    expect(url).toContain('access_token=token-abc');
  });
});
