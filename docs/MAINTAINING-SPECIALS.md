# Keeping the specials accurate

The site is only as good as its last check. This is the routine.

## The rules the code already enforces

You do not have to remember these — they are built in.

- An offer disappears from the public site the day after its `valid_until` date. Row-level security enforces this in the database as well as in the app.
- An offer that is not `verified` never reaches the public site, whatever else is true about it.
- An offer ending within seven days is badged **Expiring soon**.
- An offer not checked for more than 30 days is badged **Needs re-checking** and appears on the admin overview.
- Every listing shows the date it was last verified.
- All dates and times are calculated in Africa/Johannesburg.

## Weekly, about ten minutes

1. Open `/admin`. The overview shows four numbers: live specials, expiring soon, needing a re-check, and new reports.
2. Work through **Expiring within seven days**. For each one, open the restaurant's own page or phone them.
   - Still running with a new end date → edit the special, update `valid_until`, press **Mark verified today**.
   - Ended → **Pause / archive**. Do not delete; the record is the audit trail.
3. Work through **New reports**. A visitor reporting "the price is incorrect" is usually right — check, correct, and mark the report resolved.

## Monthly, about half an hour

1. Work through **Not checked in the last 30 days**. Anything on this list is showing visitors a stale verification date.
2. For each: confirm on the restaurant's own site or by phone, then **Mark verified today**. If you cannot confirm it, pause it rather than leaving it live.
3. Open the **Research queue** and try to close out a few candidates. `docs/UNRESOLVED-SPECIALS.md` lists the phone number to call for each.

## Photographing a board while you are out

`/admin/capture` on your phone: photo, restaurant name, done. It lands in the research queue with the photo attached, and you type it up later. Full workflow in [CAPTURING-SPECIALS.md](CAPTURING-SPECIALS.md).

This is the highest-quality source there is — better than any website. If you see a board, capture it.

## Adding a special

1. **Restaurants** → add the venue if it is not there. The database rejects any suburb other than Gardens, so an out-of-area venue cannot be saved by mistake.
2. **Specials** → **Add a special**. Fill in every field you have evidence for.
3. The source URL is required. Use the restaurant's own page where one exists; a booking page is next best; a publication is a last resort.
4. Set **Verification status** to _Verified — publish_ only once you have seen the offer on that source today.
5. Leave `valid_until` empty only when the restaurant genuinely publishes no end date. Those offers get flagged for re-checking sooner.

### Writing the description

Paraphrase. Do not paste the restaurant's copy. A good description says what you get, for how much, and any catch — in one or two sentences.

## Importing several at once

**CSV import** takes a reviewed spreadsheet. Every row lands as **unverified** regardless of what the file says, so an import can never publish anything by itself. Load the template on that page to see the column names. Days are numbers, 1 for Monday through 7 for Sunday, separated by `|`.

## Research candidates

Nothing discovered by research is ever published automatically. Candidates land in the research queue, where you can mark them confirmed, needing more evidence, or rejected — and record why. Approving a candidate records your decision; you then create the special yourself on the Specials page.

## Coordinates

No venue currently has latitude and longitude (see the research report for why). "Nearest" sorting works but places uncoordinated venues last. To fix a venue, look it up on Google Maps, right-click the pin, copy the coordinates, and paste them into the restaurant's record.

## Adding a second administrator

1. Ask them to be created as a user in **Supabase → Authentication → Users**.
2. Insert a row in `admin_profiles` with their `user_id` and `approved = true`.

Public sign-up stays switched off — see `docs/DEPLOYMENT.md`.
