# What has to change before Johannesburg and Durban

Written 23 August 2026, after a day of pushing Cape Town from 84 specials to 134.

## The thing that actually limits growth

Not effort. **Supply of published, dated offers.**

Today's 134 specials came from five kinds of source, and the split is the whole
story:

| Source                                                       | Listings | What it costs to get one                                                         |
| ------------------------------------------------------------ | -------- | -------------------------------------------------------------------------------- |
| Publications (FoodBlog, capetownmagazine, restaurants.co.za) | 70       | Cheap. One page yields five to twenty.                                           |
| Booking platforms                                            | 19       | Cheap, but only venues that opt in.                                              |
| Venue websites                                               | 21       | Expensive. Most publish no specials at all, and several block automated reading. |
| Instagram (Business Discovery)                               | 15       | Cheap per venue — **but only if you know the exact handle.**                     |
| Seen in person                                               | 9        | Does not scale.                                                                  |

The pattern that matters: on Kloof Street — the densest restaurant strip in the
country — I could not find a single dated, priced special on the open web for
Black Sheep, Carne, Yours Truly, Blondie, Van Hunks or a dozen others. They all
run specials. They announce them on Instagram and nowhere else.

So the ceiling on Gardens is not research hours. It is that **the offers are
published somewhere the open web cannot see.**

## Why a second and third city makes this three times worse, not three times bigger

Three things get worse faster than linearly:

1. **Local publications do not generalise.** FoodBlog Cape Town and
   capetownmagazine carried most of today's yield. Johannesburg and Durban have
   different publications, different quality, different update habits. Every one
   has to be found, assessed for freshness, and learned.
2. **Handle discovery is per venue, forever.** Instagram Business Discovery
   needs an exact username. Guessing has roughly a one-in-three hit rate, and
   the misses are not harmless — six guessed handles turned out to be entirely
   different businesses in the United States, Albania and Colombia. Every new
   city is a fresh few hundred handles to find and verify.
3. **Freshness decay is per listing, not per city.** 33 of the 134 current
   specials expire on or before 31 August, and 59 carry no end date at all and
   so need re-checking about monthly. Three cities means three times the
   re-checking, on the same clock, forever.

Adding cities without changing the model means the research burden triples while
the decay burden triples underneath it.

## The one change that fixes it

**Flip from pull to push: let venues submit their own specials.**

This was already the plan — restaurants email or DM their offers, an agent reads
them and files them for review. It is worth being clear about why it is not a
nice-to-have but the thing the whole model rests on:

- It is the only source that scales sub-linearly. A venue that submits once
  tends to submit again.
- It solves freshness at the same time. The venue knows when its offer ends;
  no third-party page ever does.
- It is first-party evidence by definition, which is the standard the
  verification rules already demand and which publications routinely fail —
  today a write-up eleven days old had Harringtons' happy hour wrong on three
  days of the week and by an hour on the rest.
- It gives a reason to make contact, which is also how logos arrive. The card
  currently draws a pictogram because we have no licence to republish anyone's
  photography; a venue that submits a special will happily send a logo with it.

Everything else on this page is preparation for that.

## What to change in the codebase, and when

### Before the second city — cheap now, painful later

**Cities need to be data, not constants.** Right now a suburb is a string in a
hard-coded list in `src/lib/types.ts` plus a matching `CHECK` constraint in the
database, and the two must be edited together. That was right for one city. For
three it wants:

```
cities    (id, name, slug, timezone)
suburbs   (id, city_id, name, slug, active)
restaurants.suburb_id -> suburbs.id
```

Doing this with 59 venues is an afternoon. Doing it with 600 across three cities
is a data migration with a rollback plan.

Note `timezone` on the city. It is redundant today — all three cities are
Africa/Johannesburg — but every day-and-time calculation in the app currently
hard-codes that string, and the moment the model is `city -> timezone` the code
stops assuming.

**Decide the URL shape now.** One deployment with the city as a route segment
(`/cape-town`, `/johannesburg`) is almost certainly right: one codebase, one
database, one admin, and the PWA install still works per city if the manifest
start URL is city-scoped. Three separate sites means three of everything,
including three sets of research decisions drifting apart.

### Before the third city

- **Per-city admin scoping.** Today an approved administrator sees everything.
  Three cities probably means a city editor who sees one.
- **The re-verification queue needs to be worked, not just flagged.** The
  30-day flag exists. With three cities it becomes the main daily job, and it
  needs to be a worklist with an order, not a filter.

### Already done, and worth knowing

- **Publishing is now automatic.** `netlify/functions/sync-seed.mts` upserts the
  seed into the database every morning, so a push publishes listings without
  anyone touching the SQL editor. That was the single biggest time sink today.
- **The research queue already models "found but unconfirmed"** — 42 candidates
  sit in it. That is exactly the shape a submission inbox needs, so submissions
  can land in the same queue rather than a new one.

## On the target of twenty specials per suburb per day

It is the wrong shape of target, and it will be wrong in Johannesburg and Durban
too. Two suburbs on this site can support it and four cannot, because four of
them contain one restaurant each. Twenty daily specials in a suburb with one
venue would require that venue to run twenty offers a day.

A target that survives contact with reality:

> No day, in any suburb the site claims to cover, has fewer than N specials —
> and a suburb that cannot sustain N is not offered as a filter.

That makes coverage a promise the site can keep, and it generalises: it tells
you which Johannesburg suburbs to launch with instead of guessing.

On the current data, at N = 15, Cape Town City Centre and the V&A Waterfront
qualify today, Gardens is close, and the rest would be folded into a single
"City Bowl" or dropped from the filter row until they earn a place.
