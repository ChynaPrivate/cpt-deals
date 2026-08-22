-- ============================================================================
-- Expand coverage beyond Gardens to the City Bowl and the near Atlantic Seaboard.
--
-- Run this AFTER 20260820120000_init.sql. If you have not run the first
-- migration yet, run it first, then this one.
--
-- The suburb column stays constrained: it now accepts an allowlist of the
-- suburbs the site covers, so an out-of-area venue still cannot be saved by
-- mistake. To cover another suburb later, add it here and to SUBURBS in
-- src/lib/types.ts — the two lists must agree.
-- ============================================================================

alter table public.restaurants
  drop constraint if exists restaurants_suburb_check;

alter table public.restaurants
  add constraint restaurants_suburb_check check (
    btrim(suburb) in (
      'Gardens',
      'Tamboerskloof',
      'Oranjezicht',
      'Vredehoek',
      'Cape Town City Centre',
      'Sea Point',
      'Green Point',
      'Mouille Point',
      'Camps Bay'
    )
  );

-- The suburb is now something visitors filter by, so give it an index.
create index if not exists restaurants_suburb_idx on public.restaurants (suburb);

comment on column public.restaurants.suburb is
  'Constrained to the suburbs this site covers. Keep in step with SUBURBS in src/lib/types.ts.';
