# The Instagram sweep

There is exactly one sanctioned way to read another business's Instagram posts programmatically, and this is it: Meta's **Business Discovery** API. It returns captions, timestamps and permalinks for any Instagram _Professional_ account, without scraping, without that account's involvement, and without breaking anyone's terms.

The sweep is built and shipped. It stays switched off until you set three environment variables.

## What it does

Once a day at 06:30 Cape Town time, a Netlify scheduled function:

1. Reads every active venue that has an `instagram_url`.
2. Asks Business Discovery for that account's twelve most recent posts.
3. Scores each caption for things that look like an offer — a rand price, a percentage off, a named weekday, phrases like _happy hour_, _two-for-one_, _set menu_, _bottomless_.
4. Files anything that scores highly enough into the **research queue** with the caption verbatim, the post's date, a link to the post, and a note saying why it was flagged.
5. Skips anything older than 45 days, and anything already in the queue.

It waits a second and a half between accounts. Meta allows 200 calls an hour; a full sweep of fourteen venues uses fourteen.

**It never publishes.** Every find lands as `pending`, exactly like a photographed board. You still read it, write the listing in your own words, and mark it verified.

## Switching it on

You need an Instagram **Professional** account of your own — Business or Creator — linked to a Facebook Page. That account is the _caller_; it is not the account being read.

1. Convert your Instagram account to Professional, if it is not already: Settings → Account type.
2. Create a Facebook Page and link the Instagram account to it.
3. At [developers.facebook.com](https://developers.facebook.com), create an app of type **Business** and add the **Instagram Graph API** product.
4. Use the Graph API Explorer to generate a token with **four** permissions: `instagram_basic`, `pages_show_list`, `pages_read_engagement` and `instagram_manage_insights`. The last one is not optional — Business Discovery returns `(#10) Application does not have permission for this action` without it. Then exchange the token for a long-lived one.
5. Find your Instagram account's ID. `me/accounts` is the documented route but frequently returns an empty array on Business-type apps even when the Page is granted. The reliable route is the **Access Token Debugger** (Explorer → the ⓘ beside the token → _Open in Access Token Tool_): under **Granular Scopes**, the numeric ID listed against `instagram_basic` _is_ your Instagram account ID.
6. In Netlify → **Site configuration** → **Environment variables**, add:

| Variable                    | Value                                  |
| --------------------------- | -------------------------------------- |
| `IG_BUSINESS_ID`            | Your Instagram account's numeric ID    |
| `IG_ACCESS_TOKEN`           | The long-lived token                   |
| `SUPABASE_SERVICE_ROLE_KEY` | From Supabase → Project Settings → API |

7. Redeploy. The function appears under **Functions** with its schedule.

### This project's values

Recorded here so they do not have to be rediscovered. Neither is a secret — an account ID is not a credential.

| Thing                    | Value                               |
| ------------------------ | ----------------------------------- |
| Caller Instagram account | `@cpthappyhour`                     |
| `IG_BUSINESS_ID`         | `17841438488011653`                 |
| Linked Facebook Page     | Stereo Night, `1719547058139439`    |
| Meta app                 | Cape Town Deals, `1867672531260147` |

The **token itself is a secret** and lives only in the Netlify environment variable. It is not written down here, in the repository, or anywhere else in this project.

Leave any of the three unset and the function exits quietly, reporting `skipped`. Nothing else is affected.

### Long-lived tokens still expire

Roughly every 60 days. When the sweep starts returning errors about the token, regenerate it and update the Netlify variable. Put a reminder in the diary.

## About the service-role key

This is the one job in the project that genuinely needs it, and the brief anticipated exactly this case. The sweep runs on a schedule with no signed-in user, so there is no session for row-level security to check — it has to write as the service role.

It is used in `netlify/functions/instagram-sweep.mts` and nowhere else. Netlify Functions run server-side, that file is not part of the Next.js browser bundle, and the key is not a `NEXT_PUBLIC_` variable. Nothing in a browser can reach it.

## What it will and will not find

**Will:** a venue that posts "Half price margaritas — R55 — this Wednesday only" to a Professional account.

**Will not:**

- **Personal accounts.** Business Discovery only reads Professional ones. Most restaurants are Professional; a few small places are not, and those return an error the sweep records and moves past.
- **Stories.** Only feed posts are available. Plenty of specials go up as a story and vanish in 24 hours — nothing to be done about that through any legitimate route.
- **Text baked into an image** with an empty caption. A poster JPEG with no words in the caption reads as nothing. This is the real weakness, and it is why photographing boards still matters.
- **Venues not on the site yet.** The sweep reads venues you have already added. For discovery, use the by-hand checklist in `city-bowl-instagram-sweep.html`.

## Reading the log

Every run prints one line to the Netlify function log:

```
instagram-sweep {"venues":81,"checked":54,"added":6,"problems":27}
```

- **venues** — accounts on the list, after collapsing branches that share one account
- **checked** — accounts Business Discovery actually returned posts for
- **added** — new candidates filed
- **problems** — accounts that could not be read, each printed on its own line below

A gap between `venues` and `checked` is normal: personal (non-Professional)
accounts cannot be read at all, and each one is counted as a problem.

This line exists because it did not, once. On 26 August 2026 the log panel was
empty for a function that had been running perfectly for three days — it simply
never printed anything — and that sent us looking for a broken access token
that was fine. An invisible healthy run is indistinguishable from a dead one.

## One post, one candidate

Found on 26 August 2026: the queue held 111 Instagram-sourced rows but only 72
distinct post permalinks. A third of the queue was the same posts over again,
and whoever sat down to review it would have read them twice.

Three things now prevent it:

1. **One sweep per account.** Several venues share an Instagram account —
   Hudsons across two branches, Tiger's Milk across three — and the sweep used
   to read the account once per branch. `dedupeByHandle` collapses them, which
   also spends fewer Meta calls. Where a listed venue and a prospect watch the
   same account, the listed one wins, so the candidate files against a
   restaurant rather than landing with nothing attached.
2. **The permalink is claimed before the insert is awaited.** Candidates for a
   venue are filtered against `seen` as it stood when that venue started, so
   the claim has to happen at the moment of use, not after the write returns.
3. **A unique index in the database.** Migration
   `20260826080000_dedupe_instagram_candidates.sql` removes the existing
   duplicates and stops any future one.

The index is deliberately **partial** — it covers Instagram post and reel
permalinks only. A post identifies one offer at one venue, so it is a safe
identity. A `source_url` in general is not: six seeded candidates cite the same
Cape Town happy-hour round-up, one per venue it covers, and that is correct
data. A blanket unique constraint would reject five of them. `isInstagramPermalink`
in `src/lib/instagram/discover.ts` draws the same line in code, and a test
asserts that no shared article URL in the seed ever looks like a permalink.

`sync-seed` follows the same rule: if the sweep has already filed a post that a
seeded candidate cites, the sweep's row wins — it carries the caption and the
posting date — and the seeded copy is skipped.

## Tuning what gets flagged

The keyword list and scoring live in `src/lib/instagram/discover.ts`. The threshold is deliberately generous — a false positive costs one glance in the queue, a false negative costs a listing.

If the queue fills with noise, raise the threshold in `scoreCaption`. If real offers are slipping through, add the words you are seeing to `KEYWORDS`. Both are covered by unit tests in `tests/instagram.test.ts`.

## What is still off limits

Scraping Instagram's website, and driving a logged-in personal account through browser automation. The first is blocked by `robots.txt` and the second breaches Meta's terms and risks an action block on your own account. Business Discovery exists precisely so nobody has to do either.
