import { describe, expect, it } from 'vitest';
import {
  businessDiscoveryUrl,
  candidatesFrom,
  confidenceFor,
  dedupeByHandle,
  handleFromUrl,
  isInstagramPermalink,
  isRecent,
  scoreCaption,
  type IgMedia,
} from '@/lib/instagram/discover';
import { PROSPECTS } from '@/lib/data/prospects';
import { RESEARCH_QUEUE_SEED, RESTAURANTS_SEED } from '@/lib/data/seed';

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

describe('the prospect list', () => {
  it('has no duplicates and no handles that are already listed venues', () => {
    const handles = PROSPECTS.map((p) => p.handle.toLowerCase());
    expect(new Set(handles).size).toBe(handles.length);

    const listed = new Set(
      RESTAURANTS_SEED.map((r) => handleFromUrl(r.instagram_url)?.toLowerCase()).filter(Boolean),
    );
    // A prospect that is already a listed venue would be swept twice and file
    // the same post into the queue under two names.
    const overlap = handles.filter((h) => listed.has(h));
    expect(overlap).toEqual([]);
  });

  it('gives every prospect a city, so a second city is data and not a rewrite', () => {
    expect(PROSPECTS.every((p) => p.city.length > 0 && p.suburb.length > 0)).toBe(true);
  });
});

describe('sweeping each account once', () => {
  const venue = (id: string | null, name: string, handle: string) => ({ id, name, handle });

  it('keeps one entry per handle, whatever the branch is called', () => {
    const kept = dedupeByHandle([
      venue('a', 'Hudsons — Kloof Street', 'hudsonsburgers'),
      venue('b', 'Hudsons — Green Point', 'hudsonsburgers'),
      venue('c', "Tiger's Milk — Long Street", 'tigersmilkza'),
      venue('d', "Tiger's Milk — V&A", 'tigersmilkza'),
      venue('e', 'Arlecchino', 'arlecchino_sa'),
    ]);
    expect(kept.map((v) => v.handle)).toEqual(['hudsonsburgers', 'tigersmilkza', 'arlecchino_sa']);
  });

  it('is case-insensitive, so one stray capital cannot double a sweep', () => {
    const kept = dedupeByHandle([venue('a', 'A', 'TheNines'), venue('b', 'B', 'thenines')]);
    expect(kept).toHaveLength(1);
  });

  it('keeps the listed venue over a prospect watching the same account', () => {
    // The listed one carries a restaurant id, so the candidate files against
    // the restaurant instead of landing with nothing attached.
    const kept = dedupeByHandle([
      venue('rest-1', 'Arlecchino', 'arlecchino_sa'),
      venue(null, 'Arlecchino (not yet listed — Sea Point)', 'arlecchino_sa'),
    ]);
    expect(kept).toHaveLength(1);
    expect(kept[0].id).toBe('rest-1');
  });
});

describe('telling a post apart from an article', () => {
  it('recognises the permalink shapes Instagram actually uses', () => {
    expect(isInstagramPermalink('https://www.instagram.com/p/DZFCAHnIvk2/')).toBe(true);
    expect(isInstagramPermalink('https://www.instagram.com/reel/Db2npe2i-LL/')).toBe(true);
    expect(isInstagramPermalink('https://instagram.com/tv/AbC123/')).toBe(true);
  });

  it('does not mistake a profile or a round-up for a post', () => {
    expect(isInstagramPermalink('https://www.instagram.com/thenines/')).toBe(false);
    expect(
      isInstagramPermalink('https://secretcapetown.co.za/happy-hour-specials-in-cape-town/'),
    ).toBe(false);
    expect(isInstagramPermalink(null)).toBe(false);
    expect(isInstagramPermalink(undefined)).toBe(false);
  });

  it('leaves shared article URLs in the seed queue alone', () => {
    // Several candidates cite one round-up, one per venue it covers. That is
    // correct data, and the unique index must not touch it — so none of those
    // shared URLs may look like a post permalink.
    const counts = new Map<string, number>();
    for (const row of RESEARCH_QUEUE_SEED) {
      counts.set(row.source_url, (counts.get(row.source_url) ?? 0) + 1);
    }
    const shared = [...counts.entries()].filter(([, n]) => n > 1).map(([url]) => url);
    expect(shared.length).toBeGreaterThan(0);
    expect(shared.filter(isInstagramPermalink)).toEqual([]);
  });

  it('never seeds the same Instagram post twice', () => {
    const permalinks = RESEARCH_QUEUE_SEED.map((r) => r.source_url).filter(isInstagramPermalink);
    expect(new Set(permalinks).size).toBe(permalinks.length);
  });
});
