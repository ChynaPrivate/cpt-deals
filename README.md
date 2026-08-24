# CPT Happy Hours

A mobile-first website that answers one question: **what's on special in Cape Town today?**

Open it, see the seven days of the week with today already highlighted, tap a day, scroll verified restaurant specials, tap one to call, get directions, book or read the original source. Narrow by suburb if you only care about your own patch.

Built with Next.js, TypeScript, Tailwind CSS and Supabase, deployed on Netlify, and installable to a phone's home screen as a Progressive Web App.

Dark slate ground, orange as the single accent, copy in white, orange or black — the palette is defined once as tokens in `src/app/globals.css` and used nowhere else as raw hex.

---

## Getting it running

```bash
npm install
npm run dev          # http://localhost:3000
```

It works immediately, with no credentials. Without Supabase configured, the site reads the verified seed data in `src/lib/data/seed.ts`. Connect Supabase whenever you are ready — see **[docs/DEPLOYMENT.md](docs/DEPLOYMENT.md)**.

```bash
npm run verify       # format check, lint, type check, unit tests, production build
npm run test         # unit tests only
npm run seed:sql     # regenerate netlify/
  functions/           the scheduled Instagram sweep (server-side only)
supabase/seed.sql from the typed seed data
npm run icons        # regenerate the PWA icons from public/icons/icon.svg
```

## What is in here

## Coverage

Gardens, Tamboerskloof, Oranjezicht, Vredehoek, Cape Town City Centre, Sea Point, Green Point, Mouille Point and Camps Bay.

Vredehoek currently shows zero — nothing publishable was found there yet. It stays in the filter row on purpose, so a visitor can see the suburb was looked at.

```
src/
  app/                 routes: home, privacy, terms, offline, /admin/*, /api/report
  components/          public UI, plus components/admin for the dashboard
  lib/
    time.ts            all Africa/Johannesburg date and time logic
    specials.ts        what is publishable, filtering, sorting, freshness
    types.ts           domain types, mirrored exactly by the SQL schema
    data/seed.ts       verified seed data + the private research queue
    data/repository.ts the one data-access layer — Supabase, or seed data
    instagram/         caption scoring for the scheduled Instagram sweep
    supabase/          browser and server clients
    admin/             admin API helpers, CSV import, duplicate detection
supabase/
  migrations/          the schema, RLS policies, then the suburb-coverage expansion
  seed.sql             generated from seed.ts — do not hand-edit
  test/                SQL harness that proves the RLS policies behave
tests/                 unit tests for time, selection, filtering and CSV import
docs/                  research report, deployment, maintenance, test results
```

## How accuracy is protected

The hard part of this project is not the interface, it is not publishing things that are wrong.

- **A special reaches the public only if it is active, verified, and inside its validity window.** That rule is enforced twice: in `src/lib/specials.ts` and again by row-level security in Postgres, so a misconfigured client cannot leak an unverified row.
- **Every special carries the source URL it was checked against** and the date it was checked, both shown to visitors.
- **Offers expire by themselves** the day after `valid_until`, in Cape Town time.
- **Anything unconfirmed goes to a private research queue** rather than the site. Nothing found by research is ever published automatically.
- **The database refuses any suburb other than Gardens**, so an out-of-area venue cannot be added by mistake.
- Every listing shows: _Specials can change without notice. Please confirm with the restaurant before visiting._

Current data: **14 venues across 8 suburbs, 38 verified specials covering all seven days, 17 candidates awaiting confirmation.** The research behind it — including what could not be checked — is in **[docs/RESEARCH-REPORT.md](docs/RESEARCH-REPORT.md)**.

## The admin dashboard

`/admin`, protected by Supabase Auth. `/admin/capture` is the phone-first page for photographing a specials board where you stand — see [docs/CAPTURING-SPECIALS.md](docs/CAPTURING-SPECIALS.md).

An account must exist _and_ be approved in `admin_profiles` before it can do anything. The dashboard covers restaurants and specials, verification and featuring, pausing and archiving, visitor reports, the research queue with captured photos, duplicate detection, CSV import, and lists of what needs re-checking or expires soon.

Public sign-up is switched off in Supabase and no registration form exists on the site.

## Documentation

| Document                                                     | What it covers                                                                           |
| ------------------------------------------------------------ | ---------------------------------------------------------------------------------------- |
| [docs/DEPLOYMENT.md](docs/DEPLOYMENT.md)                     | Supabase setup, admin account, Netlify environment variables, deploying, custom domain   |
| [docs/RESEARCH-REPORT.md](docs/RESEARCH-REPORT.md)           | Every venue checked, sources inspected, what was accepted, rejected or deferred, and why |
| [docs/UNRESOLVED-SPECIALS.md](docs/UNRESOLVED-SPECIALS.md)   | The nine candidates needing a phone call, with numbers                                   |
| [docs/MAINTAINING-SPECIALS.md](docs/MAINTAINING-SPECIALS.md) | The weekly and monthly routine for keeping listings honest                               |
| [docs/TEST-RESULTS.md](docs/TEST-RESULTS.md)                 | What was tested and the results                                                          |
| [docs/LIMITATIONS.md](docs/LIMITATIONS.md)                   | What this does not do yet                                                                |

## Environment variables

Copy `.env.example` to `.env.local`. Only two are needed:

```
NEXT_PUBLIC_SUPABASE_URL
NEXT_PUBLIC_SUPABASE_ANON_KEY
NEXT_PUBLIC_SITE_URL        # optional, for canonical and social-sharing URLs
```

Two more are optional, and both are server-side only — they are read inside Netlify Functions and never reach the browser:

```
SUPABASE_SERVICE_ROLE_KEY   # lets the scheduled jobs write past row-level security
SEED_SYNC_TOKEN             # required only to trigger a seed sync by hand
```

Set `SUPABASE_SERVICE_ROLE_KEY` and the site keeps its own database in step: `netlify/functions/sync-seed.mts` runs each morning and upserts everything in `src/lib/data/seed.ts`, so a `git push` is all it takes to publish a new listing. Leave it unset and that job does nothing — you then apply `supabase/seed.sql` by hand in the Supabase SQL editor instead.

## Licence and attribution

Offer descriptions are paraphrased, and every listing links to its original source. Restaurant names, logos and marks belong to their owners.
