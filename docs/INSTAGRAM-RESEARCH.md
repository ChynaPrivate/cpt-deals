# Instagram, and why the site does not scrape it

Instagram is the biggest hole in this research. Plenty of Cape Town venues announce their specials there and nowhere else — no website update, no listing, just a post. Everything below is about closing that gap without putting your account at risk.

## What was tried, and what happened

| Attempt                            | Result                              |
| ---------------------------------- | ----------------------------------- |
| Fetching a public profile directly | Blocked by Instagram's `robots.txt` |
| Reading posts without signing in   | Sign-in wall                        |

Both were recorded as inaccessible in the research report rather than worked around. The brief said not to bypass sign-in walls or robots restrictions, and that is the right call regardless — it is also Instagram's Terms of Use.

## Why automating a personal account is a bad idea

Driving a logged-in personal account through dozens of profiles is exactly the behaviour Meta's systems are built to catch. Two separate problems:

**It breaches the Terms of Use.** Instagram prohibits accessing the service by automated means without their written permission. That applies to a browser being driven programmatically just as much as to a scraping script.

**It is your account that pays.** The realistic outcomes, in rough order of likelihood:

- a CAPTCHA challenge mid-session
- a temporary action block — no viewing, following or searching for some hours
- repeated blocks that get longer each time
- in the worst case, restriction or loss of the account

Rapid sequential profile views from one session is the signature. A hundred profiles in an afternoon looks nothing like a person.

The account at risk would be yours, and a personal Instagram is not worth a restaurant listing.

## What to do instead

**Sweep it by hand, with a list.** `city-bowl-instagram-sweep.html` is a checklist of 113 City Bowl venues grouped by street. Open it on your phone, tap through to each venue's Instagram, tick it off. Your ticks are saved in the browser, so you can do ten at a time over a fortnight and pick up where you left off.

That is ordinary human browsing. No terms broken, no risk, and honestly not much slower than automation once you account for how much of what is posted turns out to be irrelevant.

**Screenshot straight into the capture flow.** When you find a special, screenshot it and add it through `/admin/capture` — the same page used for photographing a board. The screenshot becomes the evidence, and you type it up later.

**Check Facebook first where it exists.** Many venues cross-post from Instagram, and Facebook pages are sometimes readable without signing in. Worth a look before opening Instagram at all.

## The one legitimate automated route — and it is now built

Meta's **Business Discovery** API reads the public posts of any Instagram _Professional_ account, including captions and timestamps, without that account's involvement and without breaking any terms. Most restaurants run Professional accounts.

A scheduled sweep using it ships with the project and is documented in [INSTAGRAM-SWEEP.md](INSTAGRAM-SWEEP.md). It is switched off until you set up a Meta app.

That covers venues already listed on the site. The by-hand checklist below is still how you _discover_ venues that are not on it yet.

## Which venues are worth the effort

The checklist marks two groups worth doing first:

- **In the queue** — venues with a candidate offer already recorded that needs confirming. A single Instagram post could turn any of these into a published listing.
- **On the site** — venues already listed. Their Instagram is where you will spot an offer changing or ending before any website says so.

Everything else is discovery, and can be worked through slowly.
