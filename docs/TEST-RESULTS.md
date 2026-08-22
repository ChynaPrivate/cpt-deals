# Test results

Run on 21 August 2026 against the final build, covering nine suburbs.

## Automated checks

| Check             | Command                                                                             | Result                               |
| ----------------- | ----------------------------------------------------------------------------------- | ------------------------------------ |
| Formatter         | `npx prettier --check .`                                                            | Pass — all files match               |
| Linter            | `npx eslint`                                                                        | Pass — 0 errors, 0 warnings          |
| Type checker      | `npx tsc --noEmit`                                                                  | Pass — 0 errors                      |
| Unit tests        | `npx vitest run`                                                                    | **56 passed**, 3 files, 0 failed     |
| Production build  | `npm run build`                                                                     | Pass — compiled, 14 routes generated |
| Database policies | `psql -f supabase/test/02_rls_checks.sql`                                           | **26 checks passed**, 0 failed       |
| Accessibility     | axe-core (WCAG 2.0/2.1 A and AA) on `/`, `/privacy`, `/terms`, `/offline`, `/admin` | **0 violations** on every page       |

Two real defects were found by these checks and fixed rather than noted:

- `isOpenNow` computed the wrong wrap-around boundary, so a Friday 22:00–02:00 window was not treated as open at 01:00 on Saturday. Caught by the midnight-crossing test.
- The report endpoint's honeypot returned a validation error instead of a silent success, which would have told a bot exactly which field to leave blank. Caught by the API smoke test.

## Unit tests — what they cover

**Timezone and clock (`tests/time.test.ts`)**

- Cape Town date, weekday and clock time resolved correctly from a UTC instant, including 22:30 UTC already being the next day in Cape Town, and 21:59 UTC still being the previous one.
- Weekdays numbered Monday = 1 through Sunday = 7.
- Validity windows inclusive at both ends; missing bounds treated as open-ended.
- Expiry: an offer is live on its end date and gone the next day.
- "Expiring soon" true at seven days out, false at eight, false once expired, false with no end date.
- "Needs re-checking" false at 30 days, true at 31.
- Open now: all-day offers, same-day windows (end minute exclusive), midnight-crossing windows still open at 01:00 the next day but not at 03:00, windows that end exactly at midnight, and expired offers never counted as open.
- Time-range, date and rand formatting.

**Selection, filtering and sorting (`tests/specials.test.ts`)**

- The public gate rejects inactive, unverified, needs-recheck, not-yet-started and expired specials, and specials at an inactive restaurant.
- An offer on the exact first and last day of its window is included.
- All seven weekday selections return the right specials, including multi-day offers.
- Per-day counts, including a day with zero.
- Filters: category filters OR together; price filters OR together; the two groups AND with each other; discount-only offers excluded from price ceilings; vegan matches the vegetarian filter; "Open now".
- Sorting: lowest price with discount offers last, most recently verified, soonest end date with no-end-date offers last, featured first under Recommended, and venues without coordinates last under Nearest.
- Distance measured between two known Cape Town points falls in the expected range.
- The freshness badge prefers "Expiring soon" over "Needs re-checking".
- The shipped seed data: something on every day of the week, every venue in Gardens, every special carrying a source URL and verification date, and no already-expired offer.

**Instagram sweep (`tests/instagram.test.ts`)**

- Handles are read out of every URL shape Instagram uses, and post links, reels and Instagram's own routes are rejected.
- A caption is flagged when it carries a rand price, a percentage off, or an offer phrase alongside a weekday; an ordinary food post is not.
- Hyphenation is normalised, so "two-for-one" and "2 for 1" both match.
- Posts older than 45 days, dated in the future, or with unparseable timestamps are excluded.
- A post already in the queue is never raised twice.
- Captions are carried through verbatim as evidence, with the post date and the restaurant it belongs to.
- The Graph API request asks for exactly the fields the sweep needs.

**CSV import and duplicates (`tests/csv.test.ts`)**

- Quoted fields, embedded commas, escaped quotes, CRLF endings, blank lines.
- Imports always land as unverified even when the file claims otherwise.
- Rejects a missing required column, an unknown category, a weekday outside 1–7, a half-specified time window, a backwards date range, and a source URL that is not a full link.
- De-duplicates and sorts the weekday list; defaults the verification date to today.
- Duplicate detection flags two identically titled specials at one venue, does not flag genuinely different offers, and finds none in the shipped data.

