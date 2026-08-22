# Capturing specials as you find them

A photo of a board on the table is the best evidence there is. It is first-hand, it is dated by you, and it shows exactly what the restaurant is telling its customers today — better than any website, which is usually months out of date.

This is the workflow built for that.

## In the restaurant — about twenty seconds

1. Open **`/admin/capture`** on your phone. Add it to your home screen and it is one tap away.
2. Tap **Take a photo of the board**. The camera opens straight away.
3. Type the restaurant name. It autocompletes against venues already on the site.
4. Pick the suburb if you know it. Optional.
5. Add a note for anything the photo will not show — a price the waiter mentioned, an end date, "dine-in only".
6. **Save to the queue.**

That is it. Put your phone away and enjoy your lunch.

The photo is resized on your phone before it uploads, so a 4 MB camera shot becomes about 200 KB. It works fine on mobile data.

## Later, at a desk — a few minutes each

1. Open **`/admin/research`**. Every capture is there with its photo, largest first.
2. Read the board off the photo. Tap the photo to open it full size.
3. Open **`/admin/specials`** → **Add a special** and type each offer up: title, description in your own words, price, days, times, terms.
4. Set the source to **Photographed in the venue** and the source URL to the restaurant's own website.
5. Set **Verified — publish** and save.
6. Back on the research queue, mark the capture **Confirmed** so you know it is done.

One board usually becomes three or four specials. The Woodlands card in the seed data became four.

## Why it does not publish straight from the photo

Two reasons, and both matter.

**A board is not a listing.** "50% OFF — Any Pizza dish on our menu" needs turning into a title, a description, a category, a set of weekdays and a set of terms before it is any use in a filter or a search. That is a judgement call, and a person should make it.

**Nothing on this site is published without a person deciding to publish it.** That rule holds for web research and it holds here. The queue is where a capture waits for that decision.

## Where the photos live

A private Supabase Storage bucket called `special-photos`, readable only by approved administrators. Photos are evidence for you, not content for visitors — they are never shown on the public site, and the row-level security policies enforce that.

If a restaurant later disputes a listing, the photo is your record of what the board said on the day.

## What makes a good capture

- **Get the whole board in frame**, even if it means two photos. Two captures of the same board is fine.
- **Flat on, if you can.** Angled shots are still readable but slower to type up.
- **Watch for dates.** Many boards carry the week's dates, which tells you how current it is and sometimes when it ends. Rick's board is dated 17–23 August; that is how we know their offers were live that week.
- **Note what the board does not say.** Whether it is dine-in only, whether booking is needed, whether it holds on public holidays. Those fields matter and boards rarely mention them.

## Adding it to your home screen

`/admin/capture` is part of the same app, so the home-screen shortcut you already have works. If you want capture to be the thing that opens, add a second shortcut with the URL ending `/admin/capture`.
