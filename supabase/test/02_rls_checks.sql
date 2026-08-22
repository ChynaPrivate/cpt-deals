-- ============================================================================
-- Row-level security checks. Run after the migration, grants and seed data:
--   psql -d <db> -f supabase/test/02_rls_checks.sql
-- Every check raises an exception if the policy does not behave as intended.
-- ============================================================================
\set ON_ERROR_STOP on

create or replace function public.assert(condition boolean, label text)
returns void language plpgsql as $$
begin
  if condition then
    raise notice 'PASS  %', label;
  else
    raise exception 'FAIL  %', label;
  end if;
end $$;

-- A special that is verified but already expired, and one still unverified.
insert into public.specials (id, restaurant_id, title, description, category, days_of_week,
    source_url, source_type, verification_status, valid_until)
values ('d4000000-0000-4000-8000-000000000001',
        'a1000000-0000-4000-8000-000000000001',
        'Expired test offer', 'Should never be visible to the public.',
        'food', array[1,2,3,4,5,6,7]::smallint[], 'https://example.com', 'official_website',
        'verified', public.current_cpt_date() - 1)
on conflict do nothing;

insert into public.specials (id, restaurant_id, title, description, category, days_of_week,
    source_url, source_type, verification_status)
values ('d4000000-0000-4000-8000-000000000002',
        'a1000000-0000-4000-8000-000000000001',
        'Unverified test offer', 'Should never be visible to the public.',
        'food', array[1,2,3,4,5,6,7]::smallint[], 'https://example.com', 'official_website',
        'unverified')
on conflict do nothing;

-- ------------------------------------------------------------ anonymous role
set role anon;

select public.assert((select count(*) from public.restaurants) = 14,
  'anon reads active restaurants across every covered suburb');

select public.assert((select count(*) from public.specials) = 38,
  'anon sees only the 38 verified, in-date specials');

select public.assert(
  not exists (select 1 from public.specials where title = 'Expired test offer'),
  'anon cannot see an expired special');

select public.assert(
  not exists (select 1 from public.specials where title = 'Unverified test offer'),
  'anon cannot see an unverified special');

select public.assert((select count(*) from public.reports) = 0,
  'anon cannot read reports');

-- With row-level security on and no select policy for anon, the queue reads as
-- empty rather than raising — which is exactly what Supabase does in production.
select public.assert((select count(*) from public.research_queue) = 0,
  'anon cannot read the research queue');

-- Anonymous visitors may lodge a report about a live special.
insert into public.reports (special_id, report_type, comment)
values ('b2000000-0000-4000-8000-000000000001', 'price_incorrect', 'Test report from anon.');
select public.assert(true, 'anon can submit a report');

select public.assert((select count(*) from public.reports) = 0,
  'anon still cannot read reports back after inserting one');

do $$ begin
  insert into public.restaurants (name, slug, street_address)
  values ('Rogue Venue', 'rogue-venue', '1 Nowhere Street');
  raise exception 'FAIL  anon must not insert restaurants';
exception
  when insufficient_privilege or invalid_authorization_specification then
    raise notice 'PASS  anon cannot insert restaurants';
  when others then
    if sqlerrm like '%row-level security%' or sqlerrm like '%permission denied%' then
      raise notice 'PASS  anon cannot insert restaurants';
    else raise;
    end if;
end $$;

reset role;

-- ----------------------------------------------- signed in, but not approved
insert into auth.users (id, email)
values ('e5000000-0000-4000-8000-000000000001', 'pending@example.com')
on conflict do nothing;
insert into public.admin_profiles (user_id, email, approved)
values ('e5000000-0000-4000-8000-000000000001', 'pending@example.com', false)
on conflict (user_id) do nothing;

set role authenticated;
set request.jwt.claim.sub = 'e5000000-0000-4000-8000-000000000001';

select public.assert((select count(*) from public.specials) = 38,
  'unapproved user sees only public specials');

select public.assert((select count(*) from public.research_queue) = 0,
  'unapproved user reads no research-queue rows');
select public.assert((select count(*) from public.reports) = 0,
  'unapproved user reads no reports');

do $$ begin
  update public.specials set price = 1 where id = 'b2000000-0000-4000-8000-000000000001';
  if found then raise exception 'FAIL  unapproved user must not edit specials'; end if;
  raise notice 'PASS  unapproved user cannot edit specials';
end $$;

reset role;
reset request.jwt.claim.sub;

-- ---------------------------------------------------- signed in and approved
insert into auth.users (id, email)
values ('e5000000-0000-4000-8000-000000000002', 'admin@example.com')
on conflict do nothing;
insert into public.admin_profiles (user_id, email, approved)
values ('e5000000-0000-4000-8000-000000000002', 'admin@example.com', true)
on conflict (user_id) do update set approved = true;

set role authenticated;
set request.jwt.claim.sub = 'e5000000-0000-4000-8000-000000000002';

select public.assert((select count(*) from public.specials) = 40,
  'approved admin sees every special, including expired and unverified');
select public.assert((select count(*) from public.research_queue) = 17,
  'approved admin reads the research queue');
select public.assert((select count(*) from public.reports) >= 1,
  'approved admin reads reports');

update public.specials set featured = true where id = 'b2000000-0000-4000-8000-000000000001';
select public.assert(
  (select featured from public.specials where id = 'b2000000-0000-4000-8000-000000000001'),
  'approved admin can edit a special');

reset role;
reset request.jwt.claim.sub;

-- ------------------------------------------------------- data-rule guardrails
do $$ begin
  insert into public.restaurants (name, slug, street_address, suburb)
  values ('Out of Area', 'out-of-area', '1 Main Road', 'Woodstock');
  raise exception 'FAIL  a suburb outside the coverage list must be rejected';
