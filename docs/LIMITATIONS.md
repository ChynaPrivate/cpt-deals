# Remaining limitations

An honest list of what this does not do yet, and why.

## Data

**Instagram was not read during this research**, and none of the listings came from it. Its `robots.txt` blocks fetching and its content sits behind a sign-in wall.

A scheduled sweep using Meta's Business Discovery API now ships with the project and will cover it going forward — but it needs a Meta app set up before it does anything, and it cannot read Stories, personal accounts, or text baked into an image with an empty caption. See `docs/INSTAGRAM-SWEEP.md`. For venues not yet on the site, `docs/city-bowl-instagram-sweep.html` is a 113-venue checklist to work through by hand.

**The research is not exhaustive.** Instagram and Facebook are behind sign-in walls and were not bypassed, so any Gardens venue that announces its specials only on social media is missing. Several publisher pages were blocked by `robots.txt`. Two venue domains (Societi Bistro's, Café Paradiso's) are broken or hijacked. The full list is in the research report.

**Eleven venues, twenty-nine specials, across nine suburbs.** That is what could be verified against a current source in two passes, not a complete picture of Cape Town. Seventeen more candidates are queued with the phone number to call for each.

**One suburb is empty.** Vredehoek shows zero. Oranjezicht was filled by a photographed board. Vredehoek stays in the filter row so a visitor can see it was looked at rather than left out.

**Captured photos still need typing up by hand.** `/admin/capture` stores the photo and your note in seconds, but turning a board into listings is a person's job — the site does not read text out of the image. That is deliberate: deciding what counts as the title, the terms and the days is a judgement call.

**One directory's pagination could not be read.** The venue-submitted specials directory lists 78 specials for Cape Town Central and only the first ten were reachable. That is the single biggest known gap, and the research report says so.

**No coordinates.** The free geocoder available during research disallows automated queries in its `robots.txt`, so no latitude or longitude was captured — and none was invented. "Nearest" sorting works but places every venue in the "distance unknown" group until coordinates are entered through the admin dashboard. Ten minutes with Google Maps fixes this.

**Most offers have no published end date.** Restaurants rarely publish one. Those listings show "No end date published" and get flagged for re-checking after 30 days, but they carry more risk of going stale than the ones with a real `valid_until`.

## Product

**Only weekly offers are modelled.** A monthly event such as Hudsons' First Thursdays does not fit `days_of_week` and sits in the research queue instead.

**No restaurant photos.** `image_url` exists on every record and the card renders it when present, but no images were added — using a restaurant's photography needs their permission. Cards currently show a coloured initial.

**No search.** Fifteen specials do not need one. Past about fifty, they will.

**Reports have no notification.** They land in the database and appear on the admin overview, but nobody is emailed. A Supabase database webhook would close that gap.

**Rate limiting is per-instance.** The report endpoint's counter lives in memory, so it bounds one serverless instance rather than the whole site. That stops a naive flood; a determined one would need a shared store such as Netlify Blobs.

**Public-holiday handling is informational.** Every listing shows what the restaurant states, and "not stated" is the honest default for all current data. The site does not know South Africa's public-holiday calendar and does not hide offers on those days.

## Technical

**The admin dashboard has not been click-tested against a live Supabase project**, because that needs credentials. Its authorisation rules were tested directly against PostgreSQL, where all 26 checks pass, and the unconfigured state was verified in a browser.

**Home-screen installation has not been tested on a physical phone.** Everything a browser checks before offering to install is present and correctly served.

**The service worker caches the app shell, not the specials.** Offline, visitors get a clear "you are offline" screen rather than yesterday's data. That is deliberate: stale specials are worse than none.

**No analytics.** Nothing is tracked, which also means there is no data on which days or filters people actually use.