## Database policy tests

`supabase/test/02_rls_checks.sql` runs against a real PostgreSQL 16 database with the Supabase `auth` schema stubbed. All 26 assertions pass.

**As an anonymous visitor:** reads active restaurants; sees exactly the 15 verified, in-date specials; cannot see an expired special; cannot see an unverified special; cannot read reports; cannot read the research queue; can submit a report; still cannot read reports back after submitting one; cannot insert a restaurant.

**As a signed-in but unapproved user:** sees only what the public sees; reads no research-queue rows; reads no reports; cannot edit a special.

**As an approved administrator:** sees every special including expired and unverified ones; reads the research queue; reads reports; can edit a special.

**Data rules:** a suburb outside the coverage list is rejected while a covered suburb outside Gardens is accepted; a weekday of 9 is rejected; an end date before the start date is rejected; a start time without an end time is rejected; `days_of_week` is de-duplicated and sorted by trigger; a restaurant with live specials cannot be deleted.

**Photo capture:** the `special-photos` bucket exists and is private; a special can be sourced from a photograph taken in the venue; a `photo_url` that is not a link is rejected.

**Views:** the expiring-soon view catches an offer ending in three days and ignores offers with no end date; the recheck view flags an offer last checked 45 days ago.

## Browser tests

Headless Chromium at 390 × 844 (phone) and 1280 × 900 (desktop).

| What                            | Result                                                                                                     |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| Today highlighted automatically | Pass — Friday selected and badged TODAY                                                                    |
| Counts beside each day          | Pass — Mon 8, Tue 9, Wed 8, Thu 9, Fri 8, Sat 7, Sun 8                                                     |
| Switching days without a reload | Pass — tapping Monday updated the heading and the list                                                     |
| Vegetarian filter               | Pass — 8 cards narrowed to 1                                                                               |
| Empty state                     | Pass — "No verified specials found for this day yet." with a suggestion to try another day                 |
| Detail view                     | Pass — opens as a modal with complete offer information                                                    |
| Call link                       | Pass — `tel:+27214265974`                                                                                  |
| Directions link                 | Pass — Google Maps URL, `target="_blank"` with `rel="noopener noreferrer"`                                 |
| Booking link                    | Pass — opens the venue's booking page safely                                                               |
| Original source link            | Pass — opens the source URL safely                                                                         |
| Report submission               | Pass — form validates, submits and confirms                                                                |
| Rate limiting                   | Pass — the sixth report in an hour from one address returns HTTP 429                                       |
| Honeypot                        | Pass — a filled hidden field returns a success response and stores nothing                                 |
| Input validation                | Pass — bad UUID, unknown report type, 600-character comment and malformed JSON each return a clear message |
| Mobile layout                   | Pass — no horizontal overflow, day strip scrolls, touch targets ≥ 44px                                     |
| Desktop layout                  | Pass — day buttons on a four-column grid, filters wrap                                                     |
| Keyboard                        | Pass — skip link first, then header, then the day radiogroup; arrow keys move between days                 |
| Heading structure               | Pass — one h1, then h2 sections, h3 venue, h4 special                                                      |
| Console errors                  | None                                                                                                       |
| PWA manifest and icons          | Pass — manifest, 192, 512, maskable, apple-touch and favicon all return 200                                |
| Service worker                  | Pass — `/sw.js` served, registers in production, offline shell cached                                      |
| Route refresh                   | Pass — `/privacy`, `/terms`, `/offline`, `/admin` all return 200 on direct request                         |
| Admin without Supabase          | Pass — explains that Supabase is not connected instead of failing                                          |

## Not covered by automated tests

- Admin authentication and authorisation were exercised at the database layer, and the dashboard's unconfigured state was checked in a browser, but a full signed-in click-through needs a live Supabase project.
- Actual installation to an iOS or Android home screen needs a real device on a real deployment. Everything the browser checks before offering to install — manifest, icons, scope, display mode, service worker — is in place and served correctly.
- The production build on Netlify itself needs a Netlify account. The build that Netlify runs (`npm run build`) passes here.
