-- ============================================================================
-- CPT Deals — initial schema
-- Run this once against a new Supabase project (SQL Editor, or `supabase db push`).
-- ============================================================================

create extension if not exists "pgcrypto";

-- ---------------------------------------------------------------- enum types
create type special_category as enum ('food', 'drinks', 'breakfast', 'lunch', 'dinner', 'happy_hour');
create type dietary_tag       as enum ('vegetarian', 'vegan', 'halaal');
create type source_type       as enum ('official_website', 'official_menu', 'booking_page', 'google_business', 'publication', 'social');
create type verification_status as enum ('unverified', 'verified', 'needs_recheck', 'rejected');
create type holiday_status    as enum ('unknown', 'valid', 'not_valid');
create type report_type       as enum ('special_ended', 'price_incorrect', 'times_incorrect', 'restaurant_closed', 'address_incorrect', 'other');
create type report_status     as enum ('new', 'reviewing', 'resolved', 'dismissed');
create type review_status     as enum ('pending', 'approved', 'rejected', 'needs_more_evidence');
create type confidence_level  as enum ('low', 'medium', 'high');

-- ------------------------------------------------------------ shared helpers

-- Every day/time decision on this site is made in Cape Town's timezone.
create or replace function public.current_cpt_date()
returns date
language sql
stable
as $$
  select (now() at time zone 'Africa/Johannesburg')::date;
$$;

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

-- ------------------------------------------------------- administrator roles

-- Approved administrators. A row here alone is not enough: `approved` must be
-- true, which only an existing administrator (or the project owner via the SQL
-- editor) can set.
create table public.admin_profiles (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null unique references auth.users (id) on delete cascade,
  email       text not null,
  full_name   text,
  approved    boolean not null default false,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

create index admin_profiles_user_id_idx on public.admin_profiles (user_id);
create trigger admin_profiles_set_updated_at
  before update on public.admin_profiles
  for each row execute function public.set_updated_at();

-- Security definer so policies can consult the table without recursing through
-- its own row-level security.
create or replace function public.is_approved_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.admin_profiles
    where user_id = auth.uid()
      and approved = true
  );
$$;

revoke execute on function public.is_approved_admin() from public;
grant execute on function public.is_approved_admin() to authenticated;

-- ------------------------------------------------------------- restaurants

