-- ============================================================================
-- The Happy Hours — verified seed data
-- GENERATED FILE. Edit src/lib/data/seed.ts and run `npm run seed:sql`.
--
-- Every special below carries the source URL it was verified against and the
-- date it was checked. Candidates that could not be confirmed are inserted
-- into research_queue instead, where they stay out of public results.
-- ============================================================================

begin;

-- ---------------------------------------------------------- restaurants
insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000001', 'Rick''s Café Américain', 'ricks-cafe-americain', 'Bar and restaurant spread over three levels of a Victorian building on Kloof Street, with a ground-floor cocktail bar and a rooftop terrace.', array['Bar', 'Restaurant', 'Moroccan', 'Cocktails']::text[],
  '103 Kloof Street, corner Weltevreden Avenue', 'Gardens', null, null, '+27214241100',
  'https://rickscafe.co.za', 'https://www.dineplan.com/widgetframe/k6Q47NmF', 'https://www.instagram.com/rickscapetown/', null,
  'https://www.google.com/maps/search/?api=1&query=Rick''s%20Caf%C3%A9%20Am%C3%A9ricain%2C%20103%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-20'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000002', 'Hudsons The Burger Joint — Kloof Street', 'hudsons-kloof-street', 'Burger and pizza restaurant on Kloof Street with a fireplace, outdoor seating and live sport.', array['Burgers', 'Pizza', 'Bar']::text[],
  '22 Kloof Street', 'Gardens', null, null, '+27214265974',
  'https://www.theburgerjoint.co.za', 'https://www.dineplan.com/restaurants/hudsons-kloof-street', 'https://www.instagram.com/hudsonsburgers/', null,
  'https://www.google.com/maps/search/?api=1&query=Hudsons%20The%20Burger%20Joint%20Kloof%20Street%2C%2022%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-20'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000003', 'Our Local — Kloof Street', 'our-local-kloof-street', 'All-day neighbourhood café and bakery on Kloof Street, serving breakfast and lunch daily and dinner from Thursday to Saturday.', array['Café', 'Bakery', 'Bistro']::text[],
  '117 Kloof Street', 'Gardens', null, null, '+27646425004',
  'https://ourlocal.co.za', 'https://account.dineplan.com/widgetframe/K1zRjn6V', 'https://www.instagram.com/our_local/', null,
  'https://www.google.com/maps/search/?api=1&query=Our%20Local%20Kloof%20Street%2C%20117%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-20'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000004', 'Maru Korean Steakhouse', 'maru-korean-steakhouse', 'Korean steakhouse on Bree Street, grilling grass-fed and Wagyu beef at the table.', array['Korean', 'Steakhouse', 'Bar']::text[],
  '107 Bree Street', 'Cape Town City Centre', null, null, null,
  'https://www.restaurants.co.za/maru-korean-steakhouse', null, 'https://www.instagram.com/maru__za/', null,
  'https://www.google.com/maps/search/?api=1&query=Maru%20Korean%20Steakhouse%2C%20107%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000005', 'Florentin', 'florentin', 'Mediterranean café and bar on Bree Street, open from breakfast through to dinner.', array['Mediterranean', 'Café', 'Bar']::text[],
  'Bree Street', 'Cape Town City Centre', null, null, null,
  'https://www.dineplan.com/restaurants/florentin', 'https://www.dineplan.com/restaurants/florentin', 'https://www.instagram.com/florentin_cpt/', null,
  'https://www.google.com/maps/search/?api=1&query=Florentin%2C%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000006', 'The Hussar Grill — Camps Bay', 'hussar-grill-camps-bay', 'Long-standing South African grill house, on the Camps Bay beachfront since 1964.', array['Steakhouse', 'Grill']::text[],
  'Victoria Road', 'Camps Bay', null, null, null,
  'https://hussargrill.co.za/', null, 'https://www.instagram.com/hussargrillcampsbay/', null,
  'https://www.google.com/maps/search/?api=1&query=The%20Hussar%20Grill%20Camps%20Bay%2C%20Victoria%20Road%2C%20Camps%20Bay%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000007', 'The Hussar Grill — Mouille Point', 'hussar-grill-mouille-point', 'The Mouille Point branch of the Hussar Grill, a block from the promenade.', array['Steakhouse', 'Grill']::text[],
  'Beach Road', 'Mouille Point', null, null, null,
  'https://hussargrill.co.za/', null, 'https://www.instagram.com/hussargrillmouillepoint/', null,
  'https://www.google.com/maps/search/?api=1&query=The%20Hussar%20Grill%20Mouille%20Point%2C%20Beach%20Road%2C%20Mouille%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000008', 'The Nines', 'the-nines', 'Sea Point restaurant and bar with a seafood-leaning menu and live jazz Sundays.', array['Restaurant', 'Bar', 'Seafood']::text[],
  'Main Road', 'Sea Point', null, null, null,
  'https://www.restaurants.co.za/the-nines', null, 'https://www.instagram.com/thenines/', null,
  'https://www.google.com/maps/search/?api=1&query=The%20Nines%2C%20Main%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000009', 'Our Local — Sea Point', 'our-local-sea-point', 'The Sea Point branch of the all-day café and bakery, with dinner Thursday to Saturday.', array['Café', 'Bakery', 'Bistro']::text[],
  '295 Main Road', 'Sea Point', null, null, '+27696653996',
  'https://ourlocal.co.za', 'https://account.dineplan.com/widgetframe/5m0YgX1y', 'https://www.instagram.com/our_local/', null,
  'https://www.google.com/maps/search/?api=1&query=Our%20Local%20Sea%20Point%2C%20295%20Main%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000000a', 'Club Kloof', 'club-kloof', 'Bar and grill at the top of Kloof Street, known for steak and frites.', array['Bar', 'Grill']::text[],
  '84 Kloof Street', 'Tamboerskloof', null, null, null,
  'https://www.dineplan.com/restaurants/club-kloof', 'https://www.dineplan.com/restaurants/club-kloof', 'https://www.instagram.com/clubkloof_/', null,
  'https://www.google.com/maps/search/?api=1&query=Club%20Kloof%2C%2084%20Kloof%20Street%2C%20Tamboerskloof%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000000b', 'Café Extrablatt', 'cafe-extrablatt', 'Double-storey German café and bar near the stadium, open from breakfast until late.', array['Café', 'Bar', 'German', 'Pizza']::text[],
  '79 Main Road', 'Green Point', null, null, '+27214343759',
  'https://www.cafe-extrablatt.co.za/', 'https://www.dineplan.com/restaurants/cafe-extrablatt', 'https://www.instagram.com/extrablatt_cpt/', null,
  'https://www.google.com/maps/search/?api=1&query=Caf%C3%A9%20Extrablatt%2C%2079%20Main%20Road%2C%20Green%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000000c', 'The Woodlands Eatery', 'the-woodlands-eatery', 'Italian pizzeria and trattoria on a quiet Oranjezicht corner, run by two Italian owners since 2017.', array['Italian', 'Pizza', 'Pasta']::text[],
  '8 Breda Street', 'Oranjezicht', null, null, '+27637104742',
  'https://thewoodlandseatery.com/', 'https://www.dineplan.com/restaurants/the-woodlands-eatery', 'https://www.instagram.com/the_woodlands_eatery/', 'https://www.facebook.com/woodlandseatery/',
  'https://www.google.com/maps/search/?api=1&query=The%20Woodlands%20Eatery%2C%208%20Breda%20Street%2C%20Oranjezicht%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000000d', 'Burger & Lobster', 'burger-and-lobster', 'The Cape Town branch of the London burger and lobster house, on Bree Street.', array['Burgers', 'Seafood']::text[],
  '105 Bree Street', 'Cape Town City Centre', null, null, null,
  'https://burgerandlobster.co.za/', null, 'https://www.instagram.com/burgerlobstersa/', null,
  'https://www.google.com/maps/search/?api=1&query=Burger%20%26%20Lobster%20Cape%20Town%2C%20105%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000000e', 'Flirt Mexican Restaurant', 'flirt-mexican', 'Mexican restaurant and cocktail bar on Church Street, with a DJ at the weekend.', array['Mexican', 'Cocktails', 'Bar']::text[],
  '75 Church Street', 'Cape Town City Centre', null, null, null,
  'https://flirtcpt.co.za/', null, 'https://www.instagram.com/flirt_cpt/', null,
  'https://www.google.com/maps/search/?api=1&query=Flirt%20Mexican%20Restaurant%2C%2075%20Church%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000000f', 'fable cocktail bar', 'fable-cocktail-bar', 'Cocktail bar on the corner of Bree and Wale, with a daily happy hour and a daytime sandwich-and-pie menu on the days it opens at noon.', array['Cocktails', 'Bar', 'Small plates']::text[],
  'Corner Bree Street and Wale Street', 'Cape Town City Centre', null, null, '+27660097786',
  'https://fablecocktailbar.capetown/', 'https://www.dineplan.com/restaurants/fable-cocktail-bar', 'https://www.instagram.com/fablecpt/', 'https://www.facebook.com/fablecpt',
  'https://www.google.com/maps/search/?api=1&query=fable%20cocktail%20bar%2C%20Corner%20Bree%20and%20Wale%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000010', 'Amura at Mount Nelson', 'amura-mount-nelson', 'Restaurant at the Mount Nelson Hotel on Orange Street, serving a seasonal four-course menu.', array['Fine dining', 'Hotel restaurant']::text[],
  '76 Orange Street', 'Gardens', null, null, null,
  null, 'https://www.dineplan.com/restaurants/amura', 'https://www.instagram.com/amuracapetown/', null,
  'https://www.google.com/maps/search/?api=1&query=Amura%20at%20Mount%20Nelson%2C%2076%20Orange%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000011', 'Copa Restaurant', 'copa-restaurant', 'Restaurant at the Pepperclub Hotel on Loop Street.', array['Restaurant', 'Hotel restaurant']::text[],
  '167 Loop Street, Pepperclub Hotel', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/copa', null, null,
  'https://www.google.com/maps/search/?api=1&query=Copa%20Restaurant%2C%20167%20Loop%20Street%2C%20Pepperclub%20Hotel%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000012', 'FYN Restaurant', 'fyn-restaurant', 'Fine-dining restaurant on Parliament Street pairing South African produce with Japanese technique.', array['Fine dining', 'Japanese', 'Tasting menu']::text[],
  '37 Parliament Street', 'Cape Town City Centre', null, null, null,
  'https://www.fynrestaurant.com', 'https://www.dineplan.com/restaurants/fyn', 'https://www.instagram.com/fynrestaurantcpt/', null,
  'https://www.google.com/maps/search/?api=1&query=FYN%20Restaurant%2C%2037%20Parliament%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000013', 'Hacienda', 'hacienda-bree', 'Mexican Baja Californian kitchen and bar on Bree Street.', array['Mexican', 'Bar', 'Sharing plates']::text[],
  '92 Bree Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/hacienda', 'https://www.instagram.com/hacienda_sa/', null,
  'https://www.google.com/maps/search/?api=1&query=Hacienda%2C%2092%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000014', 'Iron Steak and Bar', 'iron-steak-and-bar', 'Steakhouse and bar on Bree Street.', array['Steakhouse', 'Bar']::text[],
  '114 Bree Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/iron-steak-and-bar', 'https://www.instagram.com/ironsteaksa/', null,
  'https://www.google.com/maps/search/?api=1&query=Iron%20Steak%20and%20Bar%2C%20114%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000015', 'Mint Restaurant at Taj Cape Town', 'mint-taj-cape-town', 'Restaurant at the Taj hotel on Wale Street, with a menu that changes destination monthly.', array['Restaurant', 'Hotel restaurant']::text[],
  '1 Wale Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/mint', null, null,
  'https://www.google.com/maps/search/?api=1&query=Mint%20Restaurant%20at%20Taj%20Cape%20Town%2C%201%20Wale%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000016', 'Nikkei Japanese Peruvian', 'nikkei-japanese-peruvian', 'Japanese-Peruvian restaurant on Bree Street.', array['Japanese', 'Peruvian', 'Sushi']::text[],
  '87 Bree Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/nikkei', 'https://www.instagram.com/nikkei_za/', null,
  'https://www.google.com/maps/search/?api=1&query=Nikkei%20Japanese%20Peruvian%2C%2087%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000017', 'The Waterside', 'the-waterside', 'Five-course tasting restaurant on Shortmarket Street.', array['Fine dining', 'Tasting menu']::text[],
  '55 Shortmarket Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/the-waterside', 'https://www.instagram.com/thewatersidect/', null,
  'https://www.google.com/maps/search/?api=1&query=The%20Waterside%2C%2055%20Shortmarket%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000018', 'The Wes Bistro and Bar', 'the-wes-bistro-and-bar', 'Bistro and bar on Shortmarket Street.', array['Bistro', 'Bar']::text[],
  '55 Shortmarket Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/the-wes', null, null,
  'https://www.google.com/maps/search/?api=1&query=The%20Wes%20Bistro%20and%20Bar%2C%2055%20Shortmarket%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000019', 'Yatai Japanese', 'yatai-japanese', 'Japanese restaurant on Bree Street serving a curated sharing menu.', array['Japanese', 'Sharing plates']::text[],
  '87 Bree Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/yatai', 'https://www.instagram.com/yatai_za/', null,
  'https://www.google.com/maps/search/?api=1&query=Yatai%20Japanese%2C%2087%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000001a', 'Grand Pavilion', 'grand-pavilion', 'Restaurant on the Sea Point promenade.', array['Restaurant', 'Seaside']::text[],
  '277 Beach Road', 'Sea Point', null, null, null,
  null, 'https://www.dineplan.com/restaurants/grand-pavilion', 'https://www.instagram.com/grand_pavilion/', null,
  'https://www.google.com/maps/search/?api=1&query=Grand%20Pavilion%2C%20277%20Beach%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000001b', 'The President Hotel', 'the-president-hotel', 'Hotel on Alexander Road with three public venues — The Restaurant, Botany Cafe and the Senate Bar. The hotel''s own site calls the address Bantry Bay and its booking page calls it Sea Point; Alexander Road is the boundary between the two, and it is a short walk from the Sea Point promenade either way.', array['Hotel restaurant', 'Wine pairing', 'Sunday lunch']::text[],
  '4 Alexander Road', 'Sea Point', null, null, '+27214348111',
  'https://www.presidenthotel.co.za', 'https://www.dineplan.com/restaurants/the-president-hotel', 'https://www.instagram.com/thepresidentct/', null,
  'https://www.google.com/maps/search/?api=1&query=The%20President%20Hotel%2C%204%20Alexander%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-26'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000001c', 'Harry''s Beach', 'harrys-beach', 'Beachfront restaurant on Victoria Road in Camps Bay.', array['Restaurant', 'Seaside']::text[],
  '41 Victoria Road', 'Camps Bay', null, null, null,
  null, 'https://www.dineplan.com/restaurants/harrys-beach', 'https://www.instagram.com/harrysbeach_/', null,
  'https://www.google.com/maps/search/?api=1&query=Harry''s%20Beach%2C%2041%20Victoria%20Road%2C%20Camps%20Bay%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000001d', 'Harbour House Camps Bay', 'harbour-house-camps-bay', 'Seafood restaurant on the Camps Bay promenade.', array['Seafood', 'Restaurant']::text[],
  '87 Victoria Road, The Promenade', 'Camps Bay', null, null, null,
  null, 'https://www.dineplan.com/restaurants/harbour-house-camps-bay', 'https://www.instagram.com/harbourhouseza/', null,
  'https://www.google.com/maps/search/?api=1&query=Harbour%20House%20Camps%20Bay%2C%2087%20Victoria%20Road%2C%20The%20Promenade%2C%20Camps%20Bay%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000001e', 'Salsify at the Roundhouse', 'salsify-at-the-roundhouse', 'Fine-dining restaurant in the historic Round House above Camps Bay.', array['Fine dining', 'Tasting menu']::text[],
  'Round House Road, Kloof Road', 'Camps Bay', null, null, null,
  null, 'https://www.dineplan.com/restaurants/salsify-at-the-roundhouse', 'https://www.instagram.com/salsify_at_the_roundhouse/', null,
  'https://www.google.com/maps/search/?api=1&query=Salsify%20at%20the%20Roundhouse%2C%20Round%20House%20Road%2C%20Kloof%20Road%2C%20Camps%20Bay%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000001f', 'Rita''s Cocktail Club', 'ritas-cocktail-club', 'Rooftop tequila and cocktail bar on Kloof Street, with small plates and a daily social hour.', array['Cocktails', 'Bar', 'Tequila', 'Small plates']::text[],
  '22 Kloof Street', 'Gardens', null, null, '+27213006695',
  'https://www.ritascocktailclub.com/', 'https://account.dineplan.com/widgetframe/lg0VXhdN', 'https://www.instagram.com/ritascocktailclub/', null,
  'https://www.google.com/maps/search/?api=1&query=Rita''s%20Cocktail%20Club%2C%2022%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000020', 'Kloof Street House', 'kloof-street-house', 'Victorian house on Kloof Street with a garden, several dining rooms and live jazz over Sunday lunch.', array['Restaurant', 'Bar', 'Live music']::text[],
  '30 Kloof Street', 'Gardens', null, null, '+27214234413',
  'https://www.kloofstreethouse.co.za/', 'https://www.kloofstreethouse.co.za/reservations/', 'https://www.instagram.com/kloofstreethouse/', null,
  'https://www.google.com/maps/search/?api=1&query=Kloof%20Street%20House%2C%2030%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000021', 'The Village Idiot', 'the-village-idiot', 'Pub and party bar on Loop Street, with DJs midweek and a different food-and-drink offer most nights.', array['Bar', 'Pub', 'Pizza', 'Live DJ']::text[],
  '32 Loop Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/the-village-idiot', 'https://www.instagram.com/thevillageidiotct/', null,
  'https://www.google.com/maps/search/?api=1&query=The%20Village%20Idiot%2C%2032%20Loop%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000022', 'Clarke''s Bar & Dining Room', 'clarkes-bar-and-dining-room', 'All-day diner and bar on Bree Street, known for sandwiches, breakfast served all day, and a beer deal in the afternoon sun.', array['Diner', 'Bar', 'Breakfast', 'Sandwiches']::text[],
  '133 Bree Street', 'Cape Town City Centre', null, null, '+27874700165',
  null, null, 'https://www.instagram.com/clarkescapetown/', null,
  'https://www.google.com/maps/search/?api=1&query=Clarke''s%20Bar%20%26%20Dining%20Room%2C%20133%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000023', 'Scala Pasta Bar', 'scala-pasta-bar', 'Pasta bar in Heritage Square, off Bree Street.', array['Italian', 'Pasta', 'Restaurant']::text[],
  '81 Church Street, Heritage Square', 'Cape Town City Centre', null, null, '+27214247204',
  null, null, 'https://www.instagram.com/scalapasta/', null,
  'https://www.google.com/maps/search/?api=1&query=Scala%20Pasta%20Bar%2C%2081%20Church%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000024', 'Mamacita''s on Kloof', 'mamacitas-on-kloof', 'Mexican restaurant and cocktail bar at the bottom of Kloof Street, running a different offer most nights of the week.', array['Mexican', 'Cocktails', 'Bar', 'Tacos']::text[],
  '8 Kloof Street', 'Cape Town City Centre', null, null, '+27834675799',
  'https://mamacitas.co.za', 'https://www.dineplan.com/restaurants/mamacitas-on-kloof', 'https://www.instagram.com/mamacitassa/', null,
  'https://www.google.com/maps/search/?api=1&query=Mamacita''s%20on%20Kloof%2C%208%20Kloof%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000025', 'Quay Four', 'quay-four', 'Long-running waterfront tavern and restaurant on the Pierhead, with a deck over the harbour and live bands most nights.', array['Seafood', 'Pub', 'Bar', 'Grill']::text[],
  'Quay 4, Dock Road, V&A Waterfront', 'Victoria & Alfred Waterfront', null, null, '+27214192008',
  'https://quay4.co.za', null, 'https://www.instagram.com/quayfour_/', 'https://www.facebook.com/QuayFour',
  'https://www.google.com/maps/search/?api=1&query=Quay%20Four%2C%20Dock%20Road%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000026', 'Upper Quay', 'upper-quay', 'The upstairs restaurant above Quay Four, with harbour views and a quieter, more sit-down menu than the tavern below.', array['Seafood', 'Restaurant', 'Bar']::text[],
  'Quay 4, Dock Road, V&A Waterfront', 'Victoria & Alfred Waterfront', null, null, '+27214192008',
  'https://quay4.co.za', null, 'https://www.instagram.com/upper_quay/', null,
  'https://www.google.com/maps/search/?api=1&query=Upper%20Quay%2C%20Dock%20Road%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000027', 'Mitchell''s Scottish Ale House', 'mitchells-scottish-ale-house', 'Scottish-themed ale house on the East Pier, brewing its own beers and open until 2am seven days a week.', array['Pub', 'Beer', 'Bar', 'Burgers']::text[],
  'East Pier & Dock Road, V&A Waterfront', 'Victoria & Alfred Waterfront', null, null, '+27214195074',
  'https://mitchellsalehouse.co.za', null, 'https://www.instagram.com/mitchellsalehouse/', 'https://www.facebook.com/MitchellsAleHouse/',
  'https://www.google.com/maps/search/?api=1&query=Mitchell''s%20Scottish%20Ale%20House%2C%20East%20Pier%2C%20Dock%20Road%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000028', 'Ferryman''s Irish Tavern', 'ferrymans-irish-tavern', 'Irish pub in the old Locomotive Shed, pouring Guinness with a beer garden and live music midweek.', array['Pub', 'Irish', 'Bar', 'Beer']::text[],
  'Locomotive Shed, Dock Road, V&A Waterfront', 'Victoria & Alfred Waterfront', null, null, '+27214197748',
  'https://ferrymans.co.za', null, 'https://www.instagram.com/ferrymansirishtavern/', 'https://www.facebook.com/FerrymansPub/',
  'https://www.google.com/maps/search/?api=1&query=Ferryman''s%20Irish%20Tavern%2C%20Locomotive%20Shed%2C%20Dock%20Road%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000029', 'Harringtons Cocktail Lounge', 'harringtons-cocktail-lounge', 'Cocktail lounge on Harrington Street in the East City, above the Harringtons distillery tasting room.', array['Cocktails', 'Bar', 'Lounge']::text[],
  '61B Harrington Street, East City', 'Cape Town City Centre', null, null, '+27784599940',
  'https://harringtons.co.za', null, 'https://www.instagram.com/harringtonsct/', null,
  'https://www.google.com/maps/search/?api=1&query=Harringtons%20Cocktail%20Lounge%2C%2061B%20Harrington%20Street%2C%20East%20City%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000002a', 'ONOMO Hotel Cape Town — Inn on the Square', 'onomo-inn-on-the-square', 'Hotel bar and terrace on Greenmarket Square, in the middle of the old city, open to non-residents.', array['Hotel bar', 'Bar', 'Beer']::text[],
  '10 Greenmarket Square', 'Cape Town City Centre', null, null, '+27214221286',
  'https://www.onomohotels.com/en/etablissement/onomo-hotel-cape-town-inn-on-the-square/', null, 'https://www.instagram.com/onomoinnonthesquare/', null,
  'https://www.google.com/maps/search/?api=1&query=ONOMO%20Hotel%20Cape%20Town%20Inn%20on%20the%20Square%2C%2010%20Greenmarket%20Square%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000002b', 'The Tiki Tomb', 'the-tiki-tomb', 'Basement tiki bar on Bree Street, over-25s only, with karaoke midweek and rum drinks in scorpion bowls.', array['Cocktails', 'Bar', 'Tiki', 'Late night']::text[],
  '101 Bree Street', 'Cape Town City Centre', null, null, '+27210038114',
  'https://thefirmct.co.za/tiki-tomb', 'https://www.dineplan.com/restaurants/tiki-tomb', 'https://www.instagram.com/thetikitomb/', 'https://www.facebook.com/thetikitomb/',
  'https://www.google.com/maps/search/?api=1&query=The%20Tiki%20Tomb%2C%20101%20Bree%20Street%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000002c', 'Judd''s Local', 'judds-local', 'Neighbourhood wine bar and bottle shop at the top of Kloof Street, pouring small-producer South African wine by the glass.', array['Wine bar', 'Bar', 'Bistro']::text[],
  '141 Kloof Street', 'Gardens', null, null, '+27645271272',
  'https://juddslocal.co.za', null, 'https://www.instagram.com/juddslocal/', null,
  'https://www.google.com/maps/search/?api=1&query=Judd''s%20Local%2C%20141%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000002d', 'Den Anker', 'den-anker', 'Belgian restaurant and bar on the Pierhead, thirty years in, known for mussel pots and a long beer list.', array['Belgian', 'Seafood', 'Bar', 'Beer']::text[],
  'Pierhead, V&A Waterfront', 'Victoria & Alfred Waterfront', null, null, '+27214190249',
  'https://www.denanker.co.za', null, 'https://www.instagram.com/den_anker/', null,
  'https://www.google.com/maps/search/?api=1&query=Den%20Anker%2C%20Pierhead%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000002e', 'London Road Bistro', 'london-road-bistro', 'Bistro and bar inside The Hyde Hotel, a block back from the Sea Point promenade.', array['Bistro', 'Bar', 'Burgers']::text[],
  '13 London Road, The Hyde Hotel', 'Sea Point', null, null, '+27214340205',
  null, 'https://www.dineplan.com/restaurants/london-road-bistro-at-the-hyde-hotel', 'https://www.instagram.com/london_road_bistro/', null,
  'https://www.google.com/maps/search/?api=1&query=London%20Road%20Bistro%2C%2013%20London%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000002f', 'Filini', 'filini', 'Italian restaurant and bar in the Radisson Hotel on Heerengracht, at the Foreshore end of the city centre.', array['Italian', 'Pizza', 'Hotel bar', 'Bar']::text[],
  '29 Heerengracht Street, Foreshore', 'Cape Town City Centre', null, null, '+27214274800',
  'https://www.radissonhotels.com/en-us/hotels/radisson-cape-town-foreshore/restaurant-bar', null, 'https://www.instagram.com/radissonhotelcapetown/', null,
  'https://www.google.com/maps/search/?api=1&query=Filini%20Radisson%20Hotel%2C%2029%20Heerengracht%20Street%2C%20Foreshore%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000030', 'Tiger''s Milk — Kloof Street', 'tigers-milk-kloof-street', 'Burger and beer bar halfway up Kloof Street, open to midnight seven days a week.', array['Burgers', 'Bar', 'Beer', 'Pizza']::text[],
  '55 Kloof Street', 'Gardens', null, null, null,
  'https://www.tigersmilk.co.za/location/kloof-street/', null, 'https://www.instagram.com/tigersmilkza/', 'https://www.facebook.com/TMKloofStreet/',
  'https://www.google.com/maps/search/?api=1&query=Tiger''s%20Milk%20Kloof%20Street%2C%2055%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000031', 'Tiger''s Milk — Long Street', 'tigers-milk-long-street', 'The Long Street branch of the burger and beer chain, at the bottom end near the Company''s Garden.', array['Burgers', 'Bar', 'Beer', 'Pizza']::text[],
  '44 Long Street', 'Cape Town City Centre', null, null, null,
  'https://www.tigersmilk.co.za/location/long-street/', null, 'https://www.instagram.com/tigersmilkza/', 'https://www.facebook.com/TMLongStreet/',
  'https://www.google.com/maps/search/?api=1&query=Tiger''s%20Milk%20Long%20Street%2C%2044%20Long%20Street%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000032', 'Duchess of Wisbeach', 'duchess-of-wisbeach', 'Long-standing candlelit dining room on Main Road in Sea Point, dinner only, with a late bar after the kitchen closes.', array['Restaurant', 'Fine dining', 'Bar']::text[],
  '321 Main Road', 'Sea Point', null, null, '+27712894142',
  'https://duchessofwisbeach.co.za', 'https://www.dineplan.com/restaurants/duchess-of-wisbeach', 'https://www.instagram.com/duchessofwisbeach/', null,
  'https://www.google.com/maps/search/?api=1&query=Duchess%20of%20Wisbeach%2C%20321%20Main%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000033', 'Beluga', 'beluga', 'Sushi, dim sum and cocktails above the Cruise Terminal at the Waterfront, with a long-running daily specials board.', array['Sushi', 'Asian', 'Cocktails', 'Bar']::text[],
  'Alfred Chambers, 1st Floor, Cruise Terminal, Duncan Road', 'Victoria & Alfred Waterfront', null, null, '+27614340813',
  'https://www.beluga.co.za', null, 'https://www.instagram.com/belugarestaurant/', 'https://www.facebook.com/belugacapetown/',
  'https://www.google.com/maps/search/?api=1&query=Beluga%2C%20Cruise%20Terminal%2C%20Duncan%20Road%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000034', 'The Power Above', 'the-power-above', 'First-floor café and bar on Kloof Nek Road that runs from breakfast through to late, with a wood-fired pizza oven.', array['Café', 'Bar', 'Pizza']::text[],
  '13b Kloof Nek Road, 1st floor', 'Gardens', null, null, '+27212131212',
  null, null, 'https://www.instagram.com/t.h.e.p.o.w.e.r.a.b.o.v.e/', null,
  'https://www.google.com/maps/search/?api=1&query=The%20Power%20Above%2C%2013b%20Kloof%20Nek%20Road%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000035', 'ELVN11', 'elvn11', 'Rooftop restaurant and bar on the eleventh floor of the Radisson on Heerengracht, looking back over the city.', array['Restaurant', 'Rooftop', 'Bar']::text[],
  '29 Heerengracht Street, Foreshore', 'Cape Town City Centre', null, null, '+27214274800',
  null, null, 'https://www.instagram.com/elvn11_capetown/', null,
  'https://www.google.com/maps/search/?api=1&query=ELVN11%20Radisson%20Hotel%2C%2029%20Heerengracht%20Street%2C%20Foreshore%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000036', 'East City Grill', 'east-city-grill', 'Open-fire steakhouse on Harrington Street, sharing a building with the Yakiniku grill room upstairs.', array['Steakhouse', 'Grill', 'Japanese']::text[],
  '84 Harrington Street', 'Cape Town City Centre', null, null, '+27215183366',
  'https://www.eastcitygrill.co.za', 'https://www.dineplan.com/restaurants/east-city-grill', 'https://www.instagram.com/eastcitygrillct/', null,
  'https://www.google.com/maps/search/?api=1&query=East%20City%20Grill%2C%2084%20Harrington%20Street%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000037', 'mischu', 'mischu', 'Coffee roastery and all-day café on Regent Road, roasting its own beans on site.', array['Café', 'Coffee', 'Breakfast']::text[],
  '85A Regent Road', 'Sea Point', null, null, '+27214393944',
  'https://www.mischu.co.za', null, 'https://www.instagram.com/mischucoffee/', 'https://www.facebook.com/mischu.coffee/',
  'https://www.google.com/maps/search/?api=1&query=mischu%2C%2085A%20Regent%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000038', 'Aiko Sushi — Bree Street', 'aiko-sushi-bree-street', 'All-you-can-eat sushi house in the Portside building at the bottom of Bree Street, with a separate vegan menu.', array['Sushi', 'Japanese', 'Asian']::text[],
  '4 Bree Street, Portside Building', 'Cape Town City Centre', null, null, '+27214180064',
  'https://www.aikosushi.co.za/aiko-on-bree', 'https://link.withnovel.com/aiko-sushi', 'https://www.instagram.com/aikosushi.sa/', 'https://www.facebook.com/aikosushi.sa/',
  'https://www.google.com/maps/search/?api=1&query=Aiko%20Sushi%2C%204%20Bree%20Street%2C%20Portside%20Building%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000039', 'Café Manhattan', 'cafe-manhattan', 'De Waterkant institution — bar, kitchen and pavement tables, open every day from eleven until eleven.', array['Bar', 'Bistro', 'Burgers']::text[],
  '74 Waterkant Street, De Waterkant', 'Cape Town City Centre', null, null, '+27210028867',
  'https://cafemanhattan.co.za', 'https://www.dineplan.com/restaurants/cafe-manhattan0', 'https://www.instagram.com/cafemanhattans/', null,
  'https://www.google.com/maps/search/?api=1&query=Caf%C3%A9%20Manhattan%2C%2074%20Waterkant%20Street%2C%20De%20Waterkant%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000003a', 'Van Hunks', 'van-hunks', 'Laid-back bar and restaurant on the Kloof Street corner, running a different deal most nights of the week.', array['Bar', 'Restaurant', 'Mexican', 'Grill']::text[],
  'Corner Kloof Street and Upper Union Street', 'Gardens', null, null, '+27214225422',
  'https://vanhunks.co.za', null, 'https://www.instagram.com/vanhunks/', null,
  'https://www.google.com/maps/search/?api=1&query=Van%20Hunks%2C%20Corner%20Kloof%20Street%20and%20Upper%20Union%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000003b', 'Asoka', 'asoka', 'Long-running Kloof Street bar and lounge built around an olive tree, Asian-leaning tapas, open from six every night.', array['Asian', 'Tapas', 'Cocktails', 'Bar']::text[],
  '68 Kloof Street', 'Gardens', null, null, '+27214220909',
  'https://asoka.za.com', null, 'https://www.instagram.com/asokakloofstreet/', null,
  'https://www.google.com/maps/search/?api=1&query=Asoka%2C%2068%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000003c', 'Arnold''s', 'arnolds', 'Kloof Street institution opposite the Mount Nelson, open from a quarter to seven in the morning until late, 364 days a year.', array['Restaurant', 'Bar', 'Breakfast', 'Grill']::text[],
  '60 Kloof Street', 'Gardens', null, null, '+27214244344',
  'https://www.arnolds.co.za', 'https://www.dineplan.com/restaurants/arnolds-on-kloof', 'https://www.instagram.com/arnoldsonkloof/', 'https://www.facebook.com/arnoldsonkloof/',
  'https://www.google.com/maps/search/?api=1&query=Arnold''s%20Restaurant%2C%2060%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000003d', 'Chingadas', 'chingadas', 'Colourful Mexican cantina on Orange Street, tacos and mezcal, open from lunch until late.', array['Mexican', 'Tacos', 'Cocktails', 'Bar']::text[],
  '50 Orange Street', 'Gardens', null, null, null,
  null, 'https://www.dineplan.com/restaurants/chingadas-cantina-cape-town', 'https://www.instagram.com/chingadas_ct/', null,
  'https://www.google.com/maps/search/?api=1&query=Chingadas%2C%2050%20Orange%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000003e', 'Una Más Mezcalería', 'una-mas-mezcaleria', 'Mezcal and tequila bar on Regent Road with a short Mexican menu and a long agave list.', array['Mexican', 'Cocktails', 'Bar', 'Tacos']::text[],
  '77 Regent Road', 'Sea Point', null, null, null,
  'https://unamas.co.za', 'https://www.dineplan.com/restaurants/una-ms-mezcaleria', 'https://www.instagram.com/una_mas_mezcaleria/', null,
  'https://www.google.com/maps/search/?api=1&query=Una%20M%C3%A1s%20Mezcaler%C3%ADa%2C%2077%20Regent%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000003f', 'Hugo Social Club', 'hugo-social-club', 'Ninth-floor dining room and bar above Kings Road, small plates and a view down the Atlantic seaboard.', array['Restaurant', 'Small plates', 'Rooftop', 'Bar']::text[],
  '9th Floor, 2 Kings Road', 'Sea Point', null, null, null,
  null, 'https://www.dineplan.com/restaurants/hugo-social-club', 'https://www.instagram.com/hugosocialclub/', 'https://www.facebook.com/p/Hugo-Social-Club-61552286497583/',
  'https://www.google.com/maps/search/?api=1&query=Hugo%20Social%20Club%2C%202%20Kings%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000040', 'Hudsons The Burger Joint — Green Point', 'hudsons-green-point', 'The Green Point branch of the burger and pizza group, on the corner of Main and Upper Portswood.', array['Burgers', 'Pizza', 'Bar']::text[],
  'Cnr Main Road and Upper Portswood Road', 'Green Point', null, null, '+27214331496',
  'https://www.theburgerjoint.co.za', 'https://www.dineplan.com/restaurants/hudsons-green-point', 'https://www.instagram.com/hudsonsburgers/', null,
  'https://www.google.com/maps/search/?api=1&query=Hudsons%20The%20Burger%20Joint%20Green%20Point%2C%20Cnr%20Main%20Road%20and%20Upper%20Portswood%20Road%2C%20Green%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-24'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000041', 'Pigalle', 'pigalle', 'Long-running Green Point supper club — seafood, steak and a live band most nights.', array['Restaurant', 'Seafood', 'Steak', 'Live music']::text[],
  'Somerset Square, 57 Somerset Road', 'Green Point', null, null, '+27214214848',
  'https://pigalle.capetown', 'https://www.dineplan.com/restaurants/pigalle-cape-town', 'https://www.instagram.com/pigallect/', null,
  'https://www.google.com/maps/search/?api=1&query=Pigalle%2C%2057%20Somerset%20Road%2C%20Green%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-24'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000042', 'The Office', 'the-office-sea-point', 'Sports bar and grill on Main Road, Sea Point, with a different deal most nights of the week.', array['Restaurant', 'Bar', 'Burgers', 'Steak', 'Sports bar']::text[],
  'Shop 2, 315 Main Road', 'Sea Point', null, null, '+27692389125',
  'https://www.theofficecpt.com', 'https://www.theofficecpt.com/reservations', 'https://www.instagram.com/theoffice_cpt/', null,
  'https://www.google.com/maps/search/?api=1&query=The%20Office%2C%20315%20Main%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-24'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000043', 'Script', 'script', 'Lobby cocktail bar and jazz room at The Cole hotel, off the Sea Point end of Church Road.', array['Bar', 'Cocktails', 'Live music']::text[],
  '1 Church Road, The Cole', 'Sea Point', null, null, '+27210138999',
  'https://www.kovecollection.co.za/script/', 'https://calendar.dineplan.com/85PkQ6Sp?source=Web', 'https://www.instagram.com/script_thecole/', null,
  'https://www.google.com/maps/search/?api=1&query=Script%20The%20Cole%2C%201%20Church%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-24'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000044', 'Ariel Modern Italian', 'ariel-modern-italian', 'Modern Italian dining room on Regent Road, above the Jarryds building.', array['Italian', 'Restaurant', 'Pasta']::text[],
  '90 Regent Road', 'Sea Point', null, null, '+27210233643',
  'https://www.nonamehg.com/arielmodernitalian', 'https://www.dineplan.com/restaurants/ariel-modern-italian', 'https://www.instagram.com/ariel_capetown/', null,
  'https://www.google.com/maps/search/?api=1&query=Ariel%20Modern%20Italian%2C%2090%20Regent%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-24'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000045', 'KIKI', 'kiki-sea-point', 'Greek kitchen in Piccadilly Court on Regent Road, built around sharing plates.', array['Greek', 'Restaurant', 'Small plates']::text[],
  'Piccadilly Court, 85A Regent Road', 'Sea Point', null, null, '+27210232667',
  null, 'https://www.dineplan.com/restaurants/kiki', 'https://www.instagram.com/kiki.cpt/', null,
  'https://www.google.com/maps/search/?api=1&query=KIKI%20Sea%20Point%2C%2085A%20Regent%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-24'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000046', 'Kapstadt Brauhaus', 'kapstadt-brauhaus', 'German beer hall at the Clock Tower, with a different plate special most nights of the week.', array['German', 'Beer hall', 'Restaurant', 'Bar']::text[],
  'Shop G13, Clock Tower Retail Centre', 'Victoria & Alfred Waterfront', null, null, '+27214224567',
  'https://www.kapstadtbrauhaus.co.za', null, 'https://www.instagram.com/kapstadtbrauhaus/', null,
  'https://www.google.com/maps/search/?api=1&query=Kapstadt%20Brauhaus%2C%20Clock%20Tower%20Retail%20Centre%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-25'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000047', 'Gibson''s Gourmet Burgers & Ribs', 'gibsons-gourmet-burgers', 'Burgers, ribs and steaks on the ground floor of Victoria Wharf.', array['Burgers', 'Ribs', 'Steak', 'Restaurant']::text[],
  'Shop 157, Victoria Wharf Mall, Ground Level', 'Victoria & Alfred Waterfront', null, null, '+27873573465',
  'https://www.gibsonsburgers.co.za', null, 'https://www.instagram.com/gibsons_capetown/', null,
  'https://www.google.com/maps/search/?api=1&query=Gibson''s%20Gourmet%20Burgers%2C%20Victoria%20Wharf%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-25'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000048', 'Time Out Market Cape Town', 'time-out-market-cape-town', 'Food hall in the old power station, with kitchens from across the city under one roof.', array['Food hall', 'Restaurant', 'Bar']::text[],
  'The Old Power Station Building, Marina Centre, Pierhead', 'Victoria & Alfred Waterfront', null, null, '+27214087688',
  'https://www.timeoutmarket.com/capetown', null, 'https://www.instagram.com/timeoutmarketcapetown/', null,
  'https://www.google.com/maps/search/?api=1&query=Time%20Out%20Market%20Cape%20Town%2C%20Old%20Power%20Station%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-25'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000049', 'Cause & Effect Cocktail Kitchen', 'cause-and-effect-cocktail-kitchen', 'Gin-led cocktail bar and kitchen in the old Rocket Store on Dock Road.', array['Cocktails', 'Bar', 'Restaurant', 'Gin']::text[],
  'Rocket Store, 280 Dock Road, Pierhead', 'Victoria & Alfred Waterfront', null, null, '+27218790855',
  'http://causeandeffect.co.za', null, 'https://www.instagram.com/causeeffectbar/', null,
  'https://www.google.com/maps/search/?api=1&query=Cause%20and%20Effect%20Cocktail%20Kitchen%2C%20280%20Dock%20Road%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-25'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000004a', 'Sevruga', 'sevruga', 'Long-running Quays restaurant on the water, sushi alongside a wide à la carte menu.', array['Restaurant', 'Sushi', 'Seafood']::text[],
  'Shop 4, Victoria Wharf Mall, Ground Level, Quays', 'Victoria & Alfred Waterfront', null, null, '+27214215134',
  'https://www.sevruga.co.za', null, 'https://www.instagram.com/sevruga_restaurant/', null,
  'https://www.google.com/maps/search/?api=1&query=Sevruga%2C%20Victoria%20Wharf%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-25'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000004b', 'Marble Cape Town', 'marble-cape-town', 'Wood-fire cooking on the upper level of the Union Castle Building.', array['Restaurant', 'Steak', 'Fine dining']::text[],
  'Shop 7, Union Castle Building, Upper Level, Dry Dock', 'Victoria & Alfred Waterfront', null, null, '+27210028484',
  'https://marble.restaurant/capetown', null, 'https://www.instagram.com/marble_capetown/', null,
  'https://www.google.com/maps/search/?api=1&query=Marble%20Cape%20Town%2C%20Union%20Castle%20Building%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-25'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000004c', 'Tiger''s Milk — V&A Waterfront', 'tigers-milk-va-waterfront', 'The Waterfront branch of the burger, pizza and beer chain, upstairs in Victoria Wharf.', array['Burgers', 'Pizza', 'Bar', 'Restaurant']::text[],
  'Shop 261, Victoria Wharf Mall, Upper Level', 'Victoria & Alfred Waterfront', null, null, '+27217456623',
  'https://www.tigersmilk.co.za/location/va-waterfront/', null, 'https://www.instagram.com/tigersmilkza/', null,
  'https://www.google.com/maps/search/?api=1&query=Tiger''s%20Milk%20V%26A%20Waterfront%2C%20Victoria%20Wharf%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-25'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000004d', 'Fisherman''s Choice', 'fishermans-choice', 'Fish and chips counter in the Victoria Wharf food court.', array['Seafood', 'Fish and chips', 'Takeaway']::text[],
  'Unit FC10, Victoria Wharf Mall, Ground Level', 'Victoria & Alfred Waterfront', null, null, '+27214195865',
  'https://www.fishermanschoice.co.za', null, 'https://www.instagram.com/fishermans_choice/', null,
  'https://www.google.com/maps/search/?api=1&query=Fisherman''s%20Choice%2C%20Victoria%20Wharf%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-25'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000004e', 'The Azure Restaurant', 'azure-twelve-apostles', 'Ocean-facing dining room at the Twelve Apostles, at the Oudekraal end of Victoria Road.', array['Restaurant', 'Fine dining', 'Hotel restaurant', 'Seafood']::text[],
  'Twelve Apostles Hotel, Victoria Road', 'Camps Bay', null, null, '+27214379029',
  'https://12apostleshotel.com/dining-and-drinks/the-azure-restaurant', 'https://www.dineplan.com/restaurants/the-azure-restaurant-the-twelve-apostles-hotel-and-spa', null, null,
  'https://www.google.com/maps/search/?api=1&query=The%20Azure%20Restaurant%20Twelve%20Apostles%2C%20Victoria%20Road%2C%20Camps%20Bay%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-25'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000004f', 'The Greek Fisherman', 'the-greek-fisherman', 'Greek seafood taverna on Regent Road, trading straight through from late morning.', array['Greek', 'Seafood', 'Restaurant']::text[],
  '78 Regent Road', 'Sea Point', null, null, '+27214185411',
  'http://www.greekfisherman.co.za', 'https://www.dineplan.com/restaurants/greek-fisherman', 'https://www.instagram.com/greekfisherman/', null,
  'https://www.google.com/maps/search/?api=1&query=The%20Greek%20Fisherman%2C%2078%20Regent%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-26'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000050', 'Arlecchino', 'arlecchino', 'Italian dining room on Regent Road, from the Tashas group.', array['Italian', 'Restaurant']::text[],
  '16 Regent Road', 'Sea Point', null, null, '+27218791133',
  null, 'https://www.dineplan.com/restaurants/arlecchino', 'https://www.instagram.com/arlecchino_sa/', null,
  'https://www.google.com/maps/search/?api=1&query=Arlecchino%2C%2016%20Regent%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-26'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000051', 'The Red Room by Chefs Warehouse', 'the-red-room', 'Chefs Warehouse dining room in Gardens, tasting-menu led.', array['Restaurant', 'Fine dining', 'Tasting menu']::text[],
  'Gardens', 'Gardens', null, null, null,
  'https://www.chefswarehouse.co.za', null, 'https://www.instagram.com/the_red_room_cw/', null,
  'https://www.google.com/maps/search/?api=1&query=The%20Red%20Room%20by%20Chefs%20Warehouse%2C%20Gardens%2C%20Cape%20Town%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-26'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000052', 'Belly of the Beast', 'belly-of-the-beast', 'Small Harrington Street kitchen serving a chef-chosen menu with no à la carte.', array['Restaurant', 'Tasting menu', 'Fine dining']::text[],
  '108 Harrington Street', 'Cape Town City Centre', null, null, null,
  'https://www.bellyofthebeast.co.za', null, 'https://www.instagram.com/bellyofthebeast_ct/', null,
  'https://www.google.com/maps/search/?api=1&query=Belly%20of%20the%20Beast%2C%20108%20Harrington%20Street%2C%20Cape%20Town%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-26'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000053', 'Heirloom at Cape Grace', 'heirloom-cape-grace', 'Hotel dining room at the Cape Grace, on the Waterfront quay.', array['Restaurant', 'Hotel restaurant', 'Fine dining']::text[],
  'Cape Grace Hotel, West Quay Road', 'Victoria & Alfred Waterfront', null, null, null,
  'https://www.capegrace.com', null, 'https://www.instagram.com/heirloom_atcapegrace/', null,
  'https://www.google.com/maps/search/?api=1&query=Heirloom%20at%20Cape%20Grace%2C%20West%20Quay%20Road%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-26'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000054', 'Terrarium', 'terrarium-waterfront', 'Plant-filled dining room on the Waterfront, evening service only.', array['Restaurant', 'Fine dining']::text[],
  'V&A Waterfront', 'Victoria & Alfred Waterfront', null, null, null,
  null, null, null, null,
  'https://www.google.com/maps/search/?api=1&query=Terrarium%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-26'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000055', 'Tobago''s at Radisson Collection', 'tobagos-radisson', 'Waterside restaurant and bar at the Radisson Collection on Beach Road.', array['Restaurant', 'Hotel restaurant', 'Bar']::text[],
  'Radisson Collection Hotel, Beach Road', 'Victoria & Alfred Waterfront', null, null, null,
  'https://www.radissonhotels.com', null, null, null,
  'https://www.google.com/maps/search/?api=1&query=Tobago''s%20Restaurant%20and%20Bar%2C%20Beach%20Road%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-26'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000056', 'PIER', 'pier-waterfront', 'La Colombe group''s tasting-menu restaurant at the Pierhead.', array['Restaurant', 'Fine dining', 'Tasting menu', 'Seafood']::text[],
  'Pierhead, V&A Waterfront', 'Victoria & Alfred Waterfront', null, null, null,
  'https://www.lacolombe.restaurant/pier', null, 'https://www.instagram.com/pier_capetown/', null,
  'https://www.google.com/maps/search/?api=1&query=PIER%20Restaurant%2C%20Pierhead%2C%20V%26A%20Waterfront%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-26'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000057', 'Chicks and Chops', 'chicks-and-chops', 'Fried chicken and schnitzel counter on Long Street, open from late morning until midnight. Shares 163 Long Street with the bar Souk, which trades in the evening.', array['Chicken', 'Burgers', 'Casual']::text[],
  '163 Long Street', 'Cape Town City Centre', null, null, null,
  null, null, 'https://www.instagram.com/chicksandchopsza/', 'https://www.facebook.com/61574533476460/',
  'https://www.google.com/maps/search/?api=1&query=Chicks%20and%20Chops%2C%20163%20Long%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-26'
) on conflict (id) do update set
  name = excluded.name, slug = excluded.slug, description = excluded.description, categories = excluded.categories, street_address = excluded.street_address, suburb = excluded.suburb, latitude = excluded.latitude, longitude = excluded.longitude, phone = excluded.phone, website_url = excluded.website_url, booking_url = excluded.booking_url, instagram_url = excluded.instagram_url, facebook_url = excluded.facebook_url, google_maps_url = excluded.google_maps_url, image_url = excluded.image_url, active = excluded.active, last_checked_at = excluded.last_checked_at, updated_at = now();

