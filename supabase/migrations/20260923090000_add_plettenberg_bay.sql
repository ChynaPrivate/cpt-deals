-- ============================================================================
-- Second city: Plettenberg Bay.
--
-- Run this AFTER 20260826080000_dedupe_instagram_candidates.sql.
--
-- Until now the whole site was Cape Town and the suburb allowlist alone was
-- enough to keep a venue in scope. With a second city that is no longer true:
-- "Gardens" and "Plett Central" are both valid suburbs, so the allowlist stops
-- an out-of-area venue but cannot stop a Plett venue being filed as Cape Town
-- and appearing on the wrong page.
--
-- So the city is stored, and a second constraint ties the two together: a
-- suburb may only appear under the city it actually belongs to. That pairing
-- is the real rule — the flat allowlist is now just a cheap first check.
--
-- Keep this in step with src/lib/cities.ts. The two must agree or the app will
-- offer a filter the database rejects.
-- ============================================================================

-- ---------------------------------------------------------------- the column
-- Backfilled to Cape Town because every row that exists today is Cape Town.
-- The default is deliberately NOT left in place afterwards: a new venue should
-- have to say which city it is in, rather than silently landing in Cape Town.
alter table public.restaurants
  add column if not exists city text not null default 'Cape Town';

update public.restaurants set city = 'Cape Town' where city is null or btrim(city) = '';

alter table public.restaurants alter column city drop default;

-- ------------------------------------------------------------ the allowlists
alter table public.restaurants
  drop constraint if exists restaurants_city_check;

alter table public.restaurants
  add constraint restaurants_city_check check (
    btrim(city) in ('Cape Town', 'Plettenberg Bay')
  );

alter table public.restaurants
  drop constraint if exists restaurants_suburb_check;

alter table public.restaurants
  add constraint restaurants_suburb_check check (
    btrim(suburb) in (
      -- Cape Town
      'Gardens',
      'Tamboerskloof',
      'Oranjezicht',
      'Vredehoek',
      'Cape Town City Centre',
      'Sea Point',
      'Green Point',
      'Mouille Point',
      'Camps Bay',
      'Victoria & Alfred Waterfront',
      -- Plettenberg Bay. Area names as Plett Tourism and the venues use them:
      -- Keurbooms (river and N2 village) and Keurboomstrand (the coastal
      -- strip) really are separate places locally.
      'Plett Central',
      'Lookout Beach',
      'Central Beach',
      'Beacon Isle',
      'Robberg Beach',
      'Piesang Valley',
      'Keurbooms',
      'Keurboomstrand',
      'The Crags',
      'Harkerville',
      'Goose Valley',
      'Bitou Valley',
      'Nature''s Valley'
    )
  );

-- ------------------------------------------------- suburb must match the city
-- The one that actually matters. Without it a Plett venue filed as Cape Town
-- passes both lists above and quietly shows up on the wrong city's page.
alter table public.restaurants
  drop constraint if exists restaurants_city_suburb_check;

alter table public.restaurants
  add constraint restaurants_city_suburb_check check (
    (
      btrim(city) = 'Cape Town'
      and btrim(suburb) in (
        'Gardens',
        'Tamboerskloof',
        'Oranjezicht',
        'Vredehoek',
        'Cape Town City Centre',
        'Sea Point',
        'Green Point',
        'Mouille Point',
        'Camps Bay',
        'Victoria & Alfred Waterfront'
      )
    )
    or (
      btrim(city) = 'Plettenberg Bay'
      and btrim(suburb) in (
        'Plett Central',
        'Lookout Beach',
        'Central Beach',
        'Beacon Isle',
        'Robberg Beach',
        'Piesang Valley',
        'Keurbooms',
        'Keurboomstrand',
        'The Crags',
        'Harkerville',
        'Goose Valley',
        'Bitou Valley',
        'Nature''s Valley'
      )
    )
  );

-- --------------------------------------------------------------------- index
-- Every public page load filters by city, so it is worth one.
create index if not exists restaurants_city_idx on public.restaurants (city);

-- Row-level security is unchanged: the existing policies gate on `active` and
-- on the special's verification status, neither of which the city affects.
-- A visitor may read active venues in any city, which is what we want — the
-- city split is a routing concern, not a permissions one.