exception when check_violation then
  raise notice 'PASS  a suburb outside the coverage list is rejected';
end $$;

-- A covered suburb other than Gardens is accepted.
insert into public.restaurants (id, name, slug, street_address, suburb)
values ('f6000000-0000-4000-8000-000000000001', 'In Area', 'in-area', '1 Victoria Road', 'Camps Bay')
on conflict do nothing;
select public.assert(
  exists (select 1 from public.restaurants where slug = 'in-area' and suburb = 'Camps Bay'),
  'a covered suburb outside Gardens is accepted');

do $$ begin
  insert into public.specials (restaurant_id, title, description, category, days_of_week,
    source_url, source_type)
  values ('a1000000-0000-4000-8000-000000000001', 'Bad day', 'x', 'food',
          array[9]::smallint[], 'https://example.com', 'official_website');
  raise exception 'FAIL  weekday 9 must be rejected';
exception when check_violation then
  raise notice 'PASS  an out-of-range weekday is rejected';
end $$;

do $$ begin
  insert into public.specials (restaurant_id, title, description, category, days_of_week,
    source_url, source_type, valid_from, valid_until)
  values ('a1000000-0000-4000-8000-000000000001', 'Backwards', 'x', 'food',
          array[1]::smallint[], 'https://example.com', 'official_website',
          '2026-09-01', '2026-08-01');
  raise exception 'FAIL  valid_until before valid_from must be rejected';
exception when check_violation then
  raise notice 'PASS  an end date before the start date is rejected';
end $$;

do $$ begin
  insert into public.specials (restaurant_id, title, description, category, days_of_week,
    source_url, source_type, start_time)
  values ('a1000000-0000-4000-8000-000000000001', 'Half a window', 'x', 'food',
          array[1]::smallint[], 'https://example.com', 'official_website', '18:00');
  raise exception 'FAIL  a start time without an end time must be rejected';
exception when check_violation then
  raise notice 'PASS  a half-specified time window is rejected';
end $$;

-- days_of_week is sorted and de-duplicated by the trigger.
insert into public.specials (id, restaurant_id, title, description, category, days_of_week,
  source_url, source_type)
values ('d4000000-0000-4000-8000-000000000003',
        'a1000000-0000-4000-8000-000000000001', 'Dedupe check', 'x', 'food',
        array[3,1,3,2]::smallint[], 'https://example.com', 'official_website')
on conflict do nothing;
select public.assert(
  (select days_of_week from public.specials where id = 'd4000000-0000-4000-8000-000000000003')
    = array[1,2,3]::smallint[],
  'days_of_week is de-duplicated and sorted');

-- A venue with live specials cannot be deleted out from under them.
do $$ begin
  delete from public.restaurants where id = 'a1000000-0000-4000-8000-000000000001';
  raise exception 'FAIL  deleting a restaurant with specials must be blocked';
exception when foreign_key_violation then
  raise notice 'PASS  a restaurant with specials cannot be deleted';
end $$;

-- Views
insert into public.specials (id, restaurant_id, title, description, category, days_of_week,
  source_url, source_type, verification_status, valid_until)
values ('d4000000-0000-4000-8000-000000000004',
        'a1000000-0000-4000-8000-000000000001', 'Ends in three days', 'x', 'food',
        array[1]::smallint[], 'https://example.com', 'official_website', 'verified',
        public.current_cpt_date() + 3)
on conflict do nothing;

select public.assert(
  exists (select 1 from public.specials_expiring_soon
          where id = 'd4000000-0000-4000-8000-000000000004'),
  'the expiring-soon view catches an offer ending in three days');

select public.assert(
  not exists (select 1 from public.specials_expiring_soon
              where id = 'd4000000-0000-4000-8000-000000000002'),
  'the expiring-soon view ignores offers with no end date');

insert into public.specials (id, restaurant_id, title, description, category, days_of_week,
  source_url, source_type, verification_status, last_verified_at)
values ('d4000000-0000-4000-8000-000000000005',
        'a1000000-0000-4000-8000-000000000001', 'Checked long ago', 'x', 'food',
        array[1]::smallint[], 'https://example.com', 'official_website', 'verified',
        public.current_cpt_date() - 45)
on conflict do nothing;

select public.assert(
  exists (select 1 from public.specials_needing_recheck
          where id = 'd4000000-0000-4000-8000-000000000005'),
  'the recheck view flags an offer last checked 45 days ago');

-- Photo capture: the storage bucket exists and is private.
select public.assert(
  exists (select 1 from storage.buckets where id = 'special-photos' and public = false),
  'the specials-photo bucket exists and is private');

-- The in-person source type is available to specials.
insert into public.specials (id, restaurant_id, title, description, category, days_of_week,
  source_url, source_type, verification_status, photo_url)
values ('d4000000-0000-4000-8000-000000000006',
        'a1000000-0000-4000-8000-000000000001', 'Photographed offer', 'x', 'food',
        array[1]::smallint[], 'https://example.com', 'in_person', 'verified',
        'https://example.com/storage/v1/object/special-photos/2026-08-21/x.jpg')
on conflict do nothing;
select public.assert(
  exists (select 1 from public.specials
          where id = 'd4000000-0000-4000-8000-000000000006' and source_type = 'in_person'),
  'a special can be sourced from a photograph taken in the venue');

do $$ begin
  update public.specials set photo_url = 'not-a-url'
  where id = 'd4000000-0000-4000-8000-000000000006';
  raise exception 'FAIL  a photo_url that is not a link must be rejected';
exception when check_violation then
  raise notice 'PASS  a photo_url that is not a link is rejected';
end $$;

\echo 'All row-level security and constraint checks passed.'