create table public.restaurants (
  id              uuid primary key default gen_random_uuid(),
  name            text not null check (length(btrim(name)) between 1 and 160),
  slug            text not null unique check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  description     text check (length(description) <= 2000),
  categories      text[] not null default '{}',
  street_address  text not null check (length(btrim(street_address)) between 1 and 240),
  -- The site covers one suburb. The constraint makes that a data rule, not a
  -- convention someone can forget.
  suburb          text not null default 'Gardens' check (lower(btrim(suburb)) = 'gardens'),
  latitude        numeric(9, 6) check (latitude between -90 and 90),
  longitude       numeric(9, 6) check (longitude between -180 and 180),
  phone           text check (phone ~ '^\+?[0-9 ()-]{6,20}$'),
  website_url     text check (website_url ~* '^https?://'),
  booking_url     text check (booking_url ~* '^https?://'),
  instagram_url   text check (instagram_url ~* '^https?://'),
  facebook_url    text check (facebook_url ~* '^https?://'),
  google_maps_url text check (google_maps_url ~* '^https?://'),
  image_url       text check (image_url ~* '^https?://'),
  active          boolean not null default true,
  last_checked_at date,
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create index restaurants_active_idx on public.restaurants (active);
create index restaurants_name_idx on public.restaurants (lower(name));
create trigger restaurants_set_updated_at
  before update on public.restaurants
  for each row execute function public.set_updated_at();

-- ---------------------------------------------------------------- specials

create table public.specials (
  id                    uuid primary key default gen_random_uuid(),
  -- Restrict rather than cascade: deleting a venue with live specials should
  -- be a deliberate two-step action, not a silent sweep.
  restaurant_id         uuid not null references public.restaurants (id) on delete restrict,
  title                 text not null check (length(btrim(title)) between 1 and 120),
  description           text not null check (length(btrim(description)) between 1 and 1000),
  price                 numeric(10, 2) check (price >= 0),
  original_price        numeric(10, 2) check (original_price >= 0),
  category              special_category not null,
  dietary_tags          dietary_tag[] not null default '{}',
  days_of_week          smallint[] not null,
  start_time            time,
  end_time              time,
  valid_from            date,
  valid_until           date,
  terms                 text check (length(terms) <= 1000),
  booking_required      boolean not null default false,
  public_holiday_status holiday_status not null default 'unknown',
  source_url            text not null check (source_url ~* '^https?://'),
  source_type           source_type not null,
  source_published_at   date,
  last_verified_at      date not null default public.current_cpt_date(),
  verification_status   verification_status not null default 'unverified',
  featured              boolean not null default false,
  active                boolean not null default true,
  created_at            timestamptz not null default now(),
  updated_at            timestamptz not null default now(),

  -- At least one weekday, at most seven, all in Monday(1)..Sunday(7).
  constraint specials_days_not_empty check (array_length(days_of_week, 1) between 1 and 7),
  constraint specials_days_in_range check (
    days_of_week <@ array[1, 2, 3, 4, 5, 6, 7]::smallint[]
  ),
  -- A start time without an end time (or the reverse) is ambiguous.
  constraint specials_times_paired check (
    (start_time is null and end_time is null) or (start_time is not null and end_time is not null)
  ),
  constraint specials_dates_ordered check (
    valid_from is null or valid_until is null or valid_until >= valid_from
  ),
  constraint specials_discount_sensible check (
    price is null or original_price is null or original_price >= price
  ),
  constraint specials_source_date_sane check (
    source_published_at is null or source_published_at <= last_verified_at
  )
);

create index specials_restaurant_idx on public.specials (restaurant_id);
create index specials_public_idx on public.specials (active, verification_status, valid_until);
create index specials_days_idx on public.specials using gin (days_of_week);
create index specials_verified_idx on public.specials (last_verified_at desc);
create index specials_expiry_idx on public.specials (valid_until) where valid_until is not null;

create trigger specials_set_updated_at
  before update on public.specials
  for each row execute function public.set_updated_at();

-- Deduplicate identical days arrays so `days_of_week` is always sorted and unique.
create or replace function public.normalise_days_of_week()
returns trigger
language plpgsql
as $$
begin
  select array_agg(distinct day order by day)
    into new.days_of_week
    from unnest(new.days_of_week) as day;
  return new;
end;
$$;

create trigger specials_normalise_days
  before insert or update of days_of_week on public.specials
  for each row execute function public.normalise_days_of_week();

-- ----------------------------------------------------------------- reports

create table public.reports (
  id          uuid primary key default gen_random_uuid(),
  special_id  uuid not null references public.specials (id) on delete cascade,
  report_type report_type not null,
  -- Deliberately no reporter identity is stored.
  comment     text check (length(comment) <= 500),
  created_at  timestamptz not null default now(),
  status      report_status not null default 'new'
);

create index reports_special_idx on public.reports (special_id);
create index reports_status_idx on public.reports (status, created_at desc);

-- ---------------------------------------------------------- research queue

create table public.research_queue (
  id                    uuid primary key default gen_random_uuid(),
  restaurant_id         uuid references public.restaurants (id) on delete set null,
  proposed_special_data jsonb not null default '{}'::jsonb,
  source_url            text not null check (source_url ~* '^https?://'),
  detected_at           date not null default public.current_cpt_date(),
  confidence            confidence_level not null default 'low',
  review_status         review_status not null default 'pending',
  reviewer_notes        text check (length(reviewer_notes) <= 2000),
  created_at            timestamptz not null default now(),
  updated_at            timestamptz not null default now()
);

create index research_queue_status_idx on public.research_queue (review_status, detected_at desc);
create trigger research_queue_set_updated_at
  before update on public.research_queue
  for each row execute function public.set_updated_at();

-- ==========================================================================
-- Row-level security
-- ==========================================================================

alter table public.restaurants     enable row level security;
alter table public.specials        enable row level security;
alter table public.reports         enable row level security;
alter table public.research_queue  enable row level security;
alter table public.admin_profiles  enable row level security;

-- Restaurants: anyone may read active venues; only approved admins may write.
create policy restaurants_public_read on public.restaurants
  for select to anon, authenticated
  using (active = true);

create policy restaurants_admin_all on public.restaurants
  for all to authenticated
  using (public.is_approved_admin())
  with check (public.is_approved_admin());

-- Specials: the public sees only active, verified, in-date offers at active
-- venues. Expiry is evaluated in Cape Town time.
create policy specials_public_read on public.specials
  for select to anon, authenticated
  using (
    active = true
    and verification_status = 'verified'
    and (valid_from is null or valid_from <= public.current_cpt_date())
    and (valid_until is null or valid_until >= public.current_cpt_date())
    and exists (
      select 1 from public.restaurants r
      where r.id = specials.restaurant_id and r.active = true
    )
  );

create policy specials_admin_all on public.specials
  for all to authenticated
  using (public.is_approved_admin())
  with check (public.is_approved_admin());

-- Reports: anyone may submit one about a currently visible special; nobody but
-- an approved admin may read them back.
create policy reports_public_insert on public.reports
  for insert to anon, authenticated
  with check (
    exists (
      select 1 from public.specials s
      where s.id = special_id and s.active = true
    )
  );

create policy reports_admin_read on public.reports
  for select to authenticated
  using (public.is_approved_admin());

create policy reports_admin_write on public.reports
  for update to authenticated
  using (public.is_approved_admin())
  with check (public.is_approved_admin());

create policy reports_admin_delete on public.reports
  for delete to authenticated
  using (public.is_approved_admin());

-- Research queue: administrators only, in every direction.
create policy research_queue_admin_all on public.research_queue
  for all to authenticated
  using (public.is_approved_admin())
  with check (public.is_approved_admin());

-- Admin profiles: a signed-in user may read their own row (so the app can tell
-- them they are awaiting approval); admins may read and manage all rows.
create policy admin_profiles_self_read on public.admin_profiles
  for select to authenticated
  using (user_id = auth.uid() or public.is_approved_admin());

create policy admin_profiles_admin_write on public.admin_profiles
  for all to authenticated
  using (public.is_approved_admin())
  with check (public.is_approved_admin());

-- ==========================================================================
-- Convenience views for the admin dashboard
-- ==========================================================================

-- Verified offers whose last check is more than 30 days old.
create or replace view public.specials_needing_recheck as
  select s.*, r.name as restaurant_name
  from public.specials s
  join public.restaurants r on r.id = s.restaurant_id
  where s.active = true
    and s.last_verified_at < public.current_cpt_date() - 30;

-- Offers that end within the next seven days.
create or replace view public.specials_expiring_soon as
  select s.*, r.name as restaurant_name
  from public.specials s
  join public.restaurants r on r.id = s.restaurant_id
  where s.active = true
    and s.valid_until is not null
    and s.valid_until between public.current_cpt_date() and public.current_cpt_date() + 7;

-- Views inherit the caller's permissions on the underlying tables.
alter view public.specials_needing_recheck set (security_invoker = on);
alter view public.specials_expiring_soon  set (security_invoker = on);

grant select on public.specials_needing_recheck to authenticated;
grant select on public.specials_expiring_soon  to authenticated;
