-- ============================================================================
-- Add the V&A Waterfront to the suburb allowlist.
--
-- Run this AFTER 20260821090000_expand_suburbs.sql.
--
-- The four Pierhead venues (Quay Four, Upper Quay, Mitchell's, Ferryman's)
-- publish more offers with real end dates than any other cluster in the city,
-- which is why the boundary moved. Keep this list in step with SUBURBS in
-- src/lib/types.ts — the two must agree or the app will offer a filter the
-- database rejects.
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
      'Camps Bay',
      'Victoria & Alfred Waterfront'
    )
  );