-- ------------------------------------------------------------- specials
insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000001', 'a1000000-0000-4000-8000-000000000001', 'Happy hour',
  'Discounts on cocktails and Woodstock craft beers, every afternoon the kitchen is open.',
  null, null, 'happy_hour'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], '15:00', '18:00',
  null, null, null, false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'Golden Hour',
  'The happy-hour prices on cocktails and Woodstock craft beers run again from 10pm until midnight.',
  null, null, 'happy_hour'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], '22:00', '00:00',
  null, null, null, false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000003', 'a1000000-0000-4000-8000-000000000001', 'Two-for-one burgers',
  'Buy one burger and get a second free — the deal covers the whole burger menu.',
  null, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, '2026-09-01', 'Applies to every burger on the menu, all day.', false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000004', 'a1000000-0000-4000-8000-000000000001', 'Two margaritas for R100',
  'A pair of margaritas made with El Jimador Blanco tequila, all day Wednesday.',
  100, null, 'drinks'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, null, null, false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000005', 'a1000000-0000-4000-8000-000000000001', 'Tajine and wine Thursday',
  'Order any Moroccan tajine and a complimentary carafe of Cederberg Merlot Shiraz blend comes with it.',
  null, null, 'dinner'::special_category, '{}',
  array[4]::smallint[], null, null,
  null, '2026-08-27', 'The tajine is charged at menu price; the wine carafe is included.', false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000006', 'a1000000-0000-4000-8000-000000000001', 'Sunday lamb roast',
  'Moroccan-spiced roast leg of lamb served as a Sunday roast.',
  185, null, 'lunch'::special_category, '{}',
  array[7]::smallint[], null, null,
  null, '2026-09-30', 'Booking essential.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/ricks-cafe-americain', 'booking_page'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000007', 'a1000000-0000-4000-8000-000000000001', 'Lazy Sunday afternoon',
  'Order a tapas or mezze platter to share and two glasses of Pierre Jourdan Brut Cap Classique are included.',
  null, null, 'food'::special_category, array['vegetarian']::dietary_tag[],
  array[7]::smallint[], '15:00', '19:00',
  null, null, 'Platter charged at menu price; two glasses of Cap Classique included. Re-confirmed by a write-up of 14 August 2026.', false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000008', 'a1000000-0000-4000-8000-000000000001', 'Winter brandy special — two doubles for R90',
  'Two double brandy and Cokes at a set price, all winter, all day long.',
  90, null, 'drinks'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', null, false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000009', 'a1000000-0000-4000-8000-000000000001', 'Glühwein for R45',
  'Spiced mulled wine, poured through the winter months.',
  45, null, 'drinks'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'Listed as a winter offer; confirm availability once the season turns.', false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000010', 'a1000000-0000-4000-8000-000000000001', 'Two Aperol Spritz for R175',
  'A Women''s Month offer on Aperol Spritz, running through August.',
  175, null, 'drinks'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'Advertised as a Women''s Month promotion for August 2026.', false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000011', 'a1000000-0000-4000-8000-000000000002', 'Meat-free Monday',
  'Plant-based burgers are half price all day on Mondays.',
  null, null, 'food'::special_category, array['vegetarian', 'vegan']::dietary_tag[],
  array[1]::smallint[], null, null,
  null, '2029-02-21', 'Dine-in only.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/hudsons-kloof-street', 'booking_page'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000012', 'a1000000-0000-4000-8000-000000000002', 'Two-for-one pizzas — Pizza Two''sday',
  'Buy one pizza and a second comes free, all day Tuesday.',
  null, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, '2026-09-30', 'Dine-in only.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/hudsons-kloof-street', 'booking_page'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000013', 'a1000000-0000-4000-8000-000000000002', 'Happy hour — 30% off',
  'Thirty percent off cocktails, draught beer, starters and selected wines by the glass on weekday evenings.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], '16:30', '18:30',
  null, '2027-04-21', 'Dine-in only.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/hudsons-kloof-street', 'booking_page'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000014', 'a1000000-0000-4000-8000-000000000002', 'Linger Longer — 40% off cocktails',
  'Forty percent off the speciality cocktail list late in the evening, every night.',
  null, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '21:00', '23:00',
  null, null, 'Dine-in only.', false,
  'unknown'::holiday_status, 'https://www.theburgerjoint.co.za/specials', 'official_website'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000015', 'a1000000-0000-4000-8000-000000000003', 'Winter dinner set menu',
  'A two- or three-course winter set menu served from late afternoon, Thursday to Saturday.',
  225, null, 'dinner'::special_category, '{}',
  array[4, 5, 6]::smallint[], '16:00', '23:00',
  null, null, 'R225 for two courses, R295 for three. Listed as a winter offer with no published end date — confirm when booking.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'publication'::source_type,
  '2026-07-23', '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000016', 'a1000000-0000-4000-8000-000000000004', 'Magic Hour — half-price drinks',
  'Fifty percent off selected sparkling wine, beer and wine by the glass, every afternoon.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '16:00', '17:30',
  null, '2027-01-31', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/cape-town-central', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000017', 'a1000000-0000-4000-8000-000000000004', 'Winter set menu',
  'A sharing set menu of the kitchen’s Korean steakhouse standards.',
  349, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'Priced per person, served sharing-style.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/cape-town-central', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000018', 'a1000000-0000-4000-8000-000000000004', 'Buckets and Bubbles',
  'A Saturday-afternoon sharing menu with a complimentary glass of Prosecco.',
  399, null, 'lunch'::special_category, '{}',
  array[6]::smallint[], '12:00', '16:00',
  null, '2026-12-31', 'Priced per person, served sharing-style.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/cape-town-central', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000019', 'a1000000-0000-4000-8000-000000000005', 'Sharing experience for two',
  'A Mediterranean spread built for two people, early in the evening.',
  580, null, 'dinner'::special_category, '{}',
  array[2, 3, 4]::smallint[], '17:30', '21:00',
  null, '2026-08-28', 'R580 for two people.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/cape-town-central', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000001a', 'a1000000-0000-4000-8000-000000000005', 'Two Aperol Spritz for R180',
  'A Women’s Month offer on Aperol Spritz, running to the end of August.',
  180, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-30', 'Times vary by day: Monday to 3pm, Tuesday to Saturday to 9pm, Sunday to 2.30pm.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/cape-town-central', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000001b', 'a1000000-0000-4000-8000-000000000006', 'Tuesday date night',
  'Two or three courses for two people, with a complimentary glass of wine or a soft drink each.',
  499, null, 'dinner'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, '2026-08-31', 'R499 for two courses or R599 for three — priced per couple, evenings only.', true,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/camps-bay', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000001c', 'a1000000-0000-4000-8000-000000000006', 'Winter two-course menu',
  'Starter and main, or main and dessert, from the winter menu.',
  349, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'Priced per person. A premium red blend is offered at R60 a glass or R180 a bottle.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/camps-bay', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000001d', 'a1000000-0000-4000-8000-000000000007', 'Winter two-course menu',
  'Starter and main, or main and dessert, from the winter menu.',
  349, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'Priced per person. A premium red blend is offered at R60 a glass or R180 a bottle.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/mouille-point', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000001e', 'a1000000-0000-4000-8000-000000000007', 'Tuesday date night',
  'Two or three courses for two people, with a complimentary glass of wine or a soft drink each.',
  499, null, 'dinner'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, '2026-08-31', 'R499 for two courses or R599 for three — priced per couple, evenings only.', true,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/mouille-point', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000001f', 'a1000000-0000-4000-8000-000000000008', 'Sunday lunch with live jazz',
  'A two- or three-course Sunday set menu with paired cocktails, and a jazz set through the afternoon.',
  595, null, 'lunch'::special_category, '{}',
  array[7]::smallint[], '12:00', '17:00',
  null, '2026-10-04', 'From R595 per person, rising to R995 for the fuller menu. Jazz runs 1pm to 4pm. The venue''s own page confirms the Sunday jazz lunch and the 1pm to 4pm set but publishes no price, so the figures here come from the listing below.', true,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/sea-point', 'publication'::source_type,
  '2026-08-21', '2026-08-26', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000020', 'a1000000-0000-4000-8000-000000000009', 'Winter dinner set menu',
  'A two- or three-course winter set menu served from late afternoon, Thursday to Saturday.',
  225, null, 'dinner'::special_category, '{}',
  array[4, 5, 6]::smallint[], '16:00', '23:00',
  null, null, 'R225 for two courses, R295 for three. Listed as a winter offer with no published end date — confirm when booking.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'publication'::source_type,
  '2026-07-23', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000021', 'a1000000-0000-4000-8000-00000000000a', 'Sunday steak and frites',
  'Steak and frites with a glass of wine or a mocktail, from midday on Sundays.',
  295, null, 'lunch'::special_category, '{}',
  array[7]::smallint[], '12:00', '22:00',
  null, null, 'Priced per person. Listed as a winter offer with no published end date.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'publication'::source_type,
  '2026-07-23', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000022', 'a1000000-0000-4000-8000-00000000000b', 'Monday Madness — two pizzas for R277',
  'Two regular pizzas from the menu for a set price, all day Monday.',
  277, null, 'food'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, null, 'Menu pizzas only. Dine-in or collection.', false,
  'unknown'::holiday_status, 'https://www.cafe-extrablatt.co.za/', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000023', 'a1000000-0000-4000-8000-00000000000b', 'R95 weekday lunch',
  'A seasonal lunch plate at a set price, weekday afternoons.',
  95, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], '12:30', '14:00',
  null, null, 'Not available on public holidays or on Cape Town event days.', false,
  'not_valid'::holiday_status, 'https://www.cafe-extrablatt.co.za/', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000024', 'a1000000-0000-4000-8000-00000000000c', 'Pizza Monday — half price',
  'Fifty percent off any pizza on the menu, all day Monday.',
  null, null, 'food'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, null, 'Photographed on the winter specials card in the restaurant, and confirmed on their own website.', false,
  'unknown'::holiday_status, 'https://thewoodlandseatery.com/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000025', 'a1000000-0000-4000-8000-00000000000c', 'Sip and Supper Tuesday — a drink on the house',
  'A glass of wine or a 500ml draught beer comes free with your main course on Tuesdays.',
  null, null, 'dinner'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, null, 'One drink per main course. Photographed in the restaurant and confirmed on their website.', false,
  'unknown'::holiday_status, 'https://thewoodlandseatery.com/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000026', 'a1000000-0000-4000-8000-00000000000c', 'Pasta Wednesday — half price',
  'Fifty percent off any pasta on the menu, all day Wednesday.',
  null, null, 'food'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, null, 'Photographed in the restaurant and confirmed on their website.', false,
  'unknown'::holiday_status, 'https://thewoodlandseatery.com/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000027', 'a1000000-0000-4000-8000-00000000000c', 'Meaty Thursday — half price',
  'Fifty percent off any meat dish on the menu, all day Thursday.',
  null, null, 'food'::special_category, '{}',
  array[4]::smallint[], null, null,
  null, null, 'Photographed in the restaurant and confirmed on their website.', false,
  'unknown'::holiday_status, 'https://thewoodlandseatery.com/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000028', 'a1000000-0000-4000-8000-00000000000d', 'The 99 Smash',
  'An Oklahoma onion smash burger for R99, from midday every Thursday.',
  99, null, 'food'::special_category, '{}',
  array[4]::smallint[], '12:00', '22:00',
  null, '2026-09-30', 'Limited number each day — when they are gone, they are gone. Photographed on the table card.', false,
  'unknown'::holiday_status, 'https://burgerandlobster.co.za/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000029', 'a1000000-0000-4000-8000-00000000000e', 'Two pastas for R195',
  'Two pasta dishes for a set price on Tuesdays.',
  195, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, null, 'Terms and conditions apply. Photographed on the weekly specials card in the restaurant.', false,
  'unknown'::holiday_status, 'https://flirtcpt.co.za/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000002a', 'a1000000-0000-4000-8000-00000000000e', 'Two tacos for R180',
  'Two tacos for a set price on Wednesdays.',
  180, null, 'food'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, null, 'Terms and conditions apply. Photographed on the weekly specials card.', false,
  'unknown'::holiday_status, 'https://flirtcpt.co.za/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000002b', 'a1000000-0000-4000-8000-00000000000e', 'Half-price cocktails',
  'Every cocktail at half price on Thursdays.',
  null, null, 'drinks'::special_category, '{}',
  array[4]::smallint[], null, null,
  null, null, 'Terms and conditions apply. Photographed on the weekly specials card.', false,
  'unknown'::holiday_status, 'https://flirtcpt.co.za/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000002c', 'a1000000-0000-4000-8000-00000000000e', 'Two burgers for R195, with a DJ',
  'Two burgers for a set price on Saturdays, with a DJ playing.',
  195, null, 'food'::special_category, '{}',
  array[6]::smallint[], null, null,
  null, null, 'Terms and conditions apply. Photographed on the weekly specials card.', false,
  'unknown'::holiday_status, 'https://flirtcpt.co.za/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000002d', 'a1000000-0000-4000-8000-00000000000f', 'Happy hour',
  'Selected food and drinks from the menu at reduced prices, early evening, every day the bar is open.',
  null, null, 'happy_hour'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], '17:00', '19:00',
  null, null, 'Selected items only. The bar does not publish which items, or the reduced prices.', false,
  'unknown'::holiday_status, 'https://fablecocktailbar.capetown/', 'official_website'::source_type,
  '2026-07-25', '2026-08-22', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000002e', 'a1000000-0000-4000-8000-00000000000f', 'Women''s Wednesdays',
  'Half price on all classic cocktails for women, mid-evening on Wednesdays.',
  null, null, 'drinks'::special_category, '{}',
  array[3]::smallint[], '19:00', '22:00',
  null, '2026-08-31', 'The bar states this offer applies to women.', false,
  'unknown'::holiday_status, 'https://fablecocktailbar.capetown/', 'official_website'::source_type,
  '2026-07-25', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000002f', 'a1000000-0000-4000-8000-00000000000f', 'Fable Fix',
  'Any sandwich or pie from the daytime menu, with a daytime drink.',
  150, null, 'lunch'::special_category, '{}',
  array[5, 6]::smallint[], '12:00', '16:00',
  null, null, 'Advertised for 12pm to 4pm. The bar opens at noon on Friday and Saturday only, so those are the days it can run — and a write-up of 27 July describes it as the weekend lunch special, which settles it.', false,
  'unknown'::holiday_status, 'https://fablecocktailbar.capetown/', 'official_website'::source_type,
  '2026-07-25', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000030', 'a1000000-0000-4000-8000-00000000000f', 'Winter Warmer',
  'Creamy roasted tomato soup with a four-cheese toastie.',
  120, null, 'lunch'::special_category, '{}',
  array[5, 6]::smallint[], '12:00', '16:00',
  null, null, 'Advertised for 12pm to 4pm; the bar opens at noon on Friday and Saturday only. No end date is published - being a winter dish, confirm before relying on it in spring.', false,
  'unknown'::holiday_status, 'https://fablecocktailbar.capetown/', 'official_website'::source_type,
  '2026-07-25', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000031', 'a1000000-0000-4000-8000-000000000010', 'Four-course winter menu',
  'Four courses from the winter menu at the Mount Nelson.',
  750, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R750 per person. Served at dinner every day, and at lunch Friday to Sunday. Dineplan lists it as running through August and September; no exact end date is published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000032', 'a1000000-0000-4000-8000-000000000011', 'Three-course winter menu',
  'Three courses from the winter menu at the Pepperclub.',
  445, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'R445 per person, from midday daily. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000033', 'a1000000-0000-4000-8000-000000000012', 'Five-course lunch tasting menu',
  'A five-course tasting menu at lunch.',
  1275, null, 'lunch'::special_category, '{}',
  array[2, 3, 4, 5, 6]::smallint[], null, null,
  null, null, 'R1275 per person, from midday. Advertised as a winter menu with no end date published. Booking strongly advised.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000034', 'a1000000-0000-4000-8000-000000000013', 'Sharing winter menu',
  'A Baja Californian sharing menu built for the table.',
  349, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'R349 per person, all day. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000035', 'a1000000-0000-4000-8000-000000000014', '200g flat iron steak with salad',
  'A 200g flat iron steak served with a salad.',
  265, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'R265 per person. Advertised as a winter offer with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000036', 'a1000000-0000-4000-8000-000000000015', 'Three-course menu with a Port',
  'Three courses, with a complimentary glass of Port. The menu changes destination each month.',
  595, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'R595 per person, from midday daily. Dineplan lists this as running through August.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000037', 'a1000000-0000-4000-8000-000000000016', 'Winter bento box',
  'A bento box from the Japanese-Peruvian menu, served per person rather than to share.',
  349, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'R349 per person. Not a sharing menu. Advertised as a winter offer with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000038', 'a1000000-0000-4000-8000-000000000017', 'Five-course lunch or dinner',
  'Five courses, opening with a bread stack, with prawn toast among the signatures.',
  795, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R795 per person, from midday for lunch and from 6pm for dinner. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000039', 'a1000000-0000-4000-8000-000000000018', 'Three-course winter menu',
  'Three courses with a choice at each one.',
  495, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R495 per person, from midday daily. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000003a', 'a1000000-0000-4000-8000-000000000019', 'Sharing tasting menu',
  'A curated tasting menu meant for sharing.',
  349, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'R349 per person. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000003b', 'a1000000-0000-4000-8000-00000000001a', 'Two- or three-course winter menu',
  'Winter set menu running to oxtail ravioli and slow-roasted lamb shank.',
  450, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R450 for two courses, R550 for three. Lunch and dinner daily. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000003c', 'a1000000-0000-4000-8000-00000000001b', 'Date Night Under The Stars — three courses, R495',
  'Three courses served outdoors on the terrace, each paired with a drink. R395 if you would rather skip the pairing.',
  495, null, 'dinner'::special_category, '{}',
  array[4]::smallint[], '18:00', '21:00',
  null, '2026-12-31', 'R495 per person with the drinks pairing, R395 for the food alone. Bookings are essential and subject to availability — book through Dineplan and choose Islands Restaurant as the seating area, or phone the hotel. The menu changes with the season and the dinner moves indoors in bad weather. The hotel''s own post lists set Thursdays in each month from July to December 2026 rather than every Thursday, and its Dineplan page still shows a shorter window ending 27 August, so confirm the date you want when you book.', true,
  'unknown'::holiday_status, 'https://www.presidenthotel.co.za/blog/date-night-under-the-stars-at-the-president-hotel', 'official_website'::source_type,
  '2026-06-02', '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000c4', 'a1000000-0000-4000-8000-00000000001b', 'Sunday Harvest Lunch — R425',
  'A carvery-style Sunday lunch of seasonal dishes, with a reduced price for children.',
  425, null, 'lunch'::special_category, '{}',
  array[7]::smallint[], '13:00', '15:00',
  '2026-07-12', '2026-09-26', 'R425 an adult and R225 a child. Listed on the hotel’s booking page, last confirmed there on 12 July 2026.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/the-president-hotel', 'booking_page'::source_type,
  null, '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000c5', 'a1000000-0000-4000-8000-00000000001b', 'Heritage Day braai — R595',
  'A one-afternoon South African braai for Heritage Day, on Thursday 24 September.',
  595, null, 'lunch'::special_category, '{}',
  array[4]::smallint[], '13:00', '16:00',
  '2026-09-24', '2026-09-24', 'R595 an adult and R295 a child, for Thursday 24 September 2026 only. Confirmed on the hotel’s booking page on 24 August 2026.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/the-president-hotel', 'booking_page'::source_type,
  null, '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000003d', 'a1000000-0000-4000-8000-00000000001c', 'Two- or three-course lunch',
  'Winter lunch menu on the Camps Bay beachfront.',
  285, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R285 for two courses, R375 for three, from midday daily. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000003e', 'a1000000-0000-4000-8000-00000000001d', 'Weekday set menu',
  'Two or three courses, weekdays only.',
  295, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], null, null,
  null, null, 'R295 for two courses, R365 for three, Monday to Friday, all day. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000003f', 'a1000000-0000-4000-8000-00000000001e', 'Five-course lunch',
  'Five courses at the Round House, from cured game fish through to Karoo lamb.',
  1090, null, 'lunch'::special_category, '{}',
  array[2, 3, 4, 5, 6]::smallint[], null, null,
  null, null, 'R1090 per person, from 12:30. Advertised as a winter menu with no end date published. Booking strongly advised.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000040', 'a1000000-0000-4000-8000-00000000001f', 'Social Hour — half-price margaritas',
  'Half price on margaritas and on the small plates menu, early evening.',
  null, null, 'happy_hour'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], '17:00', '19:00',
  null, null, 'Confirmed twice: the bar''s own site, and an Instagram post on 22 August 2026. One caption also says ''the best two hours of your day start at 4pm'', but every explicit statement of the times says 5pm to 7pm.', false,
  'unknown'::holiday_status, 'https://www.ritascocktailclub.com/', 'official_website'::source_type,
  '2026-08-22', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000041', 'a1000000-0000-4000-8000-000000000020', 'Winter lunch menu',
  'A two- or three-course winter lunch, served through the afternoon.',
  250, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6]::smallint[], '12:00', '16:00',
  null, null, 'R250 for two courses, R295 for three. Monday to Saturday. Advertised as a winter menu with no end date published, so confirm before relying on it in spring.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/Db0k4EDoNxL/', 'social'::source_type,
  '2026-08-09', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000042', 'a1000000-0000-4000-8000-000000000021', 'Happy hour',
  'Happy-hour prices at the bar, Wednesday through Saturday evening.',
  null, null, 'happy_hour'::special_category, '{}',
  array[3, 4, 5, 6]::smallint[], '18:00', '20:00',
  null, null, 'Advertised as 6pm to 8pm Wednesday to Saturday. One Friday post extended it to 10pm, so Friday may run longer.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcJaxFcimTs/', 'social'::source_type,
  '2026-08-17', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000043', 'a1000000-0000-4000-8000-000000000021', 'Free frozen cocktail with any pizza',
  'Order any pizza on a Wednesday and the frozen cocktail is on the house.',
  null, null, 'food'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, null, 'Posted on three separate Wednesdays in August 2026, which is what makes it a weekly offer rather than a one-off.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcJaxFcimTs/', 'social'::source_type,
  '2026-08-19', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000044', 'a1000000-0000-4000-8000-000000000021', 'Half-price baskets on Thursdays',
  'Fifty percent off the basket menu, all night.',
  null, null, 'food'::special_category, '{}',
  array[4]::smallint[], null, null,
  null, null, 'Posted on three separate Thursdays in August 2026.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcLq5j0Diwf/', 'social'::source_type,
  '2026-08-20', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000045', 'a1000000-0000-4000-8000-000000000021', 'Free jug or bubbly with a party platter',
  'Order any party platter on a Friday and get a frozen jug or a bottle of bubbly free.',
  null, null, 'food'::special_category, '{}',
  array[5]::smallint[], null, null,
  null, null, 'Posted on three separate Fridays in August 2026.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcTZWoFCKyH/', 'social'::source_type,
  '2026-08-21', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000046', 'a1000000-0000-4000-8000-000000000022', 'R99 beer jugs',
  'Jugs of Jack Black draught for R99, late afternoon, every day of the week.',
  99, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '16:00', '18:00',
  null, null, 'Advertised as Monday to Sunday, with no end date published.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DbaxDfIjUc2/', 'social'::source_type,
  '2026-07-30', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000047', 'a1000000-0000-4000-8000-000000000023', 'Winter set menu',
  'A chef''s selection set menu for the winter.',
  null, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'restaurants.co.za lists this as running until 30 September 2026 but publishes no price. Confirm the price with the restaurant.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000048', 'a1000000-0000-4000-8000-000000000019', 'NOMIKAI late-night happy hour',
  'Half price on selected Japanese cocktails, sake carafes, beers and wines, from ten at night.',
  null, null, 'happy_hour'::special_category, '{}',
  array[5, 6]::smallint[], '22:00', '00:00',
  null, '2026-10-31', 'Not valid on First Thursdays. No banking or sharing of the discount. Runs from 10pm to midnight, so it carries past the end of the day it starts on.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000049', 'a1000000-0000-4000-8000-000000000019', 'Ramen Rush Monday',
  'A medium ramen bowl for R119 on Mondays.',
  119, null, 'food'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, '2026-10-01', 'Excludes the truffle, shoyu and wagyu ramen.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000004a', 'a1000000-0000-4000-8000-000000000013', 'Half-price margaritas',
  'Margaritas at half price, late afternoon, every day.',
  null, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '16:00', '17:30',
  null, '2026-09-30', 'Excludes First Thursdays.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000004b', 'a1000000-0000-4000-8000-000000000013', 'Taco Loco Wednesdays',
  'Every taco on the menu for R119, all day Wednesday.',
  119, null, 'food'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, '2026-09-30', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000004c', 'a1000000-0000-4000-8000-000000000016', 'Pisco Hour',
  'Half price on pisco cocktails, late afternoon.',
  null, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6]::smallint[], '16:00', '17:30',
  null, '2026-09-30', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000004d', 'a1000000-0000-4000-8000-000000000016', 'Sushi and Sake Sundays',
  'A 22-piece sushi platter for R199, with half-price sake cocktails and a live DJ.',
  199, null, 'food'::special_category, '{}',
  array[7]::smallint[], '12:00', '17:30',
  null, '2026-09-30', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000004e', 'a1000000-0000-4000-8000-000000000014', 'Half-price social hour',
  'Half price on drinks, with bar bites at R79.',
  79, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '16:00', '17:30',
  null, '2026-09-30', 'R79 is the bar-bites price; the drinks are half of menu price.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000004f', 'a1000000-0000-4000-8000-000000000014', 'Karoo set menus',
  'Two Karoo set menus at dinner.',
  479, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'R479 per person for the second menu, R569 for the first.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000050', 'a1000000-0000-4000-8000-000000000023', 'Aperitivo Hour',
  'Half price on selected drinks, with cicchetti at R79.',
  79, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '16:00', '17:30',
  null, '2026-10-31', 'R79 is the cicchetti price; the drinks are half of menu price.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000051', 'a1000000-0000-4000-8000-000000000023', 'Pranzo Club',
  'Classic pastas for R119 over lunch on weekdays.',
  119, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], '12:00', '16:00',
  null, '2026-09-25', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000052', 'a1000000-0000-4000-8000-00000000000d', 'Half-price social hour',
  'Fifty percent off selected wine, beer, bubbly and cocktails, with bar bites at R89.',
  89, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '16:00', '17:30',
  null, '2026-11-30', 'R89 is the bar-bites price; the drinks are half of menu price.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000053', 'a1000000-0000-4000-8000-000000000001', 'Steak Night',
  'A complimentary 250ml wine carafe and pepper sauce with any steak, on Tuesdays.',
  null, null, 'dinner'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, '2026-08-31', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000054', 'a1000000-0000-4000-8000-000000000011', 'Dinner and a movie',
  'Pasta or pizza, a glass of wine, and a private cinema screening.',
  350, null, 'dinner'::special_category, '{}',
  array[4, 5, 6]::smallint[], '18:00', '19:30',
  null, '2026-08-31', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000055', 'a1000000-0000-4000-8000-000000000015', 'Indian-Cape afternoon tea',
  'Afternoon tea on Sundays, with the option of adding a glass of MCC.',
  345, null, 'food'::special_category, '{}',
  array[7]::smallint[], null, null,
  null, '2026-08-31', 'R345 per person, or R395 with a glass of MCC.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000056', 'a1000000-0000-4000-8000-000000000024', 'Happy hour',
  'Three hours of drinks specials every afternoon — the restaurant calls it Social Hour.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '15:00', '18:00',
  null, '2027-02-28', 'The restaurant''s own site calls it Social Hour and gives 3pm to 6pm daily. A third-party listing had it as 4pm to 5pm; the restaurant wins. It also runs at the Harrington Street and Sea Point branches.', false,
  'unknown'::holiday_status, 'https://mamacitas.co.za', 'official_website'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000057', 'a1000000-0000-4000-8000-000000000024', 'Burger Monday',
  'Buy a burger and the draught or margarita is on the house.',
  null, null, 'food'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, '2026-08-31', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000058', 'a1000000-0000-4000-8000-000000000024', 'Taco Tuesday',
  'Tacos at R50 to R60 each, mix and match, all day and night.',
  50, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, '2026-08-25', 'R50 to R60 depending on the taco.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000059', 'a1000000-0000-4000-8000-000000000024', 'Wednesday ribs',
  'Free upgrade to the 600g rack on Wednesdays.',
  null, null, 'food'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, '2026-08-27', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000005a', 'a1000000-0000-4000-8000-000000000024', 'Kids eat free on Sundays',
  'One free kids meal for every paying adult.',
  null, null, 'food'::special_category, '{}',
  array[7]::smallint[], null, null,
  null, '2026-09-27', 'Dine-in only. One free kids meal per paying adult, for children twelve and under.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000005b', 'a1000000-0000-4000-8000-000000000025', 'Two Aperol Spritz for R215',
  'Women''s Month offer: two Aperol Spritz on the harbour deck for R215.',
  215, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'Runs during normal trading hours, 11am to 11pm.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/quay-four', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000005c', 'a1000000-0000-4000-8000-000000000025', 'Meal and a tank beer from R159',
  'Burger and a tank beer R159; fish and chips or spatchcock chicken with a beer R199; 200g sirloin with a beer R219.',
  159, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'R159 is the cheapest of the four combos. No day or time restriction is published.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/quay-four', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000005d', 'a1000000-0000-4000-8000-000000000025', 'Six oysters and bubbly for R179',
  'Half a dozen oysters with a glass of sparkling wine for R179.',
  179, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/quay-four', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000005e', 'a1000000-0000-4000-8000-000000000025', 'R179 mains',
  'Fish and chips, calamari, 200g sirloin or spatchcock chicken, each R179.',
  179, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/quay-four', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000005f', 'a1000000-0000-4000-8000-000000000025', 'Prawns, half kilo R245',
  'Half a kilo of prawns for R245, or a full kilo for R395.',
  245, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/quay-four', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000060', 'a1000000-0000-4000-8000-000000000025', 'Pensioners get 20% off',
  'Twenty per cent off the whole bill for pensioners.',
  null, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'Valid ID required. Excludes public holidays and the December and January peak season.', false,
  'not_valid'::holiday_status, 'https://www.restaurants.co.za/quay-four', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000061', 'a1000000-0000-4000-8000-000000000026', 'Two Aperol Spritz for R215',
  'Women''s Month offer upstairs: two Aperol Spritz for R215, with the harbour in front of you.',
  215, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/upper-quay', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000062', 'a1000000-0000-4000-8000-000000000026', 'R59 breakfast',
  'Two eggs, two rashers of bacon, grilled tomato and toast for R59.',
  59, null, 'breakfast'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'Kitchen opens at 8am.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/upper-quay', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000063', 'a1000000-0000-4000-8000-000000000026', 'Bayside platter for R249',
  'Grilled catch of the day, Patagonian baby calamari, mussels and three prawns in lemon butter, R249.',
  249, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/upper-quay', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000064', 'a1000000-0000-4000-8000-000000000026', 'Date Night Tuesdays',
  'Two-course winter menu R425 a head, three courses R499, each with a glass of Durbanville Hills sauvignon blanc or merlot.',
  425, null, 'dinner'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, '2026-08-24', null, true,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/upper-quay', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000065', 'a1000000-0000-4000-8000-000000000027', 'Six oysters and bubbly for R179',
  'Half a dozen oysters with a glass of Durbanville Hills sparkling sauvignon blanc or rosé, R179.',
  179, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-10-31', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/mitchells-scottish-ale-house', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000066', 'a1000000-0000-4000-8000-000000000027', 'Burger or pizza with a draught from R179',
  'Saucy burger with a draught R179; any burger or pizza with a house lager R199.',
  179, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/mitchells-scottish-ale-house', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000067', 'a1000000-0000-4000-8000-000000000028', 'A meal and a Guinness from R169',
  'Beef or chicken burger with a Guinness R169; chicken wings and chips, shepherd''s pie, or a 200g sirloin and chips with a Guinness R199.',
  169, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/ferrymans-irish-tavern', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000068', 'a1000000-0000-4000-8000-000000000028', 'Six oysters and bubbly for R179',
  'Half a dozen oysters with a glass of Durbanville Hills sparkling sauvignon blanc or rosé, R179.',
  179, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/ferrymans-irish-tavern', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000069', 'a1000000-0000-4000-8000-000000000028', 'R169 specials',
  'A mussel pot, the Keem Bay or Dingle Bay seafood platter, or the Irish trilogy — each R169.',
  169, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/ferrymans-irish-tavern', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000006a', 'a1000000-0000-4000-8000-000000000028', 'Pensioners get 20% off',
  'Twenty per cent off the whole bill for pensioners.',
  null, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-10-31', 'Valid ID required. Excludes public holidays and the December and January peak season.', false,
  'not_valid'::holiday_status, 'https://www.restaurants.co.za/ferrymans-irish-tavern', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000006b', 'a1000000-0000-4000-8000-000000000029', '40% off cocktails and house wine',
  'Forty per cent off cocktails, house wines and the Harrys pouring spirits, early evening on the Harrington Street lounge.',
  null, null, 'happy_hour'::special_category, '{}',
  array[3, 4, 6]::smallint[], '17:00', '19:00',
  null, null, 'A write-up of 4 August put this at 4–6pm Wednesday to Saturday. The lounge''s own post of 15 August says 5–7pm on Wednesday, Thursday and Saturday, and from 4pm on Friday, so that is what is shown. No end date is published.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/reel/DcEQ2zYoYxV/', 'social'::source_type,
  '2026-08-15', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000006c', 'a1000000-0000-4000-8000-00000000002a', 'Two Heinekens for the price of one',
  'Buy one Heineken on tap on the Greenmarket Square terrace and the second is free.',
  null, null, 'happy_hour'::special_category, '{}',
  array[5]::smallint[], '16:00', '19:00',
  null, null, 'Two write-ups give the window as 4–7pm and 4–6pm respectively. The later one is used here; confirm on arrival.', false,
  'unknown'::holiday_status, 'https://www.food-blog.co.za/ease-into-the-weekend-with-buy-one-get-one-free-heineken-at-onomo-inn-on-the-square/', 'publication'::source_type,
  '2026-07-16', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000006d', 'a1000000-0000-4000-8000-000000000022', 'Happy hour',
  'An hour of reduced drinks prices at the bar before dinner service, alongside the bar snacks menu.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '17:00', '18:00',
  null, null, 'Clarke''s own post gives the hour but not the prices. A third-party list quotes R35 cocktails; that price is unconfirmed and is not shown here.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DMg9DYnodqB/', 'social'::source_type,
  '2026-07-02', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000006e', 'a1000000-0000-4000-8000-00000000002b', 'R60 happy hour',
  'Sixty rand a drink for an hour: house spirits and mixer, tequila, piña coladas, margaritas and hurricanes.',
  60, null, 'happy_hour'::special_category, '{}',
  array[3, 4, 5, 6]::smallint[], '17:00', '18:00',
  null, null, 'The bar''s own post of 14 August gives the hour as 5–6pm. A May write-up said 3–6pm, Wednesday to Saturday; the days here come from that write-up, the times from the bar.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcBPAR-gCOj/', 'social'::source_type,
  '2026-08-14', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000006f', 'a1000000-0000-4000-8000-00000000002b', 'R60 margaritas on karaoke night',
  'Tiki-Oke karaoke from 9pm, R60 margaritas, and a free shot if you take the microphone.',
  60, null, 'drinks'::special_category, '{}',
  array[3]::smallint[], '21:00', '00:00',
  null, null, 'The weekly listing shows both R60 and R100 margaritas without saying which is which — R60 is the lower of the two.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/Db2sdYKARlI/', 'social'::source_type,
  '2026-08-10', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000070', 'a1000000-0000-4000-8000-00000000002c', 'Tasting Tuesdays — wine tasting on the house',
  'A guided tasting of small-producer South African wine, free to walk-ins, with bottles available to take home afterwards.',
  0, null, 'drinks'::special_category, '{}',
  array[2]::smallint[], '18:30', '20:30',
  null, '2027-02-23', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/judds-local', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000071', 'a1000000-0000-4000-8000-000000000001', 'A glass of Cap Classique for women on Sundays',
  'Women''s Month: every woman at the table gets a complimentary glass of Pongrácz cap classique with Sunday lunch or dinner.',
  null, null, 'drinks'::special_category, '{}',
  array[7]::smallint[], null, null,
  null, '2026-08-31', 'Tables should be booked. Runs to the end of August 2026.', true,
  'unknown'::holiday_status, 'https://www.food-blog.co.za/celebrate-womens-month-at-ricks-cafe-americain-in-cape-town-with-r175-aperol-spritz-specials/', 'publication'::source_type,
  '2026-08-05', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000072', 'a1000000-0000-4000-8000-000000000029', 'Wine & Dine Wednesdays',
  'An arrival cocktail, a guided tasting of four A.A. Badenhorst wines and three courses, R375 a head.',
  375, null, 'dinner'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, null, 'Book ahead. Arrival cocktail is an elderflower spritz or a negroni; mains include a linguini, a line fish and a ribeye.', true,
  'unknown'::holiday_status, 'https://www.food-blog.co.za/turn-wednesday-into-date-night-with-three-courses-and-four-a-a-badenhorst-wines-at-harringtons-cocktail-lounge/', 'publication'::source_type,
  '2026-08-07', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000073', 'a1000000-0000-4000-8000-000000000028', 'Two Aperol Spritz for R215',
  'The same Women''s Month spritz offer as the neighbouring Pierhead bars.',
  215, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', null, false,
  'unknown'::holiday_status, 'https://www.food-blog.co.za/cape-town-specials/', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000074', 'a1000000-0000-4000-8000-00000000002f', 'A free Aperol Spritz with any pizza',
  'Order any pizza on a Friday and the Aperol Spritz is on the house.',
  null, null, 'drinks'::special_category, '{}',
  array[5]::smallint[], '12:00', '22:00',
  null, '2026-08-31', 'Runs every Friday to the last Friday of August 2026.', false,
  'unknown'::holiday_status, 'https://www.food-blog.co.za/find-your-friday-pizza-and-aperol-spritz-pairing-at-filini-with-a-complimentary-cocktail-until-the-last-friday-of-august/', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000075', 'a1000000-0000-4000-8000-00000000002e', 'Two burgers for R255',
  'Any two of the five burgers on the menu for R255.',
  255, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'The write-up does not say whether chips are included.', false,
  'unknown'::holiday_status, 'https://www.food-blog.co.za/get-two-burgers-for-r255-every-day-at-london-road-bistro-in-sea-point/', 'publication'::source_type,
  '2026-08-19', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000076', 'a1000000-0000-4000-8000-00000000002d', 'Two mussel pots for R500',
  'Two of the signature Belgian mussel pots with frites and mayonnaise, R500 for the pair.',
  500, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, null, null, false,
  'unknown'::holiday_status, 'https://www.food-blog.co.za/special-for-two-celebrate-the-return-of-mussel-pots-at-den-anker-with-a-belgian-feast/', 'publication'::source_type,
  '2026-07-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000077', 'a1000000-0000-4000-8000-000000000029', 'Fiesta Friday — R50 frozen margaritas',
  'Frozen margaritas at R50 for two hours from four, ahead of the Friday night tequila service.',
  50, null, 'happy_hour'::special_category, '{}',
  array[5]::smallint[], '16:00', '18:00',
  null, null, null, false,
  'unknown'::holiday_status, 'https://www.instagram.com/reel/Db-_fH8udpZ/', 'social'::source_type,
  '2026-08-13', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000078', 'a1000000-0000-4000-8000-000000000029', 'Fiesta Friday dinner — R330',
  'A two-course dinner with two tequila cocktails, R330 a head, with a piñata dropping tequila shots at eleven.',
  330, null, 'dinner'::special_category, '{}',
  array[5]::smallint[], null, null,
  null, null, null, true,
  'unknown'::holiday_status, 'https://www.instagram.com/reel/Db-_fH8udpZ/', 'social'::source_type,
  '2026-08-13', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000079', 'a1000000-0000-4000-8000-000000000030', 'R59 burger and chips — one day only',
  'A Tiger''s Milk burger with chips for R59, on Sunday 30 August only.',
  59, null, 'food'::special_category, '{}',
  array[7]::smallint[], null, null,
  '2026-08-30', '2026-08-30', 'Announced by Tiger''s Milk for the 30th of August without naming branches. Worth a call to this one before you go.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcS8ApcjOSd/', 'social'::source_type,
  '2026-08-21', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000007a', 'a1000000-0000-4000-8000-000000000031', 'R59 burger and chips — one day only',
  'A Tiger''s Milk burger with chips for R59, on Sunday 30 August only.',
  59, null, 'food'::special_category, '{}',
  array[7]::smallint[], null, null,
  '2026-08-30', '2026-08-30', 'Announced by Tiger''s Milk for the 30th of August without naming branches. Worth a call to this one before you go.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcS8ApcjOSd/', 'social'::source_type,
  '2026-08-21', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000007b', 'a1000000-0000-4000-8000-000000000032', 'Prego Wednesdays — R200 with a spritz',
  'Karan beef fillet prego with the house peri-peri, triple-fried chips and a Duchess Spritz, R200 all in.',
  200, null, 'dinner'::special_category, '{}',
  array[3]::smallint[], '18:30', '22:30',
  null, null, 'The kitchen only opens at 6:30pm on a Wednesday. A booking deposit applies to reservations.', true,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcIv3kYDgy3/', 'social'::source_type,
  '2026-08-17', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000007c', 'a1000000-0000-4000-8000-00000000002f', 'Happy hour at the bar',
  'An hour of happy-hour drinks prices in the hotel bar, every day between lunch and dinner service.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '17:00', '18:00',
  null, '2026-08-31', 'The venue publishes the hour and the end date but not the prices. Worth asking what is on the happy-hour list before you order.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/filini-restaurant', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000007d', 'a1000000-0000-4000-8000-000000000033', 'Sushi, dim sum and cocktail specials',
  'The long-running afternoon specials board on sushi, dim sum and cocktails, on weekdays from four.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], '16:00', '18:00',
  null, '2026-10-31', 'The venue publishes the window and the end date but not the prices.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/beluga-restaurant', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000007e', 'a1000000-0000-4000-8000-000000000033', 'Weekend sushi, dim sum and cocktail specials',
  'The same specials board, running from midday on Saturday and Sunday.',
  null, null, 'happy_hour'::special_category, '{}',
  array[6, 7]::smallint[], '12:00', '18:00',
  null, '2026-10-31', 'The venue publishes the window and the end date but not the prices.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/beluga-restaurant', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000007f', 'a1000000-0000-4000-8000-000000000034', 'A free drink with any Sunday pizza',
  'Order any pizza on a Sunday and a glass of wine or a draught beer comes with it.',
  null, null, 'drinks'::special_category, '{}',
  array[7]::smallint[], null, null,
  null, null, 'The kitchen is open from 8am and the bar runs late; the write-up does not narrow the offer to a window inside that.', false,
  'unknown'::holiday_status, 'https://www.capetownmagazine.com/new', 'publication'::source_type,
  '2026-07-29', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000080', 'a1000000-0000-4000-8000-000000000035', 'Winter Warmers — two courses R475',
  'Two courses for R475 a head on the eleventh floor, or three for R660.',
  475, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', null, true,
  'unknown'::holiday_status, 'https://www.capetownmagazine.com/winter-specials', 'publication'::source_type,
  '2026-08-14', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000081', 'a1000000-0000-4000-8000-000000000035', 'Sharing menu for two, with a bottle of wine',
  'A sharing menu for two at R1,100 a couple, with a bottle of wine included.',
  1100, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'R1,100 is the price for two people, not per head.', true,
  'unknown'::holiday_status, 'https://www.capetownmagazine.com/winter-specials', 'publication'::source_type,
  '2026-08-14', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000082', 'a1000000-0000-4000-8000-000000000036', 'Three-course winter menu — R595',
  'Wagyu biltong soup, fire-grilled springbok loin and an Asian-leaning dessert, R595 a head.',
  595, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  '2026-05-19', '2026-08-28', null, true,
  'unknown'::holiday_status, 'https://www.capetownmagazine.com/winter-specials', 'publication'::source_type,
  '2026-08-14', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000083', 'a1000000-0000-4000-8000-000000000037', 'Eggs benedict and a cappuccino for R119',
  'Eggs benedict with a cappuccino made from the house Isabella blend, R119, any day of the week.',
  119, null, 'breakfast'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '06:45', '15:00',
  null, null, null, false,
  'unknown'::holiday_status, 'https://www.capetownmagazine.com/winter-specials', 'publication'::source_type,
  '2026-08-14', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000084', 'a1000000-0000-4000-8000-000000000033', 'Soup of the day for R90',
  'A different soup each day — butternut, chicken and corn chowder, potato and spinach, tomato and vegetable — with a toasted Portuguese roll.',
  90, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], '11:00', '15:00',
  null, '2026-08-31', 'The venue''s own listing gives weekdays, 11am to 3pm; a write-up of 31 July calls it daily. The narrower reading is used here.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/beluga-restaurant', 'publication'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000085', 'a1000000-0000-4000-8000-000000000038', 'All-you-can-eat sushi for R299',
  'Ninety minutes of all-you-can-eat sushi from the selected menu, R299 a head, every day of the week.',
  299, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '12:00', '21:00',
  null, null, 'Ninety-minute sitting. No sharing and no takeaways, and R9 a piece for anything left uneaten. Not available on Valentine''s Day.', false,
  'unknown'::holiday_status, 'https://www.aikosushi.co.za/aiko-on-bree', 'official_website'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000086', 'a1000000-0000-4000-8000-000000000038', 'Vegan all-you-can-eat sushi for R249',
  'The same ninety-minute deal from an entirely vegan menu, R249 a head, Sunday through Wednesday.',
  249, null, 'food'::special_category, array['vegan', 'vegetarian']::dietary_tag[],
  array[7, 1, 2, 3]::smallint[], '12:00', '21:00',
  null, null, 'Ninety-minute sitting. No sharing and no takeaways, and R9 a piece for anything left uneaten.', false,
  'unknown'::holiday_status, 'https://www.aikosushi.co.za/aiko-on-bree', 'official_website'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000087', 'a1000000-0000-4000-8000-000000000039', 'Buy one burger, get one free',
  'Order a burger on a Monday and the second one is free, all day.',
  null, null, 'food'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, null, 'The venue''s own site advertises a Monday burger special; the price comes from a round-up updated 12 August.', false,
  'unknown'::holiday_status, 'https://thecapetownblog.com/monday-specials/', 'publication'::source_type,
  '2026-08-12', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000088', 'a1000000-0000-4000-8000-000000000039', 'R20 shots on Thursdays',
  'Twenty rand a shot, all Thursday evening.',
  20, null, 'drinks'::special_category, '{}',
  array[4]::smallint[], null, null,
  null, null, 'The bar publishes the offer but not the window; it trades until 11pm.', false,
  'unknown'::holiday_status, 'https://cafemanhattan.co.za', 'official_website'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000089', 'a1000000-0000-4000-8000-00000000003a', 'R50 margaritas on Mondays',
  'Fifty rand a margarita, all Monday, alongside the Mexican food deal.',
  50, null, 'drinks'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, null, null, false,
  'unknown'::holiday_status, 'https://thecapetownblog.com/monday-specials/', 'publication'::source_type,
  '2026-08-12', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000008a', 'a1000000-0000-4000-8000-00000000003a', 'Monday Mexican — tacos R99, platter R225',
  'Tacos for R99, or the Mexican sharing platter for R225.',
  99, null, 'food'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, null, null, false,
  'unknown'::holiday_status, 'https://thecapetownblog.com/monday-specials/', 'publication'::source_type,
  '2026-08-12', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000008b', 'a1000000-0000-4000-8000-00000000003b', 'Three-course Monday dinner — R295',
  'Three courses of Asian-leaning tapas for R295, with dessert available for R120 more.',
  295, null, 'dinner'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, null, 'The kitchen opens at 6pm. Book by phone or email — the venue does not take Dineplan reservations.', true,
  'unknown'::holiday_status, 'https://thecapetownblog.com/monday-specials/', 'publication'::source_type,
  '2026-08-12', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000008c', 'a1000000-0000-4000-8000-000000000015', 'Butter chicken with a drink on the house — R250',
  'Butter chicken and naan with a complimentary beer or glass of wine, R250, Mondays.',
  250, null, 'dinner'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, null, null, false,
  'unknown'::holiday_status, 'https://thecapetownblog.com/monday-specials/', 'publication'::source_type,
  '2026-08-12', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000008d', 'a1000000-0000-4000-8000-00000000003c', 'Happy hour, every day',
  'Two hours of reduced prices on drinks and cocktails, every afternoon of the year.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '16:30', '18:30',
  null, null, 'The restaurant publishes the hours on its own site but not the prices. A 2021 write-up put cocktails at R49; that figure is five years old and is not shown here.', false,
  'unknown'::holiday_status, 'https://www.arnolds.co.za/', 'official_website'::source_type,
  '2026-08-23', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000008e', 'a1000000-0000-4000-8000-00000000003d', 'Taco Tuesday — two for R76',
  'Any two tacos for R76, all day. A third is R38 more.',
  76, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, null, 'All day, every Tuesday. Any two tacos on the menu.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcIqqb0DM-2/', 'social'::source_type,
  '2026-08-17', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000008f', 'a1000000-0000-4000-8000-00000000003e', 'R90 margaritas at lunchtime',
  'Margaritas, shaken or frozen, R90 through the middle of the day.',
  90, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], '12:00', '17:00',
  null, null, null, false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/Dbph_2-CGiX/', 'social'::source_type,
  '2026-08-05', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000090', 'a1000000-0000-4000-8000-00000000003f', 'Pass the Plates — five small plates for R550',
  'Five small plates to share, R550 a head, from midday on the ninth floor.',
  550, null, 'food'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, null, 'From midday every Wednesday; the venue does not publish an end time. Worth booking — it is a small room.', true,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcMEtYjiCfA/', 'social'::source_type,
  '2026-08-18', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000091', 'a1000000-0000-4000-8000-000000000040', 'Meat-free Monday',
  'Plant-based burgers are half price all day on Mondays.',
  null, null, 'food'::special_category, array['vegetarian', 'vegan']::dietary_tag[],
  array[1]::smallint[], null, null,
  null, null, 'Dine-in only.', false,
  'unknown'::holiday_status, 'https://www.theburgerjoint.co.za/specials', 'official_website'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000092', 'a1000000-0000-4000-8000-000000000040', 'Two-for-one pizzas — Pizza Two''sday',
  'Buy one pizza and a second comes free, all day Tuesday.',
  null, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, null, 'Dine-in only.', false,
  'unknown'::holiday_status, 'https://www.theburgerjoint.co.za/specials', 'official_website'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000093', 'a1000000-0000-4000-8000-000000000040', 'Happy hour — 30% off',
  'Thirty percent off cocktails, draught beer, starters and selected wines by the glass on weekday evenings.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], '16:30', '18:30',
  null, null, 'Dine-in only.', false,
  'unknown'::holiday_status, 'https://www.theburgerjoint.co.za/specials', 'official_website'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000094', 'a1000000-0000-4000-8000-000000000040', 'Linger Longer — 40% off cocktails',
  'Forty percent off the speciality cocktail list late in the evening, every night.',
  null, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '21:00', '23:00',
  null, null, 'Dine-in only. The branch booking page gives the window as 9.30-11.30pm; the official specials page says 9-11pm. Check on arrival.', false,
  'unknown'::holiday_status, 'https://www.theburgerjoint.co.za/specials', 'official_website'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000095', 'a1000000-0000-4000-8000-000000000041', 'Winter Indulgence — four courses for R399',
  'A four-course winter menu with the house band playing, Monday to Thursday from midday.',
  399, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4]::smallint[], '12:00', '21:30',
  null, '2026-08-31', 'Per person. The booking page prints the run as 16 Jul - 31 Aug without a year; read as 2026 because the offer is live now. Worth confirming by phone before travelling.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/pigalle-cape-town', 'booking_page'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000096', 'a1000000-0000-4000-8000-000000000041', 'Weekday lunch set menu',
  'A shorter set lunch aimed at one or two people rather than a party, weekdays until 4pm.',
  null, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], '12:00', '16:00',
  null, '2026-09-30', 'For groups under ten. No price is published — ask when booking. The run is printed as 16 Feb - 30 Sep without a year.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/pigalle-cape-town', 'booking_page'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000097', 'a1000000-0000-4000-8000-000000000042', 'Free Meat Monday',
  'Order the CEO platter on a Monday and a second one comes free.',
  null, null, 'food'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, null, 'No price is published for the offer; the platter is priced on the menu.', false,
  'unknown'::holiday_status, 'https://www.theofficecpt.com/', 'official_website'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000098', 'a1000000-0000-4000-8000-000000000042', 'Two burgers for R160',
  'Two burgers on a Tuesday for one price — beef or teriyaki chicken.',
  160, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, null, null, false,
  'unknown'::holiday_status, 'https://www.theofficecpt.com/', 'official_website'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000099', 'a1000000-0000-4000-8000-000000000042', 'Date night — free bottle of wine with two sirloins',
  'Order two grilled sirloins on a Wednesday evening and a bottle of Cult wine is included.',
  null, null, 'dinner'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, null, 'Evenings only; the venue does not publish a start time. Kitchen trades to midnight Monday to Saturday.', false,
  'unknown'::holiday_status, 'https://www.theofficecpt.com/', 'official_website'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000009a', 'a1000000-0000-4000-8000-000000000043', 'Margarita Social — R300',
  'Friday evening in the lobby bar with DJs and a margarita list built on Don Julio and Casamigos.',
  300, null, 'drinks'::special_category, '{}',
  array[5]::smallint[], '18:00', '22:00',
  null, null, 'Per person. The venue does not say whether the price is a ticket, a free pour or a minimum spend — ask when booking.', true,
  'unknown'::holiday_status, 'https://www.kovecollection.co.za/script/', 'official_website'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000009b', 'a1000000-0000-4000-8000-000000000043', 'After Dark — R300',
  'Saturday live jazz in the Jazz Room with Laurent-Perrier and Whispering Angel poured through the evening.',
  300, null, 'drinks'::special_category, '{}',
  array[6]::smallint[], '18:00', '21:00',
  null, null, 'Per person. Listed as running Saturdays from 20 June; the venue prints no year and no end date.', true,
  'unknown'::holiday_status, 'https://www.kovecollection.co.za/script/', 'official_website'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000009c', 'a1000000-0000-4000-8000-000000000044', 'Date night — three courses for two, R785',
  'A three-course set dinner for two on Wednesday evenings.',
  785, null, 'dinner'::special_category, '{}',
  array[3]::smallint[], '18:00', '21:00',
  null, '2026-08-31', 'Per couple, food only. Tables of two to twelve.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/ariel-modern-italian', 'booking_page'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000009d', 'a1000000-0000-4000-8000-000000000045', 'Date night — Greek sharing menu for two, R795',
  'A set sharing menu for two on Tuesday evenings.',
  795, null, 'dinner'::special_category, '{}',
  array[2]::smallint[], '18:00', '20:30',
  null, '2026-09-30', 'Per couple. Tables of two to twelve. The booking page prints the run as 5 Jun - 30 Sep without a year.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/kiki', 'booking_page'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000009e', 'a1000000-0000-4000-8000-000000000045', 'Dinner with Strangers — R420',
  'One communal table, one sitting, whoever books. Thursday nights for solo diners and pairs.',
  420, null, 'dinner'::special_category, '{}',
  array[4]::smallint[], null, null,
  null, null, 'Per person, one sitting at 7pm. Bookings of one or two. The run is printed as 2 Jul - 24 Sep without a year.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/kiki', 'booking_page'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000009f', 'a1000000-0000-4000-8000-000000000045', 'Souvla Sunday lunch — R395 for two',
  'A shared Greek spit-roast spread for two, across Sunday lunch.',
  395, null, 'lunch'::special_category, '{}',
  array[7]::smallint[], '12:00', '17:00',
  null, '2026-10-04', 'Per couple. Tables of two to ten. The run is printed as 27 Jul - 4 Oct without a year.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/kiki', 'booking_page'::source_type,
  null, '2026-08-24', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000a0', 'a1000000-0000-4000-8000-000000000046', 'Weekday happy hour',
  'Happy hour every weekday afternoon into the early evening.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], '15:00', '19:00',
  null, '2026-08-31', 'The venue does not publish which drinks are discounted. The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/kapstadt-brauhaus', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000a1', 'a1000000-0000-4000-8000-000000000046', 'Schnitzel Monday for R94',
  'A schnitzel plate at a set Monday price.',
  94, null, 'food'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, '2026-08-31', 'The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/kapstadt-brauhaus', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000a2', 'a1000000-0000-4000-8000-000000000046', 'Burger Tuesday for R94',
  'A burger at a set Tuesday price.',
  94, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, '2026-08-31', 'The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/kapstadt-brauhaus', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000a3', 'a1000000-0000-4000-8000-000000000046', 'Steak Wednesday for R126',
  'A steak plate at a set Wednesday price.',
  126, null, 'food'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, '2026-08-31', 'The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/kapstadt-brauhaus', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000a4', 'a1000000-0000-4000-8000-000000000046', 'Pizza Thursday for R98',
  'A pizza at a set Thursday price.',
  98, null, 'food'::special_category, '{}',
  array[4]::smallint[], null, null,
  null, '2026-08-31', 'The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/kapstadt-brauhaus', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000a5', 'a1000000-0000-4000-8000-000000000046', 'Kids eat free on Sundays',
  'A child''s meal is free with a qualifying adult meal, every Sunday.',
  null, null, 'food'::special_category, '{}',
  array[7]::smallint[], null, null,
  null, '2026-08-31', 'Requires a qualifying adult meal. The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/kapstadt-brauhaus', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000a6', 'a1000000-0000-4000-8000-000000000047', 'R50 off every pizza',
  'Fifty rand off any pizza on the menu, Mondays and Tuesdays.',
  null, null, 'food'::special_category, '{}',
  array[1, 2]::smallint[], null, null,
  null, '2026-09-30', 'A discount rather than a set price, so what you pay depends on the pizza.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/gibson-s-gourmet-burgers-ribs', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000a7', 'a1000000-0000-4000-8000-000000000047', 'Giant beef rib for R299',
  'A 700 to 800 gram beef rib at a set winter price.',
  299, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', null, false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/gibson-s-gourmet-burgers-ribs', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000a8', 'a1000000-0000-4000-8000-000000000047', 'Winter steak special for R250',
  'The winter steak plate at a set price.',
  250, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', null, false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/gibson-s-gourmet-burgers-ribs', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000a9', 'a1000000-0000-4000-8000-000000000047', '300g rib-eye for R300',
  'A 300 gram rib-eye at a set winter price.',
  300, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', null, false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/gibson-s-gourmet-burgers-ribs', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000aa', 'a1000000-0000-4000-8000-000000000048', 'Nights for Locals — half price',
  'Fifty percent off selected dishes across the market, redeemed through the app.',
  null, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4]::smallint[], '19:00', '21:00',
  null, '2026-08-31', 'Selected items only, redeemed through the Time Out Market app. The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/time-out-market-cape-town', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  true, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000ab', 'a1000000-0000-4000-8000-000000000048', 'Happy hour — half price drinks',
  'Fifty percent off selected drinks, Monday to Thursday.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4]::smallint[], '16:00', '19:00',
  null, '2026-08-31', 'Selected drinks only. The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/time-out-market-cape-town', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000ac', 'a1000000-0000-4000-8000-000000000048', 'Bottomless mimosas for R100',
  'Bottomless Boschendal mimosas across weekend late mornings.',
  100, null, 'drinks'::special_category, '{}',
  array[6, 7]::smallint[], '11:00', '14:00',
  null, '2026-08-31', 'The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/time-out-market-cape-town', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000ad', 'a1000000-0000-4000-8000-000000000048', 'Free drink with your Sunday meal',
  'A drink on the house with any meal on Sunday evenings.',
  null, null, 'food'::special_category, '{}',
  array[7]::smallint[], '18:30', '21:30',
  null, '2026-08-31', 'The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/time-out-market-cape-town', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000ae', 'a1000000-0000-4000-8000-000000000049', 'Cocktail happy hour',
  'Cocktail specials on weekday late afternoons.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], '16:00', '18:00',
  null, '2026-08-31', 'The venue does not publish the size of the discount. The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/cause-effect-cocktail-kitchen', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000af', 'a1000000-0000-4000-8000-000000000049', 'Burger and a draught for R125',
  'A burger with a draught beer alongside it.',
  125, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/cause-effect-cocktail-kitchen', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000b0', 'a1000000-0000-4000-8000-000000000049', 'Breakfast with bottomless mimosas, R149',
  'Breakfast served with bottomless mimosas, every day.',
  149, null, 'breakfast'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/cause-effect-cocktail-kitchen', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000b1', 'a1000000-0000-4000-8000-00000000004a', 'Winter menu — two courses for R395',
  'A two-course winter menu, with a three-course option at R495.',
  395, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'Per person. Three courses R495. The run is printed as 17 Jun - 31 Aug without a year.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/sevruga', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000b2', 'a1000000-0000-4000-8000-00000000004a', 'Half-price classic sushi',
  'Fifty percent off a selected range of classic sushi.',
  null, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'Selected classic sushi only. The run is printed as 17 Jun - 31 Aug without a year.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/sevruga', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000b3', 'a1000000-0000-4000-8000-00000000004b', 'Winter lunch — two courses for R395',
  'A set winter lunch, with a three-course option at R495.',
  395, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'Per person. Three courses R495. Lunch service only. The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/marble-cape-town', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000b4', 'a1000000-0000-4000-8000-00000000004c', 'Two-for-one house drinks',
  'Two for one on selected house beers, wines and cocktails.',
  null, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'Selected house drinks. The listing gives no days or times, so it reads as whenever the venue is open. The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/tigers-milk', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000b5', 'a1000000-0000-4000-8000-00000000004c', 'Two-for-one pizza on Tuesdays',
  'Two selected pizzas for the price of one.',
  null, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, '2026-08-31', 'Selected pizzas. The V&A prints its winter run as 1 Jun - 31 Aug without a year; read as 2026 because the page is live and the window is in force now.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/tigers-milk', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000b6', 'a1000000-0000-4000-8000-00000000004d', 'Hake, prawns and a side for R95',
  'Hake and prawns with chips or rice.',
  95, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'A food-court counter rather than a sit-down restaurant.', false,
  'unknown'::holiday_status, 'https://www.waterfront.co.za/eat-and-drink/fishermans-choice-food-court', 'official_website'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000b7', 'a1000000-0000-4000-8000-00000000004e', 'Sunset sundowners — R350',
  'An hour of cocktails with canapés, facing the Atlantic.',
  350, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4]::smallint[], '17:00', '18:00',
  null, '2026-11-30', 'Per person. The run is printed as 14 Jul - 30 Nov without a year.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/the-azure-restaurant-the-twelve-apostles-hotel-and-spa', 'booking_page'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000b8', 'a1000000-0000-4000-8000-00000000004e', 'Twelve oysters and a bottle of bubbly, R990',
  'A dozen oysters served with a bottle of Boschendal Brut.',
  990, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '12:00', '15:00',
  null, '2026-11-28', 'The run is printed as 28 Apr - 28 Nov without a year.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/the-azure-restaurant-the-twelve-apostles-hotel-and-spa', 'booking_page'::source_type,
  null, '2026-08-25', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000b9', 'a1000000-0000-4000-8000-00000000004f', 'Winter menu — two courses for R220',
  'Two courses for R220 or three for R280, served straight through the day.',
  220, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '11:30', '21:00',
  null, '2026-08-31', 'Three courses R280. The run is printed as 2 Jun - 31 Aug without a year. The venue last confirmed the offer on 2 June 2026.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/greek-fisherman', 'booking_page'::source_type,
  null, '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000ba', 'a1000000-0000-4000-8000-000000000050', 'Burrata Man — free burrata and sangria',
  'A visiting burrata maker works the room over Sunday lunch, with the cheese and sangria on the house.',
  null, null, 'food'::special_category, '{}',
  array[7]::smallint[], '12:00', '15:00',
  '2026-09-06', '2026-09-06', 'One date only — Sunday 6 September 2026. Complimentary with a lunch booking; the venue publishes no price. Last confirmed 8 July 2026.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/arlecchino', 'booking_page'::source_type,
  null, '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000bc', 'a1000000-0000-4000-8000-000000000008', 'Friday Bubbles',
  'A DJ set on Friday evenings with a champagne, tequila and cocktail list alongside.',
  null, null, 'drinks'::special_category, '{}',
  array[5]::smallint[], '18:00', '22:00',
  null, '2026-09-30', 'The venue publishes no price for the offer.', false,
  'unknown'::holiday_status, 'https://www.kovecollection.co.za/the-nines/', 'official_website'::source_type,
  null, '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000bd', 'a1000000-0000-4000-8000-000000000008', 'Aperitivo in the cocktail lounge',
  'Small plates built to go with the classic and vintage cocktail list.',
  null, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '12:00', '23:00',
  null, '2026-09-30', 'Runs from midday until close; no price is published.', false,
  'unknown'::holiday_status, 'https://www.kovecollection.co.za/the-nines/', 'official_website'::source_type,
  null, '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000be', 'a1000000-0000-4000-8000-000000000051', 'Four-course winter dinner — R650',
  'A four-course winter dinner, served from early evening.',
  650, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '17:00', '22:00',
  null, '2026-09-30', 'Per person. From the winter round-up published by Dineplan on 15 July 2026. Dineplan is where the booking is taken, so this sits close to first-party, but the price was not re-checked against the venue itself.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'publication'::source_type,
  '2026-07-15', '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000bf', 'a1000000-0000-4000-8000-000000000052', 'Winter lunch — R650',
  'A chef-chosen winter lunch; there is no à la carte.',
  650, null, 'lunch'::special_category, '{}',
  array[2, 3, 4, 5, 6]::smallint[], null, null,
  null, '2026-09-30', 'Per person, one 12.30pm sitting. From the winter round-up published by Dineplan on 15 July 2026. Dineplan is where the booking is taken, so this sits close to first-party, but the price was not re-checked against the venue itself.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'publication'::source_type,
  '2026-07-15', '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000c0', 'a1000000-0000-4000-8000-000000000053', 'Winter lunch R395, dinner R550',
  'Two courses at lunch or three at dinner, on a winter menu.',
  395, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'Per person. Two courses at lunch R395, three courses at dinner R550. From the winter round-up published by Dineplan on 15 July 2026. Dineplan is where the booking is taken, so this sits close to first-party, but the price was not re-checked against the venue itself.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'publication'::source_type,
  '2026-07-15', '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000c1', 'a1000000-0000-4000-8000-000000000054', 'Five-course winter dinner — R695',
  'A five-course winter menu, evenings only.',
  695, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '18:00', '22:00',
  null, '2026-09-30', 'Per person. From the winter round-up published by Dineplan on 15 July 2026. Dineplan is where the booking is taken, so this sits close to first-party, but the price was not re-checked against the venue itself.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'publication'::source_type,
  '2026-07-15', '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000c2', 'a1000000-0000-4000-8000-000000000055', 'Two courses with a glass of wine — R375',
  'Two courses at lunch with a glass of house wine included.',
  375, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4]::smallint[], '12:00', '16:00',
  null, '2026-09-30', 'Per person, house wine included. From the winter round-up published by Dineplan on 15 July 2026. Dineplan is where the booking is taken, so this sits close to first-party, but the price was not re-checked against the venue itself.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'publication'::source_type,
  '2026-07-15', '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000c3', 'a1000000-0000-4000-8000-000000000056', 'Five-course winter lunch — R995',
  'A five-course winter lunch at the Pierhead.',
  995, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '12:00', '15:00',
  null, '2026-09-30', 'Per person. From the winter round-up published by Dineplan on 15 July 2026. Dineplan is where the booking is taken, so this sits close to first-party, but the price was not re-checked against the venue itself.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'publication'::source_type,
  '2026-07-15', '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-0000000000c6', 'a1000000-0000-4000-8000-000000000057', 'Chicken Snitch buy-one-get-one — R140 for two',
  'Two of the chicken schnitzel burgers for the price of one, every Wednesday.',
  140, null, 'food'::special_category, '{}',
  array[3]::smallint[], '11:00', '23:59',
  null, '2026-09-30', 'R140 for two burgers, Wednesdays. Seen on the venue''s own Instagram story on 26 August 2026 — stories expire after 24 hours, so the link below goes to the account rather than the post, and this needs re-checking rather than being taken as permanent. Uber Eats separately advertises a buy-one-get-one on the same burger at R120, which is a delivery price on a different channel and carries no day restriction. No end date was given for the Wednesday deal; the date here is a prompt to confirm it, not something the venue published.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/chicksandchopsza/', 'social'::source_type,
  '2026-08-26', '2026-08-26', 'verified'::verification_status,
  false, true
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id, title = excluded.title, description = excluded.description, price = excluded.price, original_price = excluded.original_price, category = excluded.category, dietary_tags = excluded.dietary_tags, days_of_week = excluded.days_of_week, start_time = excluded.start_time, end_time = excluded.end_time, valid_from = excluded.valid_from, valid_until = excluded.valid_until, terms = excluded.terms, booking_required = excluded.booking_required, public_holiday_status = excluded.public_holiday_status, source_url = excluded.source_url, source_type = excluded.source_type, source_published_at = excluded.source_published_at, last_verified_at = excluded.last_verified_at, verification_status = excluded.verification_status, featured = excluded.featured, active = excluded.active, updated_at = now();

