/**
 * Reading restaurant Instagram accounts through Meta's Business Discovery API.
 *
 * This is the one sanctioned way to read another business's public posts: the
 * `business_discovery` edge on the Instagram Graph API returns captions,
 * timestamps and permalinks for any Professional account, without scraping and
 * without that account's involvement.
 *
 * Everything in this file is pure so it can be tested without a network or a
 * Meta app. The scheduled function in netlify/functions calls into it.
 */

/** Pull "rickscapetown" out of any shape of Instagram URL. */
export function handleFromUrl(url: string | null): string | null {
  if (!url) return null;
  const match = /instagram\.com\/([A-Za-z0-9._]+)/.exec(url);
  if (!match) return null;
  const handle = match[1].replace(/\/+$/, '');
  // Not profiles: Instagram's own routes.
  if (['p', 'reel', 'reels', 'explore', 'stories', 'accounts'].includes(handle)) return null;
  return handle.toLowerCase();
}

export interface IgMedia {
  id: string;
  caption?: string;
  permalink: string;
  timestamp: string;
  media_type?: string;
}

/**
 * Words that make a caption worth a human's attention. Deliberately broad —
 * a false positive costs one glance in the review queue, a false negative
 * costs a listing.
 */
const KEYWORDS = [
  'special',
  'specials',
  'deal',
  'deals',
  'happy hour',
  'golden hour',
  'sundowner',
  '2 for 1',
  'two for one',
  'buy one',
  'bogof',
  'half price',
  'discount',
  'set menu',
  'winter menu',
  'summer menu',
  'prix fixe',
  'date night',
  'burger night',
  'pizza night',
  'steak night',
  'curry night',
  'taco tuesday',
  'sunday roast',
  'sunday lunch',
  'bottomless',
  'free glass',
  'complimentary',
  'on the house',
];

const DAY_WORDS =
  /\b(mon|tues?|wed(nes)?|thur?s?|fri|sat(ur)?|sun)(day)?\b|\bweekday\b|\bweekend\b/i;
const RAND = /\bR\s?\d{2,4}\b/;
const PERCENT_OFF = /\b\d{1,2}\s?%\s?(off|discount)\b/i;

export interface CaptionSignal {
  matched: boolean;
  /** Higher means more likely to be a real, dated offer. */
  score: number;
  reasons: string[];
}

/** Does this caption look like it announces an offer? */
export function scoreCaption(caption: string | undefined): CaptionSignal {
  const reasons: string[] = [];
  if (!caption) return { matched: false, score: 0, reasons };

  // Captions are written by hand: "two-for-one", "half–price", "2  for  1".
  // Flatten dashes and runs of whitespace so one spelling matches them all.
  const text = caption
    .toLowerCase()
    .replace(/[-–—_]/g, ' ')
    .replace(/\s+/g, ' ');
  let score = 0;

  const hits = KEYWORDS.filter((word) => text.includes(word));
  if (hits.length) {
    score += hits.length * 2;
    reasons.push(`mentions ${hits.slice(0, 3).join(', ')}`);
  }
  if (RAND.test(caption)) {
    score += 3;
    reasons.push('quotes a rand price');
  }
  if (PERCENT_OFF.test(caption)) {
    score += 3;
    reasons.push('quotes a percentage off');
  }
  if (DAY_WORDS.test(caption)) {
    score += 2;
    reasons.push('names a day of the week');
  }

  // A price or a discount alone is enough; a bare keyword needs company.
  return { matched: score >= 3, score, reasons };
}

/** Posts older than this are not evidence of anything current. */
export const MAX_AGE_DAYS = 45;

export function isRecent(timestamp: string, now: Date, maxAgeDays = MAX_AGE_DAYS): boolean {
  const posted = new Date(timestamp).getTime();
  if (Number.isNaN(posted)) return false;
  const age = (now.getTime() - posted) / 86_400_000;
  return age >= 0 && age <= maxAgeDays;
}

export interface Candidate {
  handle: string;
  restaurantId: string | null;
  restaurantName: string;
  caption: string;
  permalink: string;
  postedAt: string;
  score: number;
  reasons: string[];
}

export interface VenueRef {
  id: string | null;
  name: string;
  handle: string;
}

/** Turn one account's recent posts into review-queue candidates. */
/**
 * One entry per Instagram account.
 *
 * Several listed venues share an account: Hudsons runs one for both branches,
 * Tiger's Milk one for three. Sweeping the account once per branch reads the
 * same twelve posts several times, spends Meta calls we do not need to spend,
 * and leans on the run's dedup guard to undo the damage afterwards. Better to
 * not do it twice.
 *
 * The first entry wins, so a real listed venue beats a prospect watching the
 * same handle — the candidate then files against the restaurant rather than
 * with no restaurant attached.
 */
/**
 * True for a link to one Instagram post or reel, as opposed to a profile.
 *
 * A post permalink identifies exactly one offer at one venue, so it is safe to
 * treat as an identity. A round-up article is not — several of our candidates
 * legitimately cite the same happy-hour listicle.
 */
export function isInstagramPermalink(url: string | null | undefined): boolean {
  if (!url) return false;
  return /instagram\.com\/(p|reel|reels|tv)\//i.test(url);
}

export function dedupeByHandle(venues: VenueRef[]): VenueRef[] {
  const seen = new Set<string>();
  return venues.filter((venue) => {
    const key = venue.handle.toLowerCase();
    if (seen.has(key)) return false;
    seen.add(key);
    return true;
  });
}

export function candidatesFrom(
  venue: VenueRef,
  media: IgMedia[],
  now: Date,
  seenPermalinks: Set<string>,
): Candidate[] {
  return media
    .filter((post) => !seenPermalinks.has(post.permalink))
    .filter((post) => isRecent(post.timestamp, now))
    .map((post) => ({ post, signal: scoreCaption(post.caption) }))
    .filter(({ signal }) => signal.matched)
    .map(({ post, signal }) => ({
      handle: venue.handle,
      restaurantId: venue.id,
      restaurantName: venue.name,
      // Store the caption verbatim as evidence; the published listing is
      // always written in our own words by whoever reviews it.
      caption: (post.caption ?? '').slice(0, 2000),
      permalink: post.permalink,
      postedAt: post.timestamp.slice(0, 10),
      score: signal.score,
      reasons: signal.reasons,
    }))
    .sort((a, b) => b.score - a.score);
}

export function confidenceFor(score: number): 'low' | 'medium' | 'high' {
  if (score >= 8) return 'high';
  if (score >= 5) return 'medium';
  return 'low';
}

/** The Graph API call for one account. Kept here so the shape is testable. */
export function businessDiscoveryUrl(
  igBusinessId: string,
  handle: string,
  accessToken: string,
  limit = 12,
): string {
  const fields =
    `business_discovery.username(${handle})` +
    `{username,media.limit(${limit}){id,caption,permalink,timestamp,media_type}}`;
  const params = new URLSearchParams({ fields, access_token: accessToken });
  return `https://graph.facebook.com/v21.0/${igBusinessId}?${params.toString()}`;
}
