-- ============================================================================
-- Capture specials from photographs taken in person.
--
-- Run AFTER 20260820120000_init.sql and 20260821090000_expand_suburbs.sql.
--
-- A photo of a specials board on the table is the strongest evidence there is:
-- it is first-hand, it is dated by the person who took it, and it shows exactly
-- what the restaurant is telling its customers today. This migration adds the
-- pieces needed to work that way.
-- ============================================================================

-- 1. A source type for something seen and photographed in the venue.
--    Postgres will not let a new enum value be used in the same transaction
--    that adds it, so this statement stands alone — run it first.
alter type source_type add value if not exists 'in_person';

-- 2. Evidence photos.
alter table public.specials
  add column if not exists photo_url text check (photo_url ~* '^https?://');

comment on column public.specials.photo_url is
  'Photograph of the specials board this listing came from. Admin evidence, not shown publicly.';

alter table public.research_queue
  add column if not exists photo_url text check (photo_url ~* '^https?://');

comment on column public.research_queue.photo_url is
  'Photograph captured on the spot, before anyone has typed the offer up.';

-- 3. Where the photographs live.
--    A private bucket: only approved administrators can read or write it.
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'special-photos',
  'special-photos',
  false,
  10485760, -- 10 MB, comfortably more than a phone photo
  array['image/jpeg', 'image/png', 'image/webp', 'image/heic']
)
on conflict (id) do nothing;

drop policy if exists "admins read special photos" on storage.objects;
create policy "admins read special photos" on storage.objects
  for select to authenticated
  using (bucket_id = 'special-photos' and public.is_approved_admin());

drop policy if exists "admins upload special photos" on storage.objects;
create policy "admins upload special photos" on storage.objects
  for insert to authenticated
  with check (bucket_id = 'special-photos' and public.is_approved_admin());

drop policy if exists "admins delete special photos" on storage.objects;
create policy "admins delete special photos" on storage.objects
  for delete to authenticated
  using (bucket_id = 'special-photos' and public.is_approved_admin());