-- ------------------------------------------- research queue (not public)
insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000018', null,
  '{"restaurant":"Cargo","street_address":"178 Kloof Street, Gardens","title":"Happy hour, early evening","start_time":"17:00","end_time":"18:00","note":"Sources conflict. Cape Town Magazine (updated 22 January 2026) says R20 house wine, beer or tequila, Monday to Thursday 4-6pm, at 158 Kloof Street in Tamboerskloof. The operator All Yours Co says 178 Kloof Street in Gardens and happy hour 5-6pm, with no price. The official source wins, so nothing here is publishable as advertised."}'::jsonb,
  'https://www.allyoursco.com/cargo', '2026-08-22', 'medium'::confidence_level,
  'pending'::review_status, 'Phone 021 213 1221. Confirm the street number, the suburb, the exact hours, and whether the R20 price is real.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000019', null,
  '{"restaurant":"Rita''s Cocktail Club","street_address":"22 Kloof Street, Gardens","title":"Half-price margaritas, daily 5-7pm","note":"Listed by Secret Cape Town, whose page was last updated in December 2023 - nearly three years ago. No current official source found."}'::jsonb,
  'https://secretcapetown.co.za/happy-hour-specials-in-cape-town/', '2026-08-22', 'low'::confidence_level,
  'pending'::review_status, 'Walk past or phone. A near-three-year-old listing is a lead, not evidence.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000001a', null,
  '{"restaurant":"Arnold''s","street_address":"60 Kloof Street, Gardens","title":"R30 mimosas and R49 cocktails, daily 2-6pm","note":"From the same December 2023 Secret Cape Town roundup. Rand prices from 2023 are unlikely to have survived unchanged."}'::jsonb,
  'https://secretcapetown.co.za/happy-hour-specials-in-cape-town/', '2026-08-22', 'low'::confidence_level,
  'pending'::review_status, 'Check current menu prices before publishing. Treat the rand figures as certainly stale.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000001b', null,
  '{"restaurant":"The Public House","street_address":"108 Kloof Street, Gardens","title":"Two-for-one nights, Wednesday to Sunday","note":"Secret Cape Town (December 2023) lists two-for-one margaritas on Wednesday, buy-one-get-one beer and pizza on Thursday, and a Sunday set of two-for-ones. Rich if true, but undated and unconfirmed."}'::jsonb,
  'https://secretcapetown.co.za/happy-hour-specials-in-cape-town/', '2026-08-22', 'medium'::confidence_level,
  'pending'::review_status, 'Worth a phone call - if even half of this still runs it is four listings across three days.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000001c', null,
  '{"restaurant":"Van Hunks","street_address":"Corner Kloof and Upper Union Street, Gardens","title":"R12 single tot deal, daily 5-7pm and 10-11pm","note":"Secret Cape Town (December 2023). The official site was checked on 22 August 2026 and publishes no specials at all - only a description of the venue."}'::jsonb,
  'https://vanhunks.framer.website/', '2026-08-22', 'low'::confidence_level,
  'pending'::review_status, 'The official site carries nothing. Phone 021 422 5422, or read the board in person.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000001d', null,
  '{"restaurant":"The Village Idiot","street_address":"Loop Street, Cape Town City Centre","title":"Weeknight food-and-drink combos","note":"Secret Cape Town (December 2023) lists a R115 pizza-and-drink on Wednesday, half-price food on Thursday, a R125 burger-and-drink on Friday, and a R350 two-mains-and-wine deal on Saturday."}'::jsonb,
  'https://secretcapetown.co.za/happy-hour-specials-in-cape-town/', '2026-08-22', 'medium'::confidence_level,
  'pending'::review_status, 'Four potential listings across four days. Worth chasing properly.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000001e', null,
  '{"restaurant":"MiCaffe","street_address":"Shop 5, The Barracks, 50 Bree Street, Cape Town City Centre","title":"Happy hour Wed-Sat 4-6pm; free mimosas with Sunday breakfast","note":"Secret Cape Town (December 2023). The free-mimosa-with-breakfast claim in particular needs confirming before it goes anywhere near the site."}'::jsonb,
  'https://secretcapetown.co.za/happy-hour-specials-in-cape-town/', '2026-08-22', 'low'::confidence_level,
  'pending'::review_status, 'Confirm both offers on the spot. Never publish a free-drink claim on a 2023 source.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000001f', null,
  '{"restaurant":"Cafe Extrablatt","street_address":"Exhibition Building, Green Point","title":"Cocktails R45 and mocktails R33, Monday to Friday 5-8pm","note":"Cape Town Magazine, page last updated 22 January 2026 - seven months old, and third-party. Extrablatt already has a verified listing from an earlier sweep; check whether this is the same offer or a second one."}'::jsonb,
  'https://www.capetownmagazine.com/happy-hours', '2026-08-22', 'medium'::confidence_level,
  'pending'::review_status, 'Cross-check against the existing Extrablatt listing before adding, to avoid a duplicate.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000020', null,
  '{"restaurant":"The Sanctuary","street_address":"Kloof Street, Gardens","title":"CBC Fridays","note":"FoodBlog Cape Town mentions a Friday CBC beer promotion but publishes no price, no times and no date for the claim."}'::jsonb,
  'https://www.food-blog.co.za/cape-town-specials/', '2026-08-22', 'low'::confidence_level,
  'pending'::review_status, 'Too thin to publish. Needs a price and a time from the venue itself.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000021', null,
  '{"restaurant":"Cargo","street_address":"158 Kloof Street, Tamboerskloof","title":"R20 happy hour — house wine, beer or a tequila shot, Mon–Thu 4–6pm","note":"Also a R75 breakfast with coffee and juice, Mon–Thu 7–11am."}'::jsonb,
  'https://www.capetownmagazine.com/happy-hours', '2026-08-23', 'medium'::confidence_level,
  'needs_more_evidence'::review_status, 'Twenty rand for a drink on Kloof Street would be the best offer on the site — which is exactly why it needs checking. The round-up is from January 2026 and the venue''s own Instagram has not posted since June 2025. One phone call settles it.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000022', null,
  '{"restaurant":"Harringtons Cocktail Lounge","street_address":"61B Harrington Street, East City","title":"Fiesta Fridays — two courses and two cocktails R330; bottomless frozen margaritas R200; margarita jugs R275","note":"Separate from the 40% off happy hour already published."}'::jsonb,
  'https://www.food-blog.co.za/cocktail-dinner-date-night-with-bottomless-margaritas-at-harringtons-cocktail-lounge/', '2026-08-23', 'high'::confidence_level,
  'approved'::review_status, 'Resolved on 23 August. The lounge''s own Instagram post of 13 August gives the R50 frozen margaritas and the R330 dinner first-hand, so both are published. The bottomless margaritas at R200 and the R275 jugs are still unconfirmed and are NOT published.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000023', null,
  '{"restaurant":"Filini Bar, Radisson Hotel","street_address":"29 Heerengracht Street, Foreshore","title":"Daily happy hour, 5–6pm","note":"No prices published anywhere."}'::jsonb,
  'https://www.food-blog.co.za/join-the-new-happy-hour-special-at-filini-bar-to-skip-the-traffic/', '2026-08-23', 'medium'::confidence_level,
  'approved'::review_status, 'Published on 23 August with the hour and the 31 August end date from the venue''s own listing, and a note on the card saying the prices are not published. Getting the actual prices would still improve it.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000024', null,
  '{"restaurant":"Clarke''s Bar & Dining Room","street_address":"133 Bree Street","title":"R35 cocktails during the 5–6pm happy hour","note":"The hour itself is published and live on the site; only the R35 price is unconfirmed."}'::jsonb,
  'https://www.vibescout.com/za/city/cape-town/post/happy-hour', '2026-08-23', 'low'::confidence_level,
  'needs_more_evidence'::review_status, 'The list it comes from carries no date at all and still lists Bombay Bicycle Club, which Cargo replaced. Treat every price on it as unverified.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000025', null,
  '{"restaurant":"Roast & Co, The Company''s Garden Restaurant, Aces ''n'' Spades, Café Manhattan, The Stack, Café Paradiso, Lola''s, Sidewalk Café","street_address":"City Bowl — Shortmarket, Queen Victoria, Hout, Waterkant, Kloof, Long, Vredehoek","title":"Eight undated City Bowl happy hours","note":"2-for-1 all drinks 4–6pm at Roast & Co and The Company''s Garden; half-price spirits Wed–Fri 4–8pm at Aces ''n'' Spades; R40 cocktails 3–6pm at The Stack; G&T R35 at Lola''s; 2-for-1 at Café Manhattan, Café Paradiso and Sidewalk Café."}'::jsonb,
  'https://www.vibescout.com/za/city/cape-town/post/happy-hour', '2026-08-23', 'low'::confidence_level,
  'needs_more_evidence'::review_status, 'One undated page, and it still lists a venue that closed. None of these can be published on it. They are all within walking distance of one another, so an afternoon on foot would confirm or kill the lot.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000026', null,
  '{"restaurant":"Beluga","street_address":"Alfred Chambers, Cruise Terminal, Duncan Road, V&A Waterfront","title":"Six oysters with Boschendal Brut MCC; Dine & Dance Saturdays with 20% off featured wines; Soul Sunday 13:00–16:00","note":"The oyster offer is listed at both R235 and R425 without saying what separates them."}'::jsonb,
  'https://www.restaurants.co.za/specials/western-cape/victoria-alfred-waterfront', '2026-08-23', 'medium'::confidence_level,
  'pending'::review_status, 'Two prices for one offer is a listing error somewhere; confirm which is which. The address question is settled: a 2021 guide puts Beluga at The Foundry in Green Point, but its own current listing gives the Cruise Terminal at the Waterfront, so it has moved. The daily sushi, dim sum and cocktail specials are now published; this entry covers only the oyster offer and the Saturday wine discount.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000027', null,
  '{"restaurant":"London Road Bistro","street_address":"13 London Road, Sea Point","title":"Happy hour daily 5–7pm — kegtails R90, two house wines R80, buy three draughts get one free","note":"The burger special from the same venue is published; this one is not."}'::jsonb,
  'https://www.food-blog.co.za/happy-hour-elevated-london-road-bistro-brings-the-vibes-to-sea-point/', '2026-08-23', 'medium'::confidence_level,
  'needs_more_evidence'::review_status, 'The article is from August 2025, not 2026 — a year old, and prices move. Worth a call; the offer is good enough to be worth confirming.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000028', null,
  '{"restaurant":"Bellagio","street_address":"Green Point","title":"Dinner date for two, R785 a couple","note":"Focaccia and a set menu."}'::jsonb,
  'https://www.food-blog.co.za/a-date-night-special-for-two-at-bellagio-in-green-point/', '2026-08-23', 'medium'::confidence_level,
  'pending'::review_status, 'July 2026, no end date, and the street address is not published. Get both.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000029', null,
  '{"restaurant":"Pepperclub Hotel","street_address":"Loop Street, Cape Town City Centre","title":"Breakfast buffet R295, daily 07:00–10:30","note":"Described as reduced pricing, but no normal price is given to compare it against."}'::jsonb,
  'https://www.food-blog.co.za/begin-your-day-with-a-gourmet-buffet-at-pepperclub-hotel/', '2026-08-23', 'low'::confidence_level,
  'pending'::review_status, 'A price on its own is not a special. Find out what the buffet normally costs before publishing this.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000002a', null,
  '{"restaurant":"Sessions Cape Town","street_address":"15 Lower Long Street, Cape Town City Centre","title":"Weekday happy hour — two for one on tap beers and cocktails","note":"Eleventh-floor bar with pool tables and a view. Open Wed–Tue 1pm–midnight."}'::jsonb,
  'https://www.capetownmagazine.com/new', '2026-08-23', 'medium'::confidence_level,
  'needs_more_evidence'::review_status, 'Good offer, but no times are published anywhere and a happy hour without a window tells a visitor nothing. Get the hours and it goes straight up.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000002b', null,
  '{"restaurant":"The Duchess Lounge","street_address":"123 Lower Main Road, Observatory","title":"Classic cocktails from R79, happy hour 5–7pm daily","note":"Queer bar with drag and burlesque nights. Open Wed–Thu from 3pm, Fri–Sat from noon, Sun noon–9pm."}'::jsonb,
  'https://www.capetownmagazine.com/new', '2026-08-23', 'high'::confidence_level,
  'pending'::review_status, 'Complete and well dated — the only thing stopping it is that Observatory is not in the suburb allowlist. Add the suburb (types.ts and a migration, both) and this can be published as it stands.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000002c', null,
  '{"restaurant":"Asoka","street_address":"68 Kloof Street, Gardens","title":"Three-course dinner, R295; live jazz on Tuesdays from 8pm","note":"The bar opens at 6pm daily and the kitchen runs to midnight. Tuesday bookings must be made by phone or email, not through Dineplan."}'::jsonb,
  'https://asoka.za.com/tuesday-nights/', '2026-08-23', 'high'::confidence_level,
  'approved'::review_status, 'Resolved. The R295 three-course dinner is confirmed by The Cape Town Blog''s Monday round-up, updated 12 August 2026, and published as a Monday listing. The Tuesday jazz night stays out: it is an event with no offer attached to it.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000002d', null,
  '{"restaurant":"Woodstock Brewery","street_address":"252 Albert Road, Woodstock","title":"A different food special every day, from R62.50","note":"Half-price burgers Monday; curry with a free lager Tuesday; schnitzel Wednesday; rib platters Thursday; steak Saturday; beer-battered hake Sunday. Open daily 11am–10pm. A separate round-up also gives a daily 4–6pm happy hour: two Born Slippy draughts R70, one R35."}'::jsonb,
  'https://www.capetownmagazine.com/winter-specials', '2026-08-23', 'high'::confidence_level,
  'pending'::review_status, 'Seven listings from one venue, well priced, and from a page updated 14 August. The only thing stopping them is that Woodstock is not in the suburb allowlist. Adding it would also unlock StarDust on Sir Lowry Road and Cellar Collective on Albert Road — worth deciding as one call rather than venue by venue.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000002e', null,
  '{"restaurant":"Door 221, Clarke''s, Quaglino''s, Bootlegger Sea Point","street_address":"Bree Street; Bree Street; Mouille Point; Sea Point","title":"Four priced happy hours from an undated article","note":"Door 221: two cocktails R50, Tue–Sat 6–7pm. Clarke''s: double spirits R27 and R26 beer with a free shot, weekdays 5–6pm. Quaglino''s: half-price craft beer and cocktails, weekdays 5–7pm. Bootlegger Sea Point: half-price beer and cocktails 4:30–6:30pm daily, about R30 a cocktail."}'::jsonb,
  'https://www.eatout.co.za/article/5-great-happy-hour-specials-cape-town/', '2026-08-23', 'medium'::confidence_level,
  'needs_more_evidence'::review_status, 'The article carries no publication date, so none of it can be published as it stands. The Clarke''s entry matters most: the 5–6pm happy hour is already live without a price, and R27 doubles would complete that card. Door 221 is two doors from Clarke''s — one walk confirms both.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000002f', null,
  '{"restaurant":"Iron Steak and Bar, Café Extrablatt, Van Hunks, Mai Thai Sushi Gardens","street_address":"114 Bree Street; Green Point; Kloof Street; Gardens","title":"Four Wednesday specials","note":"Iron: Wagyu Wednesday burger R119. Café Extrablatt: buy one burger get one free, all day. Van Hunks: half a peri-peri chicken in a Portuguese roll R125. Mai Thai Sushi Gardens: sushi buffet R249 adults, R179 under-tens."}'::jsonb,
  'https://restaurants-in-cape-town.co.za/wednesday-specials-in-cape-town/', '2026-08-23', 'medium'::confidence_level,
  'needs_more_evidence'::review_status, 'The page was last updated 12 June, which is ten weeks old, and Iron''s own Facebook advertised the same Wagyu Wednesday at R99 — so the price has moved at least once. Two of these venues are already on the site, so confirming them is cheap and would add four Wednesday listings.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000030', null,
  '{"restaurant":"Café Manhattan","street_address":"74 Waterkant Street, De Waterkant","title":"Daily two-for-one happy hour; Tuesday date night","note":"Both are advertised on the venue''s own site with no times and no prices. A 2019 list put the happy hour at 4–6pm and again 9–11pm."}'::jsonb,
  'https://cafemanhattan.co.za', '2026-08-23', 'medium'::confidence_level,
  'needs_more_evidence'::review_status, 'First-party, so the offers are real — but a happy hour with no window tells a visitor nothing, which is why Sessions is queued too. One call gets the times and both go up. The Monday burger and the Thursday R20 shots from the same venue are already published.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000001', null,
  '{"restaurant":"Asoka","street_address":"68 Kloof Street, Gardens","title":"Three-course dinner for R295","price":295,"days_of_week":[1,3,4,7],"start_time":"17:30","note":"Asoka''s own site shows a ''Dinner special May 2026'' item but publishes no price, days or times. The R295 / Mon-Wed-Thu-Sun detail comes from an undated third-party listing."}'::jsonb,
  'https://asoka.za.com/', '2026-08-20', 'medium'::confidence_level,
  'pending'::review_status, 'Phone 021 422 0909 to confirm price, days and times, then publish.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000002', null,
  '{"restaurant":"Amura at Mount Nelson","street_address":"76 Orange Street, Gardens","title":"Four-course winter menu","price":750,"days_of_week":[1,2,3,4,5,6,7],"note":"Dinner daily plus Friday-to-Sunday lunch. Reported end date is vague (\"end August / September 2026\") and Belmond''s own site publishes no pricing."}'::jsonb,
  'https://www.dineplan.com/blog/winter-specials-and-set-menus/', '2026-08-20', 'medium'::confidence_level,
  'pending'::review_status, 'High price point — confirm directly with the hotel before publishing.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000003', null,
  '{"restaurant":"The Red Room by Chefs Warehouse (Mount Nelson)","street_address":"76 Orange Street, Gardens","title":"Four-course winter dinner","price":650,"start_time":"17:00","days_of_week":[1,2,3,4,5,6,7],"note":"Chefs Warehouse''s own page for The Red Room lists no winter special or price."}'::jsonb,
  'https://www.dineplan.com/blog/winter-specials-and-set-menus/', '2026-08-20', 'medium'::confidence_level,
  'pending'::review_status, 'Confirm with the restaurant before publishing.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000004', null,
  '{"restaurant":"Kyoto Garden","street_address":"11 Kloof Nek Road, Gardens","title":"Three-course winter special","note":"A listing page for a Kyoto Garden winter special exists but could not be read — the publisher''s robots.txt disallows automated access. Kyoto Garden''s own site shows no special."}'::jsonb,
  'https://www.kyotogarden.co.za/', '2026-08-20', 'low'::confidence_level,
  'needs_more_evidence'::review_status, 'Open the listing in a browser by hand, or phone 021 422 2001.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000005', null,
  '{"restaurant":"La Parada Kloof Street","street_address":"47 Kloof Street, Gardens","title":"Tuesday date-night offer","days_of_week":[2],"note":"Mentioned only in a customer review on the booking page — no price, times or terms, and nothing on the restaurant''s own site."}'::jsonb,
  'https://www.dineplan.com/restaurants/la-parada-kloof-street', '2026-08-20', 'low'::confidence_level,
  'pending'::review_status, 'Customer-review hearsay only. Confirm before publishing.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000006', null,
  '{"restaurant":"Hudsons The Burger Joint — Kloof Street","street_address":"22 Kloof Street, Gardens","title":"First Thursdays — live DJ and drink specials","start_time":"20:00","note":"Monthly rather than weekly, so it does not fit the weekday model as-is. The site does not say which drinks are discounted or by how much."}'::jsonb,
  'https://www.theburgerjoint.co.za/specials', '2026-08-20', 'medium'::confidence_level,
  'pending'::review_status, 'Decide whether to model monthly offers, then capture the actual drink prices.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000007', null,
  '{"restaurant":"Kloof Street House","street_address":"30 Kloof Street, Gardens","title":"Two- or three-course lunch menu","price":250,"note":"Reported by a 2023 listing article as R250 for two courses and R295 for three. Nothing on the restaurant''s current site."}'::jsonb,
  'https://www.kloofstreethouse.co.za/', '2026-08-20', 'low'::confidence_level,
  'needs_more_evidence'::review_status, 'Source is three years old. Do not publish without current confirmation.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000008', null,
  '{"restaurant":"Fat Cactus Gardens","street_address":"5 Park Road, Gardens","title":"Unconfirmed weekday specials","note":"The group runs specials at other branches, but the specials page returns a 404 and nothing branch-specific to Gardens could be verified."}'::jsonb,
  'https://fatcactus.co.za/contact/', '2026-08-20', 'low'::confidence_level,
  'pending'::review_status, 'Phone 021 422 5022 to ask what runs on which day.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000009', null,
  '{"restaurant":"Our Local — Kloof Street","street_address":"117 Kloof Street, Gardens","title":"Cinnamon bun for R50","price":50,"note":"Advertised on the official site \"while stocks last\" with no days or times — a bakery item rather than a day-of-week special."}'::jsonb,
  'https://ourlocal.co.za/', '2026-08-20', 'high'::confidence_level,
  'pending'::review_status, 'Decide whether all-week bakery offers belong on the site.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000010', null,
  '{"restaurant":"Cargo","street_address":"158 Kloof Street, Tamboerskloof","title":"R20 house wine, beer or tequila","price":20,"days_of_week":[1,2,3,4],"start_time":"16:00","end_time":"18:00","note":"From a happy-hour round-up last updated in January 2026 — seven months old, and nothing on the venue’s own site confirms it."}'::jsonb,
  'https://www.capetownmagazine.com/happy-hours', '2026-08-21', 'medium'::confidence_level,
  'pending'::review_status, 'Phone 021 213 1221 to confirm. This is the only Tamboerskloof happy hour found.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000011', null,
  '{"restaurant":"Deer Park Café","street_address":"Deer Park Drive, Vredehoek","title":"Weekly changing menu with Indian specials","note":"The café’s own site advertises a weekly changing menu built around Indian dishes, but publishes no prices, days or times."}'::jsonb,
  'https://deerparkcafe.co.za/', '2026-08-21', 'medium'::confidence_level,
  'needs_more_evidence'::review_status, 'The only Vredehoek lead found. Phone for the current week’s prices and days.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000012', null,
  '{"restaurant":"The Nines","street_address":"9th Floor, Station House, 19 Kloof Road","title":"Fridays Come Alive, Aperitivo, and the winter set menu","days_of_week":[5],"start_time":"18:00","end_time":"22:00","note":"Three further offers listed with end dates but no prices at all."}'::jsonb,
  'https://www.restaurants.co.za/specials/western-cape/sea-point', '2026-08-21', 'medium'::confidence_level,
  'pending'::review_status, 'Get prices before publishing. The Sunday lunch from the same venue is already live.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000013', null,
  '{"restaurant":"Grand Pavilion, and The President Hotel","street_address":"277 Beach Road and S4 Alexander Road, Sea Point","title":"Winter set menu R450/R550; Thursday date-night dinner R750","note":"Both from the July 2026 winter round-up. Neither hotel publishes the offer on its own site."}'::jsonb,
  'https://www.dineplan.com/blog/winter-specials-and-set-menus/', '2026-08-21', 'medium'::confidence_level,
  'pending'::review_status, 'Confirm with each venue before publishing.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000014', null,
  '{"restaurant":"Lily’s and Bobo’s","street_address":"Mouille Point","title":"Winter chef’s specialities and set menus","note":"Listed with end dates of 30 September 2026 but no prices, days or times."}'::jsonb,
  'https://www.restaurants.co.za/specials/western-cape/mouille-point', '2026-08-21', 'medium'::confidence_level,
  'pending'::review_status, 'Get prices and days.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000015', null,
  '{"restaurant":"Zenzero, Surfshack Diner, La Belle, Bilboa, Chinchilla","street_address":"Camps Bay","title":"Winter specialities; Chinchilla Sunset Sessions Fri–Sun 16:00–20:00","note":"All carry end dates but none publishes a price. Chinchilla’s is a DJ session rather than a discount."}'::jsonb,
  'https://www.restaurants.co.za/specials/western-cape/camps-bay', '2026-08-21', 'low'::confidence_level,
  'pending'::review_status, 'Decide whether priceless “chef’s specialities” count as a special at all.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000016', null,
  '{"restaurant":"Arnold’s, The Public House, Van Hunks, Rita’s Cocktail Club","street_address":"Kloof Street and Upper Union Street, Gardens","title":"Four Gardens happy hours","note":"R30 mimosas and R49 cocktails at Arnold’s; 2-for-1 margaritas, beers and pizzas at The Public House; R12–R45 drinks at Van Hunks; half-price margaritas at Rita’s."}'::jsonb,
  'https://secretcapetown.co.za/happy-hour-specials-in-cape-town/', '2026-08-21', 'low'::confidence_level,
  'needs_more_evidence'::review_status, 'Source last updated December 2023 — far too old to publish. Worth four phone calls: these are all a short walk apart.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000017', null,
  '{"restaurant":"Oranjezicht — nothing found","street_address":"Oranjezicht","title":"No verifiable special found in this suburb","note":"Oranjezicht is largely residential. No restaurant or bar there published a current special on any source that could be read."}'::jsonb,
  'https://www.restaurants.co.za/specials/western-cape', '2026-08-21', 'low'::confidence_level,
  'needs_more_evidence'::review_status, 'Re-check on foot, or leave the suburb empty — the empty state handles it.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000031', null,
  '{"restaurant":"Arnold''s","street_address":"60 Kloof Street, Gardens","title":"Five more priced offers alongside the published happy hour","note":"Early-bird breakfast R35 from 6:30am; happy-hour cocktails R49; cheese and guacamole burger with a Jack Black R75; mimosas R30 all day; steak, egg and chips R99; half-price pizzas."}'::jsonb,
  'https://www.eatplaydrink.capetown/eat/arnolds-in-kloof-street-is-an-institution-and-still-going-strong/', '2026-08-23', 'low'::confidence_level,
  'needs_more_evidence'::review_status, 'The article is from March 2021 — five years old, and R35 for a cooked breakfast tells you how far the prices have moved. The happy hour itself is published from the restaurant''s own site and is live; only these prices are unconfirmed. Phone 021 424 4344 and this becomes five or six Gardens listings in one call.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000032', null,
  '{"restaurant":"La Boheme, Bootlegger Sea Point","street_address":"Main Road and Regent Road, Sea Point","title":"Two-course R120 / three-course R145; R12 coffee before 8am and evening happy hour","note":"Sea Point is one of the thinnest suburbs on the site, so these are worth chasing even though the source is old."}'::jsonb,
  'https://www.eatout.co.za/article/hood-eat-sea-point/', '2026-08-23', 'low'::confidence_level,
  'needs_more_evidence'::review_status, 'The article is from January 2014. Nothing on it can be published; it is here only because Sea Point has so few confirmed listings that even a twelve-year-old lead is worth a phone call.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000033', null,
  '{"restaurant":"Rita''s Cocktail Club, Clarke''s, Tiger''s Milk, The Wolf House","street_address":"Kloof Street and Bree Street","title":"Four City Bowl two-for-one nights","note":"Rita''s: 50% off tacos on Tuesdays. Clarke''s: two-for-one burgers Tuesday 7–8pm. Tiger''s Milk: two pizzas for the price of one, Tuesday all day, dine-in, selected pizzas. The Wolf House, Kloof Street: burger, wings, cheese balls and chilli fries for R208 on Wednesdays."}'::jsonb,
  'https://www.timeout.com/cape-town/restaurants/best-2-for-1-restaurant-specials-in-cape-town', '2026-08-23', 'medium'::confidence_level,
  'needs_more_evidence'::review_status, 'The article is from April 2025 — sixteen months old. Three of the four venues are already on the site, so these are four phone calls that would each add a listing to a day that needs them. Worth knowing how prices move on this evidence: the same article and a December 2025 round-up both put Iron''s Wagyu Wednesday at R99, while a June 2026 page says R119.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000034', null,
  '{"restaurant":"Una Más Mezcalería","street_address":"77 Regent Road, Sea Point","title":"Taco Tuesday — two-for-one on selected tacos, 12pm to 5pm","note":"Their R90 lunchtime margaritas are published; this is the food half."}'::jsonb,
  'https://www.instagram.com/p/DZFCAHnIvk2/', '2026-08-23', 'medium'::confidence_level,
  'pending'::review_status, 'First-party but from 2 June, and posted as "today" rather than as a standing weekly offer — so it may have been a one-off. Their more recent posts do not mention it. Worth one check: Sea Point needs the listings.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000035', null,
  '{"restaurant":"Therapy, 5 Park Road, Gardens","street_address":"5 Park Road, Gardens","title":"Hookah R350, refills R250, every day","note":"First-party and current — posted 10 August 2026."}'::jsonb,
  'https://www.instagram.com/reel/Db2npe2i-LL/', '2026-08-23', 'high'::confidence_level,
  'pending'::review_status, 'Well evidenced, but it is a hookah rather than food or drink, and the site has no category for it. A product decision rather than a research one: either add a nightlife category or leave offers like this out.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000036', null,
  '{"restaurant":"Sonny and Irene","street_address":"Station House, 19 Kloof Road, Sea Point","title":"Winter chef''s specialities","note":"Kove Collection''s own page carries a seasonal add-on menu — breakfast dishes until 11.30am, then steak Diane, a spicy chicken burger and French onion soup at lunch and dinner. Restaurants.co.za gives the end date as 30 September 2026. Not a discount and no prices published anywhere, so there is nothing to put on a card."}'::jsonb,
  'https://www.kovecollection.co.za/sonny-and-irene/', '2026-08-24', 'high'::confidence_level,
  'pending'::review_status, 'Phone 021 745 6600 for the prices. Publish only if there is a real saving; a seasonal menu on its own is not a special.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000037', null,
  '{"restaurant":"Bobo''s","street_address":"1 Two Oceans Beach, Beach Road, Mouille Point","title":"Winter chef''s specialities and set menu","note":"Two- and three-course winter set menu plus à la carte chef''s dishes, stated on the venue''s own page as valid until September 2026. The menus are published as images, so no price, day or time could be read."}'::jsonb,
  'https://www.kovecollection.co.za/bobos/', '2026-08-24', 'medium'::confidence_level,
  'pending'::review_status, 'Phone 021 439 9027 for the set-menu price and the days it runs. Mouille Point would also gain a second venue.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000038', null,
  '{"restaurant":"Lily''s","street_address":"Shop 1, East West, cnr Beach Road and Surrey Place, Mouille Point","title":"Winter chef''s specialities","note":"A rotating seasonal à la carte selection on the venue''s own page, valid until September 2026. Reads as a seasonal menu rather than a discount, and no prices are published."}'::jsonb,
  'https://www.kovecollection.co.za/lilys/', '2026-08-24', 'medium'::confidence_level,
  'pending'::review_status, 'Phone 021 204 8545. Same question as Bobo''s — is there an actual saving?'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000039', null,
  '{"restaurant":"La Boheme Wine Bar & Bistro","street_address":"341 Main Road, Sea Point","title":"Three tapas for R285","price":285,"note":"Inside Guide, dated 1 April 2025, describes a standing three-tapas deal. The venue''s own site does not mention it and its menu page could not be read. Sixteen months old with no first-party backing."}'::jsonb,
  'https://insideguide.co.za/cape-town/sea-point-restaurants/', '2026-08-24', 'medium'::confidence_level,
  'pending'::review_status, 'Phone 021 434 8797. If it still runs, this is a good Sea Point food listing — confirm the price and which days.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000003a', null,
  '{"restaurant":"Harvey''s at Winchester Mansions","street_address":"221 Beach Road, Sea Point","title":"Sunday jazz brunch","days":"Sunday","note":"Widely referenced as a weekly fixture, but every source that could be opened is undated and none gives a price or a time. The hotel''s own site was unreachable."}'::jsonb,
  'https://www.capetownmagazine.com/harveys', '2026-08-24', 'medium'::confidence_level,
  'pending'::review_status, 'Well known enough to be worth a call. Needs a price, a sitting time and confirmation it still runs weekly.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000003b', null,
  '{"restaurant":"Gambas Seafood Bistro","street_address":"343a Main Road, Sea Point","title":"Weekend Argentinian prawn special","price":200,"note":"Ten Argentinian prawns with a side, weekends, per FoodBlog Cape Town dated 23 January 2023. Three and a half years old, and no official website could be found for the venue."}'::jsonb,
  'https://www.food-blog.co.za/incredible-prawn-specials-at-gambas-seafood-bistro/', '2026-08-24', 'low'::confidence_level,
  'pending'::review_status, 'Confirm the venue is still trading before anything else. Phone 066 314 0801 was current in 2023.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000003c', null,
  '{"restaurant":"Sótano","street_address":"Trading from 315 Main Road, Sea Point while Mouille Point is renovated","title":"Six oysters or five salmon roses with a glass of rosé, R120","price":120,"start_time":"16:00","end_time":"18:00","note":"The Cape Town Blog, updated 17 December 2025, lists this weekday early-evening deal. Not published: the evidence predates 2026. One research pass also read the Sotano website as trading from a Sea Point pop-up while Mouille Point is renovated; a second pass found no evidence of that. Trading location is unresolved."}'::jsonb,
  'https://thecapetownblog.com/daily-restaurant-specials/', '2026-08-24', 'low'::confidence_level,
  'pending'::review_status, 'Revisit once Mouille Point reopens. Phone 021 433 1757 to ask whether the deal runs at the pop-up.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000003d', null,
  '{"restaurant":"The Hussar Grill — Mouille Point (already listed)","street_address":"","title":"Two offers seen on a third-party page that we do not currently list","note":"Restaurants.co.za shows a R349 two-course winter menu and Tuesday date nights at R499 or R599 per couple, both ending 31 August 2026. Neither is in our data. Third-party only, so not published."}'::jsonb,
  'https://www.restaurants.co.za/specials/western-cape/mouille-point', '2026-08-24', 'medium'::confidence_level,
  'pending'::review_status, 'Check against the Hussar Grill website. If they are real they expire in a week, so it may not be worth listing them at all.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000003e', null,
  '{"restaurant":"The Greek Fisherman","street_address":"Dineplan says 78 Regent Road, Sea Point; directories say V&A Waterfront","title":"Winter menu — two courses R220, three courses R280","price":220,"days":"Every day","start_time":"11:30","end_time":"21:00","note":"Good offer, well evidenced on the venue''s own booking page and confirmed by the venue on 2 June 2026, running to 31 August. Held back only because the suburb is unresolved: Dineplan gives a Sea Point address while several directories place the restaurant at the V&A Waterfront, and the official site publishes no address on any reachable page."}'::jsonb,
  'https://www.dineplan.com/restaurants/greek-fisherman', '2026-08-24', 'high'::confidence_level,
  'pending'::review_status, 'Phone 021 418 5411 and ask one question: what is the street address. If Sea Point, publish immediately — but it expires 31 August 2026, so it is nearly moot.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000003f', null,
  '{"restaurant":"Juno","street_address":"6 Kloof Road, Sea Point","title":"Unknown — site could not be read","note":"A breakfast, lunch and coffee venue in Sea Point. Every page of juno.co.za is disallowed by its robots.txt, so nothing was checked. Listed here so it is not mistaken for a venue with no offers."}'::jsonb,
  'https://juno.co.za/', '2026-08-24', 'low'::confidence_level,
  'pending'::review_status, 'Needs a human to open the site in a browser. A strong candidate for the breakfast category, which currently has almost nothing in Sea Point.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000040', null,
  '{"restaurant":"Fuego","street_address":"77 Regent Road, Sea Point","title":"Half-price classic cocktails, daily 4-6.30pm","start_time":"16:00","end_time":"18:30","note":"A daily half-price cocktail happy hour with tapas alongside. The only source found is FoodBlog Cape Town dated 27 September 2017 — nine years old. No official website exists, and 77 Regent Road now also houses Sundoo and Three Wise Monkeys."}'::jsonb,
  'https://www.food-blog.co.za/fuego/', '2026-08-24', 'low'::confidence_level,
  'pending'::review_status, 'Establish whether the venue still trades before anything else. If it does, this is exactly the kind of drinks special the site needs.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000041', null,
  '{"restaurant":"Arthur''s Mini Super — the Mini Bar","street_address":"15 Arthurs Road, Sea Point","title":"Possible early-evening bar offer","note":"No special is published. Flagged because the separate Mini Bar trades Tuesday to Saturday 4pm to 10pm while the day venue closes mid-afternoon — the shape of a place that would run a happy hour."}'::jsonb,
  'http://arthursminisuper.co.za/', '2026-08-24', 'low'::confidence_level,
  'pending'::review_status, 'Speculative. Phone 072 154 3308 and ask whether the Mini Bar runs anything. Reject if not.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000042', null,
  '{"restaurant":"La Parada — V&A Waterfront","street_address":"Shop 18, Alfred Mall, V&A Waterfront","title":"Two-for-one beer and wine at happy hour, weekdays","note":"The V&A tenant page confirms the offer and the weekdays but prints no times at all, and La Parada''s own site is robots-disallowed. A happy hour with no hours is not a listing."}'::jsonb,
  'https://www.waterfront.co.za/eat-and-drink/la-parada', '2026-08-25', 'high'::confidence_level,
  'pending'::review_status, 'Phone 021 141 2987 and ask for the happy-hour window. Everything else is already confirmed, so this is one question away from publishable.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000043', null,
  '{"restaurant":"COY Restaurant","street_address":"Shop 151, Scherwyn Pavilion, South Arm, V&A Waterfront","title":"The COY EDIT — all-day curated selection","note":"A curated all-day list the venue says is better value than the a la carte, running 12:00-20:30. No price is published on the V&A page and coyrestaurant.com is robots-disallowed."}'::jsonb,
  'https://www.waterfront.co.za/eat-and-drink/coy-restaurant', '2026-08-25', 'medium'::confidence_level,
  'pending'::review_status, 'Phone 021 207 3278 for the price. Without one there is nothing to put in the orange.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000044', null,
  '{"restaurant":"TANG — V&A Waterfront","street_address":"Shop 153, Victoria Wharf, V&A Waterfront","title":"Winter set menu for one or two","note":"Confirmed on the V&A tenant page with a 1 Jun - 31 Aug run, but no price anywhere and tanghospitality.com is robots-disallowed."}'::jsonb,
  'https://www.waterfront.co.za/eat-and-drink/tang', '2026-08-25', 'medium'::confidence_level,
  'pending'::review_status, 'Phone 076 652 8972. Expires 31 August, so it may not be worth the call now.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000045', null,
  '{"restaurant":"Harbour House — V&A Waterfront","street_address":"9 Breakwater Boulevard, V&A Waterfront","title":"Winter Affair, three courses for R600, weekdays","price":600,"note":"FoodBlog Cape Town, dated 14 July 2026, describes a weekday three-course winter menu at R600. Not on the V&A tenant page, and harbourhouse.co.za is robots-disallowed, so there is no first-party confirmation."}'::jsonb,
  'https://www.food-blog.co.za/where-to-find-the-best-winter-food-drink-specials-at-the-va-waterfront-this-winter-season/', '2026-08-25', 'medium'::confidence_level,
  'pending'::review_status, 'Phone 021 418 4744. A well-known venue and a real price, but one third-party source is not enough on its own.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000046', null,
  '{"restaurant":"Cabo Beach Club","street_address":"South Arm Road, V&A Waterfront","title":"Pizza and a Heineken for R215, midweek","price":215,"note":"FoodBlog Cape Town, 14 July 2026. Neither the V&A tenant page nor the venue''s own site mentions it."}'::jsonb,
  'https://www.food-blog.co.za/where-to-find-the-best-winter-food-drink-specials-at-the-va-waterfront-this-winter-season/', '2026-08-25', 'medium'::confidence_level,
  'pending'::review_status, 'Phone 021 137 5401. Closed Mondays, so the offer is Tuesday to Thursday if it is real.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000047', null,
  '{"restaurant":"Ginja at the Victoria & Alfred Hotel","street_address":"Victoria & Alfred Hotel, Pierhead, V&A Waterfront","title":"Sunday brunch, R450 per person, 12:00-16:00","price":450,"note":"FoodBlog Cape Town, 14 July 2026. The V&A tenant page for Ginja lists no offers at all."}'::jsonb,
  'https://www.food-blog.co.za/where-to-find-the-best-winter-food-drink-specials-at-the-va-waterfront-this-winter-season/', '2026-08-25', 'medium'::confidence_level,
  'pending'::review_status, 'Phone 021 419 6677. A weekly Sunday fixture would be a good listing if confirmed.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000048', null,
  '{"restaurant":"Mozambik — V&A Waterfront","street_address":"Shop 8, Victoria Wharf, V&A Waterfront","title":"Wednesday prawns R99, Monday kids eat free, Thursday date night","note":"Three offers on the chain''s V&A promotions page with no dates and no expiry at all. Exactly the pattern the brief warns about: an old recurring offer that may or may not still run."}'::jsonb,
  'https://www.waterfront.co.za/offers/mozambik-promotions/', '2026-08-25', 'low'::confidence_level,
  'pending'::review_status, 'Phone 021 023 0345 and confirm all three still run before publishing any of them.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000049', null,
  '{"restaurant":"Mantra Cafe","street_address":"43 Victoria Road, Camps Bay","title":"Winter set menu, R395 two courses or R450 three, less 20%","price":395,"note":"First-party and current, running to 31 August. Held back on one conflict: the venue''s own page says the set menu is for groups of ten or more, while Dineplan''s winter round-up does not mention any group minimum. A ten-person minimum changes the offer entirely."}'::jsonb,
  'https://www.mantracafe.co.za/winter-set-menu', '2026-08-25', 'high'::confidence_level,
  'pending'::review_status, 'Phone 065 823 3901 and ask one question: is there a group minimum. If not, publish immediately.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000004a', null,
  '{"restaurant":"Dizzy''s Camps Bay","street_address":"41 The Drive, Camps Bay","title":"Daily happy hour, 4pm to 7pm","note":"The venue''s own site states a daily 16:00-19:00 happy hour but never says which drinks or how much off. Cape Town Magazine has pricing but its page is dated March 2018."}'::jsonb,
  'https://dizzyscampsbay.co.za/', '2026-08-25', 'medium'::confidence_level,
  'pending'::review_status, 'Phone 021 438 2686 for the actual discount. A daily happy hour in Camps Bay is worth having.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000004b', null,
  '{"restaurant":"The Waterside and PIER (La Colombe)","street_address":"Pierhead, V&A Waterfront","title":"Winter set menus, R795 and R995","note":"Both confirmed on the V&A tenant pages. Not published because of a data question on our side: we already list a venue called The Waterside at 55 Shortmarket Street in the City Centre, and it is not clear whether that is a different restaurant or our own address error."}'::jsonb,
  'https://www.waterfront.co.za/eat-and-drink/the-waterside', '2026-08-25', 'high'::confidence_level,
  'pending'::review_status, 'Resolve the existing The Waterside entry first. If our City Centre address is wrong, correct it rather than adding a second venue.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000004c', null,
  '{"restaurant":"La Boheme Wine Bar and Bistro","street_address":"341 Main Road, Sea Point","title":"Three tapas for R305","days_of_week":[1,2,3,4,5,6],"note":"Dineplan shows the offer running 15 June to 1 November, but with no year on the window and a \"last confirmed\" date of 21 September 2025. Inside Guide advertises the same offer at R285, which we could not open to check. Two prices, no current confirmation."}'::jsonb,
  'https://www.dineplan.com/restaurants/la-boheme-wine-bar-and-bistro', '2026-08-26', 'medium'::confidence_level,
  'pending'::review_status, 'A year-old confirmation is too old to publish. Phone the venue and settle the price. Would be a new Sea Point listing if it holds.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000004d', null,
  '{"restaurant":"Zest Restaurant, Newkings Boutique Hotel","street_address":"94 Regent Road, Sea Point","title":"Four-course winter warmer lunch menu","note":"On the venue’s own menu page, described as exclusive to the winter months. No price, no days, no times and no end date anywhere on the page."}'::jsonb,
  'https://zestcapetown.co.za/menus/', '2026-08-26', 'medium'::confidence_level,
  'pending'::review_status, 'Official but unpriced, and winter ends in days. Phone 021 010 7010 for the price and whether it survives into spring.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000004e', null,
  '{"restaurant":"The Press Bar and Grill","street_address":"299 Main Road, Sea Point","title":"Friday buffet and a Wednesday speciality burger","days_of_week":[3,5],"note":"Both named on the venue’s own menu page with no price, no time and no dates. The site says current promotions are announced on its Instagram account, which we do not read."}'::jsonb,
  'https://www.thepressbar.co.za/menu', '2026-08-26', 'low'::confidence_level,
  'pending'::review_status, 'Kosher restaurant. Needs a phone call for prices and times before it can be listed.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-00000000004f', null,
  '{"restaurant":"Sonny and Irene","street_address":"Ground Floor, Station House, 19 Kloof Road, Sea Point","title":"Chef''s winter specialities","note":"Confirmed on the Kove Collection site and valid to the end of September 2026, but the page publishes no prices at all — breakfast items served until 11:30am, plus lunch and dinner specialities."}'::jsonb,
  'https://www.kovecollection.co.za/sonny-and-irene/', '2026-08-26', 'high'::confidence_level,
  'pending'::review_status, 'Sister venue to The Nines, one floor down. Official and current, so this only needs prices. Phone 021 745 6600.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000050', null,
  '{"restaurant":"Scheckter''s RAW, Vagabond Kitchens Sea Point, The Bistro on the Promenade","street_address":"Sea Point","title":"Venue status problems found during the 26 August sweep","note":"Not offers — data hygiene. schecktersraw.com now redirects to an unrelated gambling domain, so never link it. Vagabond Kitchens no longer lists its Sea Point branch on its own site, though the old branch page still resolves. The Bistro on the Promenade has been rebranded KOKO Kitchen by the hotel that runs it."}'::jsonb,
  'https://www.hotelonthepromenade.com/pages/the-bistro/', '2026-08-26', 'high'::confidence_level,
  'pending'::review_status, 'None of the three is currently in our data. Worth keeping on file so a future sweep does not add a dead venue or a hijacked link.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000051', null,
  '{"restaurant":"Gypsy Rabbit","street_address":"110 Bree Street, Cape Town City Centre","title":"All-day prego special — chicken R140, beef R155, each with a Corona","note":"From a TikTok caption on the venue’s own account. The video id dates it to roughly March 2025, about eighteen months old, and nothing newer confirms it. Cape Town Magazine also mentions boerewors-roll and draught specials, and specials on First Thursdays, but publishes no price, day or time for any of them."}'::jsonb,
  'https://www.capetownmagazine.com/bree-street', '2026-08-26', 'low'::confidence_level,
  'pending'::review_status, 'Address is in scope. gypsyrabbit.co.za loads an empty JavaScript shell and there is no Dineplan page, so there is no readable official source at all. Two Instagram handles appear in the wild, @gypsyrabbitcpt and @gypsyrabbitct — settle which is real before adding it to the sweep. Phone 062 882 7593.'
) on conflict (id) do nothing;

insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (
  'c3000000-0000-4000-8000-000000000052', null,
  '{"restaurant":"Souk","street_address":"163 Long Street, Cape Town City Centre","title":"Menus never read — possible happy hour unseen","note":"Cocktail-led bar trading Wednesday to Sunday, 6pm to 2am, at the same address as Chicks and Chops. The official site has no specials on the pages that loaded, but soukcpt.com/menu rate-limited on every attempt, and a bar of this kind documents a happy hour on its drinks menu if it has one."}'::jsonb,
  'https://www.soukcpt.com/visit-us', '2026-08-26', 'medium'::confidence_level,
  'pending'::review_status, 'Not an offer — an unread source. Re-fetch soukcpt.com/menu once it stops rate-limiting. Phone 060 682 6894 per the official site; an old EatOut listing says 021 422 1300, which is from a 2018 menu update and should be ignored.'
) on conflict (id) do nothing;

commit;
