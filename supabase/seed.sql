-- ============================================================================
-- CPT Deals — verified seed data
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
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000002', 'Hudsons The Burger Joint — Kloof Street', 'hudsons-kloof-street', 'Burger and pizza restaurant on Kloof Street with a fireplace, outdoor seating and live sport.', array['Burgers', 'Pizza', 'Bar']::text[],
  '22 Kloof Street', 'Gardens', null, null, '+27214265974',
  'https://www.theburgerjoint.co.za', 'https://www.dineplan.com/restaurants/hudsons-kloof-street', 'https://www.instagram.com/hudsonsburgers/', null,
  'https://www.google.com/maps/search/?api=1&query=Hudsons%20The%20Burger%20Joint%20Kloof%20Street%2C%2022%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-20'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000003', 'Our Local — Kloof Street', 'our-local-kloof-street', 'All-day neighbourhood café and bakery on Kloof Street, serving breakfast and lunch daily and dinner from Thursday to Saturday.', array['Café', 'Bakery', 'Bistro']::text[],
  '117 Kloof Street', 'Gardens', null, null, '+27646425004',
  'https://ourlocal.co.za', 'https://account.dineplan.com/widgetframe/K1zRjn6V', null, null,
  'https://www.google.com/maps/search/?api=1&query=Our%20Local%20Kloof%20Street%2C%20117%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-20'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000004', 'Maru Korean Steakhouse', 'maru-korean-steakhouse', 'Korean steakhouse on Bree Street, grilling grass-fed and Wagyu beef at the table.', array['Korean', 'Steakhouse', 'Bar']::text[],
  '107 Bree Street', 'Cape Town City Centre', null, null, null,
  'https://www.restaurants.co.za/maru-korean-steakhouse', null, null, null,
  'https://www.google.com/maps/search/?api=1&query=Maru%20Korean%20Steakhouse%2C%20107%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000005', 'Florentin', 'florentin', 'Mediterranean café and bar on Bree Street, open from breakfast through to dinner.', array['Mediterranean', 'Café', 'Bar']::text[],
  'Bree Street', 'Cape Town City Centre', null, null, null,
  'https://www.dineplan.com/restaurants/florentin', 'https://www.dineplan.com/restaurants/florentin', null, null,
  'https://www.google.com/maps/search/?api=1&query=Florentin%2C%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000006', 'The Hussar Grill — Camps Bay', 'hussar-grill-camps-bay', 'Long-standing South African grill house, on the Camps Bay beachfront since 1964.', array['Steakhouse', 'Grill']::text[],
  'Victoria Road', 'Camps Bay', null, null, null,
  'https://hussargrill.co.za/', null, null, null,
  'https://www.google.com/maps/search/?api=1&query=The%20Hussar%20Grill%20Camps%20Bay%2C%20Victoria%20Road%2C%20Camps%20Bay%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000007', 'The Hussar Grill — Mouille Point', 'hussar-grill-mouille-point', 'The Mouille Point branch of the Hussar Grill, a block from the promenade.', array['Steakhouse', 'Grill']::text[],
  'Beach Road', 'Mouille Point', null, null, null,
  'https://hussargrill.co.za/', null, null, null,
  'https://www.google.com/maps/search/?api=1&query=The%20Hussar%20Grill%20Mouille%20Point%2C%20Beach%20Road%2C%20Mouille%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000008', 'The Nines', 'the-nines', 'Sea Point restaurant and bar with a seafood-leaning menu and live jazz Sundays.', array['Restaurant', 'Bar', 'Seafood']::text[],
  'Main Road', 'Sea Point', null, null, null,
  'https://www.restaurants.co.za/the-nines', null, null, null,
  'https://www.google.com/maps/search/?api=1&query=The%20Nines%2C%20Main%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000009', 'Our Local — Sea Point', 'our-local-sea-point', 'The Sea Point branch of the all-day café and bakery, with dinner Thursday to Saturday.', array['Café', 'Bakery', 'Bistro']::text[],
  '295 Main Road', 'Sea Point', null, null, '+27696653996',
  'https://ourlocal.co.za', 'https://account.dineplan.com/widgetframe/5m0YgX1y', null, null,
  'https://www.google.com/maps/search/?api=1&query=Our%20Local%20Sea%20Point%2C%20295%20Main%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000000a', 'Club Kloof', 'club-kloof', 'Bar and grill at the top of Kloof Street, known for steak and frites.', array['Bar', 'Grill']::text[],
  '84 Kloof Street', 'Tamboerskloof', null, null, null,
  'https://www.dineplan.com/restaurants/club-kloof', 'https://www.dineplan.com/restaurants/club-kloof', null, null,
  'https://www.google.com/maps/search/?api=1&query=Club%20Kloof%2C%2084%20Kloof%20Street%2C%20Tamboerskloof%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000000b', 'Café Extrablatt', 'cafe-extrablatt', 'Double-storey German café and bar near the stadium, open from breakfast until late.', array['Café', 'Bar', 'German', 'Pizza']::text[],
  '79 Main Road', 'Green Point', null, null, '+27214343759',
  'https://www.cafe-extrablatt.co.za/', 'https://www.dineplan.com/restaurants/cafe-extrablatt', 'https://www.instagram.com/extrablatt_cpt/', null,
  'https://www.google.com/maps/search/?api=1&query=Caf%C3%A9%20Extrablatt%2C%2079%20Main%20Road%2C%20Green%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000000c', 'The Woodlands Eatery', 'the-woodlands-eatery', 'Italian pizzeria and trattoria on a quiet Oranjezicht corner, run by two Italian owners since 2017.', array['Italian', 'Pizza', 'Pasta']::text[],
  '8 Breda Street', 'Oranjezicht', null, null, '+27637104742',
  'https://thewoodlandseatery.com/', 'https://www.dineplan.com/restaurants/the-woodlands-eatery', 'https://www.instagram.com/the_woodlands_eatery/', 'https://www.facebook.com/woodlandseatery/',
  'https://www.google.com/maps/search/?api=1&query=The%20Woodlands%20Eatery%2C%208%20Breda%20Street%2C%20Oranjezicht%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000000d', 'Burger & Lobster', 'burger-and-lobster', 'The Cape Town branch of the London burger and lobster house, on Bree Street.', array['Burgers', 'Seafood']::text[],
  '105 Bree Street', 'Cape Town City Centre', null, null, null,
  'https://burgerandlobster.co.za/', null, null, null,
  'https://www.google.com/maps/search/?api=1&query=Burger%20%26%20Lobster%20Cape%20Town%2C%20105%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000000e', 'Flirt Mexican Restaurant', 'flirt-mexican', 'Mexican restaurant and cocktail bar on Church Street, with a DJ at the weekend.', array['Mexican', 'Cocktails', 'Bar']::text[],
  '75 Church Street', 'Cape Town City Centre', null, null, null,
  'https://flirtcpt.co.za/', null, null, null,
  'https://www.google.com/maps/search/?api=1&query=Flirt%20Mexican%20Restaurant%2C%2075%20Church%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-21'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000000f', 'fable cocktail bar', 'fable-cocktail-bar', 'Cocktail bar on the corner of Bree and Wale, with a daily happy hour and a daytime sandwich-and-pie menu on the days it opens at noon.', array['Cocktails', 'Bar', 'Small plates']::text[],
  'Corner Bree Street and Wale Street', 'Cape Town City Centre', null, null, '+27660097786',
  'https://fablecocktailbar.capetown/', 'https://www.dineplan.com/restaurants/fable-cocktail-bar', 'https://www.instagram.com/fablecpt/', 'https://www.facebook.com/fablecpt',
  'https://www.google.com/maps/search/?api=1&query=fable%20cocktail%20bar%2C%20Corner%20Bree%20and%20Wale%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000010', 'Amura at Mount Nelson', 'amura-mount-nelson', 'Restaurant at the Mount Nelson Hotel on Orange Street, serving a seasonal four-course menu.', array['Fine dining', 'Hotel restaurant']::text[],
  '76 Orange Street', 'Gardens', null, null, null,
  null, 'https://www.dineplan.com/restaurants/amura', null, null,
  'https://www.google.com/maps/search/?api=1&query=Amura%20at%20Mount%20Nelson%2C%2076%20Orange%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000011', 'Copa Restaurant', 'copa-restaurant', 'Restaurant at the Pepperclub Hotel on Loop Street.', array['Restaurant', 'Hotel restaurant']::text[],
  '167 Loop Street, Pepperclub Hotel', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/copa', null, null,
  'https://www.google.com/maps/search/?api=1&query=Copa%20Restaurant%2C%20167%20Loop%20Street%2C%20Pepperclub%20Hotel%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000012', 'FYN Restaurant', 'fyn-restaurant', 'Fine-dining restaurant on Parliament Street pairing South African produce with Japanese technique.', array['Fine dining', 'Japanese', 'Tasting menu']::text[],
  '37 Parliament Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/fyn', null, null,
  'https://www.google.com/maps/search/?api=1&query=FYN%20Restaurant%2C%2037%20Parliament%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000013', 'Hacienda', 'hacienda-bree', 'Mexican Baja Californian kitchen and bar on Bree Street.', array['Mexican', 'Bar', 'Sharing plates']::text[],
  '92 Bree Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/hacienda', null, null,
  'https://www.google.com/maps/search/?api=1&query=Hacienda%2C%2092%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000014', 'Iron Steak and Bar', 'iron-steak-and-bar', 'Steakhouse and bar on Bree Street.', array['Steakhouse', 'Bar']::text[],
  '114 Bree Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/iron-steak-and-bar', null, null,
  'https://www.google.com/maps/search/?api=1&query=Iron%20Steak%20and%20Bar%2C%20114%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000015', 'Mint Restaurant at Taj Cape Town', 'mint-taj-cape-town', 'Restaurant at the Taj hotel on Wale Street, with a menu that changes destination monthly.', array['Restaurant', 'Hotel restaurant']::text[],
  '1 Wale Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/mint', null, null,
  'https://www.google.com/maps/search/?api=1&query=Mint%20Restaurant%20at%20Taj%20Cape%20Town%2C%201%20Wale%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000016', 'Nikkei Japanese Peruvian', 'nikkei-japanese-peruvian', 'Japanese-Peruvian restaurant on Bree Street.', array['Japanese', 'Peruvian', 'Sushi']::text[],
  '87 Bree Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/nikkei', null, null,
  'https://www.google.com/maps/search/?api=1&query=Nikkei%20Japanese%20Peruvian%2C%2087%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000017', 'The Waterside', 'the-waterside', 'Five-course tasting restaurant on Shortmarket Street.', array['Fine dining', 'Tasting menu']::text[],
  '55 Shortmarket Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/the-waterside', null, null,
  'https://www.google.com/maps/search/?api=1&query=The%20Waterside%2C%2055%20Shortmarket%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000018', 'The Wes Bistro and Bar', 'the-wes-bistro-and-bar', 'Bistro and bar on Shortmarket Street.', array['Bistro', 'Bar']::text[],
  '55 Shortmarket Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/the-wes', null, null,
  'https://www.google.com/maps/search/?api=1&query=The%20Wes%20Bistro%20and%20Bar%2C%2055%20Shortmarket%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000019', 'Yatai Japanese', 'yatai-japanese', 'Japanese restaurant on Bree Street serving a curated sharing menu.', array['Japanese', 'Sharing plates']::text[],
  '87 Bree Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/yatai', null, null,
  'https://www.google.com/maps/search/?api=1&query=Yatai%20Japanese%2C%2087%20Bree%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000001a', 'Grand Pavilion', 'grand-pavilion', 'Restaurant on the Sea Point promenade.', array['Restaurant', 'Seaside']::text[],
  '277 Beach Road', 'Sea Point', null, null, null,
  null, 'https://www.dineplan.com/restaurants/grand-pavilion', null, null,
  'https://www.google.com/maps/search/?api=1&query=Grand%20Pavilion%2C%20277%20Beach%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000001b', 'The President Hotel', 'the-president-hotel', 'Hotel restaurant on Alexander Road in Sea Point, running a paired dinner on Thursdays.', array['Hotel restaurant', 'Wine pairing']::text[],
  'S4 Alexander Road', 'Sea Point', null, null, null,
  null, 'https://www.dineplan.com/restaurants/the-president-hotel', null, null,
  'https://www.google.com/maps/search/?api=1&query=The%20President%20Hotel%2C%20S4%20Alexander%20Road%2C%20Sea%20Point%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000001c', 'Harry''s Beach', 'harrys-beach', 'Beachfront restaurant on Victoria Road in Camps Bay.', array['Restaurant', 'Seaside']::text[],
  '41 Victoria Road', 'Camps Bay', null, null, null,
  null, 'https://www.dineplan.com/restaurants/harrys-beach', null, null,
  'https://www.google.com/maps/search/?api=1&query=Harry''s%20Beach%2C%2041%20Victoria%20Road%2C%20Camps%20Bay%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000001d', 'Harbour House Camps Bay', 'harbour-house-camps-bay', 'Seafood restaurant on the Camps Bay promenade.', array['Seafood', 'Restaurant']::text[],
  '87 Victoria Road, The Promenade', 'Camps Bay', null, null, null,
  null, 'https://www.dineplan.com/restaurants/harbour-house-camps-bay', null, null,
  'https://www.google.com/maps/search/?api=1&query=Harbour%20House%20Camps%20Bay%2C%2087%20Victoria%20Road%2C%20The%20Promenade%2C%20Camps%20Bay%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000001e', 'Salsify at the Roundhouse', 'salsify-at-the-roundhouse', 'Fine-dining restaurant in the historic Round House above Camps Bay.', array['Fine dining', 'Tasting menu']::text[],
  'Round House Road, Kloof Road', 'Camps Bay', null, null, null,
  null, 'https://www.dineplan.com/restaurants/salsify-at-the-roundhouse', null, null,
  'https://www.google.com/maps/search/?api=1&query=Salsify%20at%20the%20Roundhouse%2C%20Round%20House%20Road%2C%20Kloof%20Road%2C%20Camps%20Bay%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-22'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-00000000001f', 'Rita''s Cocktail Club', 'ritas-cocktail-club', 'Rooftop tequila and cocktail bar on Kloof Street, with small plates and a daily social hour.', array['Cocktails', 'Bar', 'Tequila', 'Small plates']::text[],
  '22 Kloof Street', 'Gardens', null, null, '+27213006695',
  'https://www.ritascocktailclub.com/', 'https://account.dineplan.com/widgetframe/lg0VXhdN', 'https://www.instagram.com/ritascocktailclub/', null,
  'https://www.google.com/maps/search/?api=1&query=Rita''s%20Cocktail%20Club%2C%2022%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000020', 'Kloof Street House', 'kloof-street-house', 'Victorian house on Kloof Street with a garden, several dining rooms and live jazz over Sunday lunch.', array['Restaurant', 'Bar', 'Live music']::text[],
  '30 Kloof Street', 'Gardens', null, null, '+27214234413',
  'https://www.kloofstreethouse.co.za/', 'https://www.kloofstreethouse.co.za/reservations/', 'https://www.instagram.com/kloofstreethouse/', null,
  'https://www.google.com/maps/search/?api=1&query=Kloof%20Street%20House%2C%2030%20Kloof%20Street%2C%20Gardens%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do nothing;

insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (
  'a1000000-0000-4000-8000-000000000021', 'The Village Idiot', 'the-village-idiot', 'Pub and party bar on Loop Street, with DJs midweek and a different food-and-drink offer most nights.', array['Bar', 'Pub', 'Pizza', 'Live DJ']::text[],
  '32 Loop Street', 'Cape Town City Centre', null, null, null,
  null, 'https://www.dineplan.com/restaurants/the-village-idiot', 'https://www.instagram.com/thevillageidiotct/', null,
  'https://www.google.com/maps/search/?api=1&query=The%20Village%20Idiot%2C%2032%20Loop%20Street%2C%20Cape%20Town%20City%20Centre%2C%20Cape%20Town%2C%20South%20Africa', null, true, '2026-08-23'
) on conflict (id) do nothing;

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
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000002', 'a1000000-0000-4000-8000-000000000001', 'Golden Hour',
  'The happy-hour prices on cocktails and Woodstock craft beers run again from 10pm until midnight.',
  null, null, 'happy_hour'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], '22:00', '00:00',
  null, null, null, false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000003', 'a1000000-0000-4000-8000-000000000001', 'Two-for-one burgers',
  'Buy one burger and get a second free — the deal covers the whole burger menu.',
  null, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, null, 'Applies to every burger on the menu, all day.', false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000004', 'a1000000-0000-4000-8000-000000000001', 'Two margaritas for R100',
  'A pair of margaritas made with El Jimador Blanco tequila, all day Wednesday.',
  100, null, 'drinks'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, null, null, false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000005', 'a1000000-0000-4000-8000-000000000001', 'Tajine and wine Thursday',
  'Order any Moroccan tajine and a complimentary carafe of Cederberg Merlot Shiraz blend comes with it.',
  null, null, 'dinner'::special_category, '{}',
  array[4]::smallint[], null, null,
  null, null, 'The tajine is charged at menu price; the wine carafe is included.', false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000006', 'a1000000-0000-4000-8000-000000000001', 'Sunday lamb roast',
  'Moroccan-spiced roast leg of lamb served as a Sunday roast.',
  185, null, 'lunch'::special_category, '{}',
  array[7]::smallint[], null, null,
  null, null, 'Booking essential.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/ricks-cafe-americain', 'booking_page'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000007', 'a1000000-0000-4000-8000-000000000001', 'Lazy Sunday afternoon',
  'Order a tapas or mezze platter to share and two glasses of Pierre Jourdan Brut Cap Classique are included.',
  null, null, 'food'::special_category, array['vegetarian']::dietary_tag[],
  array[7]::smallint[], '15:00', '19:00',
  null, null, 'Platter charged at menu price; two glasses of Cap Classique included.', false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000008', 'a1000000-0000-4000-8000-000000000001', 'Winter brandy special — two doubles for R90',
  'Two double brandy and Cokes at a set price, all winter, all day long.',
  90, null, 'drinks'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, null, false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000009', 'a1000000-0000-4000-8000-000000000001', 'Glühwein for R45',
  'Spiced mulled wine, poured through the winter months.',
  45, null, 'drinks'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'Listed as a winter offer; confirm availability once the season turns.', false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000010', 'a1000000-0000-4000-8000-000000000001', 'Two Aperol Spritz for R175',
  'A Women''s Month offer on Aperol Spritz, running through August.',
  175, null, 'drinks'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'Advertised as a Women''s Month promotion for August 2026.', false,
  'unknown'::holiday_status, 'https://rickscafe.co.za/specials', 'official_website'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000011', 'a1000000-0000-4000-8000-000000000002', 'Meat-free Monday',
  'Plant-based burgers are half price all day on Mondays.',
  null, null, 'food'::special_category, array['vegetarian', 'vegan']::dietary_tag[],
  array[1]::smallint[], null, null,
  null, '2029-02-21', 'Dine-in only.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/hudsons-kloof-street', 'booking_page'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000012', 'a1000000-0000-4000-8000-000000000002', 'Two-for-one pizzas — Pizza Two''sday',
  'Buy one pizza and a second comes free, all day Tuesday.',
  null, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, '2026-09-30', 'Dine-in only.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/hudsons-kloof-street', 'booking_page'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000013', 'a1000000-0000-4000-8000-000000000002', 'Happy hour — 30% off',
  'Thirty percent off cocktails, draught beer, starters and selected wines by the glass on weekday evenings.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], '16:30', '18:30',
  null, '2027-04-21', 'Dine-in only.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/restaurants/hudsons-kloof-street', 'booking_page'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000014', 'a1000000-0000-4000-8000-000000000002', 'Linger Longer — 40% off cocktails',
  'Forty percent off the speciality cocktail list late in the evening, every night.',
  null, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '21:00', '23:00',
  null, null, 'Dine-in only.', false,
  'unknown'::holiday_status, 'https://www.theburgerjoint.co.za/specials', 'official_website'::source_type,
  null, '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000015', 'a1000000-0000-4000-8000-000000000003', 'Winter dinner set menu',
  'A two- or three-course winter set menu served from late afternoon, Thursday to Saturday.',
  225, null, 'dinner'::special_category, '{}',
  array[4, 5, 6]::smallint[], '16:00', '23:00',
  null, null, 'R225 for two courses, R295 for three. Listed as a winter offer with no published end date — confirm when booking.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'publication'::source_type,
  '2026-07-23', '2026-08-20', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000016', 'a1000000-0000-4000-8000-000000000004', 'Magic Hour — half-price drinks',
  'Fifty percent off selected sparkling wine, beer and wine by the glass, every afternoon.',
  null, null, 'happy_hour'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], '16:00', '17:30',
  null, '2027-01-31', null, false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/cape-town-central', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000017', 'a1000000-0000-4000-8000-000000000004', 'Winter set menu',
  'A sharing set menu of the kitchen’s Korean steakhouse standards.',
  349, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-09-30', 'Priced per person, served sharing-style.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/cape-town-central', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000018', 'a1000000-0000-4000-8000-000000000004', 'Buckets and Bubbles',
  'A Saturday-afternoon sharing menu with a complimentary glass of Prosecco.',
  399, null, 'lunch'::special_category, '{}',
  array[6]::smallint[], '12:00', '16:00',
  null, '2026-12-31', 'Priced per person, served sharing-style.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/cape-town-central', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000019', 'a1000000-0000-4000-8000-000000000005', 'Sharing experience for two',
  'A Mediterranean spread built for two people, early in the evening.',
  580, null, 'dinner'::special_category, '{}',
  array[2, 3, 4]::smallint[], '17:30', '21:00',
  null, '2026-08-28', 'R580 for two people.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/cape-town-central', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000001a', 'a1000000-0000-4000-8000-000000000005', 'Two Aperol Spritz for R180',
  'A Women’s Month offer on Aperol Spritz, running to the end of August.',
  180, null, 'drinks'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-30', 'Times vary by day: Monday to 3pm, Tuesday to Saturday to 9pm, Sunday to 2.30pm.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/cape-town-central', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000001b', 'a1000000-0000-4000-8000-000000000006', 'Tuesday date night',
  'Two or three courses for two people, with a complimentary glass of wine or a soft drink each.',
  499, null, 'dinner'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, '2026-08-31', 'R499 for two courses or R599 for three — priced per couple, evenings only.', true,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/camps-bay', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000001c', 'a1000000-0000-4000-8000-000000000006', 'Winter two-course menu',
  'Starter and main, or main and dessert, from the winter menu.',
  349, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'Priced per person. A premium red blend is offered at R60 a glass or R180 a bottle.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/camps-bay', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000001d', 'a1000000-0000-4000-8000-000000000007', 'Winter two-course menu',
  'Starter and main, or main and dessert, from the winter menu.',
  349, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'Priced per person. A premium red blend is offered at R60 a glass or R180 a bottle.', false,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/mouille-point', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000001e', 'a1000000-0000-4000-8000-000000000007', 'Tuesday date night',
  'Two or three courses for two people, with a complimentary glass of wine or a soft drink each.',
  499, null, 'dinner'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, '2026-08-31', 'R499 for two courses or R599 for three — priced per couple, evenings only.', true,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/mouille-point', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000001f', 'a1000000-0000-4000-8000-000000000008', 'Sunday lunch with live jazz',
  'A two- or three-course Sunday set menu with paired cocktails, and a jazz set through the afternoon.',
  595, null, 'lunch'::special_category, '{}',
  array[7]::smallint[], '12:00', '17:00',
  null, '2026-10-04', 'From R595 per person, rising to R995 for the fuller menu. Jazz runs 1pm to 4pm.', true,
  'unknown'::holiday_status, 'https://www.restaurants.co.za/specials/western-cape/sea-point', 'publication'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000020', 'a1000000-0000-4000-8000-000000000009', 'Winter dinner set menu',
  'A two- or three-course winter set menu served from late afternoon, Thursday to Saturday.',
  225, null, 'dinner'::special_category, '{}',
  array[4, 5, 6]::smallint[], '16:00', '23:00',
  null, null, 'R225 for two courses, R295 for three. Listed as a winter offer with no published end date — confirm when booking.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'publication'::source_type,
  '2026-07-23', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000021', 'a1000000-0000-4000-8000-00000000000a', 'Sunday steak and frites',
  'Steak and frites with a glass of wine or a mocktail, from midday on Sundays.',
  295, null, 'lunch'::special_category, '{}',
  array[7]::smallint[], '12:00', '22:00',
  null, null, 'Priced per person. Listed as a winter offer with no published end date.', true,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'publication'::source_type,
  '2026-07-23', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000022', 'a1000000-0000-4000-8000-00000000000b', 'Monday Madness — two pizzas for R277',
  'Two regular pizzas from the menu for a set price, all day Monday.',
  277, null, 'food'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, null, 'Menu pizzas only. Dine-in or collection.', false,
  'unknown'::holiday_status, 'https://www.cafe-extrablatt.co.za/', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000023', 'a1000000-0000-4000-8000-00000000000b', 'R95 weekday lunch',
  'A seasonal lunch plate at a set price, weekday afternoons.',
  95, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], '12:30', '14:00',
  null, null, 'Not available on public holidays or on Cape Town event days.', false,
  'not_valid'::holiday_status, 'https://www.cafe-extrablatt.co.za/', 'official_website'::source_type,
  null, '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000024', 'a1000000-0000-4000-8000-00000000000c', 'Pizza Monday — half price',
  'Fifty percent off any pizza on the menu, all day Monday.',
  null, null, 'food'::special_category, '{}',
  array[1]::smallint[], null, null,
  null, null, 'Photographed on the winter specials card in the restaurant, and confirmed on their own website.', false,
  'unknown'::holiday_status, 'https://thewoodlandseatery.com/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000025', 'a1000000-0000-4000-8000-00000000000c', 'Sip and Supper Tuesday — a drink on the house',
  'A glass of wine or a 500ml draught beer comes free with your main course on Tuesdays.',
  null, null, 'dinner'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, null, 'One drink per main course. Photographed in the restaurant and confirmed on their website.', false,
  'unknown'::holiday_status, 'https://thewoodlandseatery.com/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000026', 'a1000000-0000-4000-8000-00000000000c', 'Pasta Wednesday — half price',
  'Fifty percent off any pasta on the menu, all day Wednesday.',
  null, null, 'food'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, null, 'Photographed in the restaurant and confirmed on their website.', false,
  'unknown'::holiday_status, 'https://thewoodlandseatery.com/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000027', 'a1000000-0000-4000-8000-00000000000c', 'Meaty Thursday — half price',
  'Fifty percent off any meat dish on the menu, all day Thursday.',
  null, null, 'food'::special_category, '{}',
  array[4]::smallint[], null, null,
  null, null, 'Photographed in the restaurant and confirmed on their website.', false,
  'unknown'::holiday_status, 'https://thewoodlandseatery.com/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000028', 'a1000000-0000-4000-8000-00000000000d', 'The 99 Smash',
  'An Oklahoma onion smash burger for R99, from midday every Thursday.',
  99, null, 'food'::special_category, '{}',
  array[4]::smallint[], '12:00', '22:00',
  null, null, 'Limited number each day — when they are gone, they are gone. Photographed on the table card.', false,
  'unknown'::holiday_status, 'https://burgerandlobster.co.za/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000029', 'a1000000-0000-4000-8000-00000000000e', 'Two pastas for R195',
  'Two pasta dishes for a set price on Tuesdays.',
  195, null, 'food'::special_category, '{}',
  array[2]::smallint[], null, null,
  null, null, 'Terms and conditions apply. Photographed on the weekly specials card in the restaurant.', false,
  'unknown'::holiday_status, 'https://flirtcpt.co.za/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000002a', 'a1000000-0000-4000-8000-00000000000e', 'Two tacos for R180',
  'Two tacos for a set price on Wednesdays.',
  180, null, 'food'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, null, 'Terms and conditions apply. Photographed on the weekly specials card.', false,
  'unknown'::holiday_status, 'https://flirtcpt.co.za/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000002b', 'a1000000-0000-4000-8000-00000000000e', 'Half-price cocktails',
  'Every cocktail at half price on Thursdays.',
  null, null, 'drinks'::special_category, '{}',
  array[4]::smallint[], null, null,
  null, null, 'Terms and conditions apply. Photographed on the weekly specials card.', false,
  'unknown'::holiday_status, 'https://flirtcpt.co.za/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000002c', 'a1000000-0000-4000-8000-00000000000e', 'Two burgers for R195, with a DJ',
  'Two burgers for a set price on Saturdays, with a DJ playing.',
  195, null, 'food'::special_category, '{}',
  array[6]::smallint[], null, null,
  null, null, 'Terms and conditions apply. Photographed on the weekly specials card.', false,
  'unknown'::holiday_status, 'https://flirtcpt.co.za/', 'in_person'::source_type,
  '2026-08-21', '2026-08-21', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000002d', 'a1000000-0000-4000-8000-00000000000f', 'Happy hour',
  'Selected food and drinks from the menu at reduced prices, early evening, every day the bar is open.',
  null, null, 'happy_hour'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], '17:00', '19:00',
  null, null, 'Selected items only. The bar does not publish which items, or the reduced prices.', false,
  'unknown'::holiday_status, 'https://fablecocktailbar.capetown/', 'official_website'::source_type,
  '2026-07-25', '2026-08-22', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000002e', 'a1000000-0000-4000-8000-00000000000f', 'Women''s Wednesdays',
  'Half price on all classic cocktails for women, mid-evening on Wednesdays.',
  null, null, 'drinks'::special_category, '{}',
  array[3]::smallint[], '19:00', '22:00',
  null, null, 'The bar states this offer applies to women.', false,
  'unknown'::holiday_status, 'https://fablecocktailbar.capetown/', 'official_website'::source_type,
  '2026-07-25', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000002f', 'a1000000-0000-4000-8000-00000000000f', 'Fable Fix',
  'Any sandwich or pie from the daytime menu, with a daytime drink.',
  150, null, 'lunch'::special_category, '{}',
  array[5, 6]::smallint[], '12:00', '16:00',
  null, null, 'Advertised for 12pm to 4pm. The bar opens at noon on Friday and Saturday only, so those are the days it can run.', false,
  'unknown'::holiday_status, 'https://fablecocktailbar.capetown/', 'official_website'::source_type,
  '2026-07-25', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000030', 'a1000000-0000-4000-8000-00000000000f', 'Winter Warmer',
  'Creamy roasted tomato soup with a four-cheese toastie.',
  120, null, 'lunch'::special_category, '{}',
  array[5, 6]::smallint[], '12:00', '16:00',
  null, null, 'Advertised for 12pm to 4pm; the bar opens at noon on Friday and Saturday only. No end date is published - being a winter dish, confirm before relying on it in spring.', false,
  'unknown'::holiday_status, 'https://fablecocktailbar.capetown/', 'official_website'::source_type,
  '2026-07-25', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000031', 'a1000000-0000-4000-8000-000000000010', 'Four-course winter menu',
  'Four courses from the winter menu at the Mount Nelson.',
  750, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R750 per person. Served at dinner every day, and at lunch Friday to Sunday. Dineplan lists it as running through August and September; no exact end date is published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000032', 'a1000000-0000-4000-8000-000000000011', 'Three-course winter menu',
  'Three courses from the winter menu at the Pepperclub.',
  445, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R445 per person, from midday daily. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000033', 'a1000000-0000-4000-8000-000000000012', 'Five-course lunch tasting menu',
  'A five-course tasting menu at lunch.',
  1275, null, 'lunch'::special_category, '{}',
  array[2, 3, 4, 5, 6]::smallint[], null, null,
  null, null, 'R1275 per person, from midday. Advertised as a winter menu with no end date published. Booking strongly advised.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000034', 'a1000000-0000-4000-8000-000000000013', 'Sharing winter menu',
  'A Baja Californian sharing menu built for the table.',
  349, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R349 per person, all day. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000035', 'a1000000-0000-4000-8000-000000000014', '200g flat iron steak with salad',
  'A 200g flat iron steak served with a salad.',
  265, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R265 per person. Advertised as a winter offer with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000036', 'a1000000-0000-4000-8000-000000000015', 'Three-course menu with a Port',
  'Three courses, with a complimentary glass of Port. The menu changes destination each month.',
  595, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, '2026-08-31', 'R595 per person, from midday daily. Dineplan lists this as running through August.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000037', 'a1000000-0000-4000-8000-000000000016', 'Winter bento box',
  'A bento box from the Japanese-Peruvian menu, served per person rather than to share.',
  349, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R349 per person. Not a sharing menu. Advertised as a winter offer with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000038', 'a1000000-0000-4000-8000-000000000017', 'Five-course lunch or dinner',
  'Five courses, opening with a bread stack, with prawn toast among the signatures.',
  795, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R795 per person, from midday for lunch and from 6pm for dinner. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000039', 'a1000000-0000-4000-8000-000000000018', 'Three-course winter menu',
  'Three courses with a choice at each one.',
  495, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R495 per person, from midday daily. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000003a', 'a1000000-0000-4000-8000-000000000019', 'Sharing tasting menu',
  'A curated tasting menu meant for sharing.',
  349, null, 'food'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R349 per person. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000003b', 'a1000000-0000-4000-8000-00000000001a', 'Two- or three-course winter menu',
  'Winter set menu running to oxtail ravioli and slow-roasted lamb shank.',
  450, null, 'dinner'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R450 for two courses, R550 for three. Lunch and dinner daily. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000003c', 'a1000000-0000-4000-8000-00000000001b', 'Three-course paired dinner',
  'Three courses, each paired with a drink.',
  750, null, 'dinner'::special_category, '{}',
  array[4]::smallint[], null, null,
  null, null, 'R750 per person, Thursdays from 6:30pm. Advertised as a winter offer with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000003d', 'a1000000-0000-4000-8000-00000000001c', 'Two- or three-course lunch',
  'Winter lunch menu on the Camps Bay beachfront.',
  285, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6, 7]::smallint[], null, null,
  null, null, 'R285 for two courses, R375 for three, from midday daily. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000003e', 'a1000000-0000-4000-8000-00000000001d', 'Weekday set menu',
  'Two or three courses, weekdays only.',
  295, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5]::smallint[], null, null,
  null, null, 'R295 for two courses, R365 for three, Monday to Friday, all day. Advertised as a winter menu with no end date published.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-00000000003f', 'a1000000-0000-4000-8000-00000000001e', 'Five-course lunch',
  'Five courses at the Round House, from cured game fish through to Karoo lamb.',
  1090, null, 'lunch'::special_category, '{}',
  array[2, 3, 4, 5, 6]::smallint[], null, null,
  null, null, 'R1090 per person, from 12:30. Advertised as a winter menu with no end date published. Booking strongly advised.', false,
  'unknown'::holiday_status, 'https://www.dineplan.com/blog/winter-specials-and-set-menus/', 'booking_page'::source_type,
  '2026-07-23', '2026-08-22', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000040', 'a1000000-0000-4000-8000-00000000001f', 'Social Hour — half-price margaritas',
  'Half price on margaritas and on the small plates menu, early evening.',
  null, null, 'happy_hour'::special_category, '{}',
  array[2, 3, 4, 5, 6, 7]::smallint[], '17:00', '19:00',
  null, null, 'Confirmed twice: the bar''s own site, and an Instagram post on 22 August 2026. One caption also says ''the best two hours of your day start at 4pm'', but every explicit statement of the times says 5pm to 7pm.', false,
  'unknown'::holiday_status, 'https://www.ritascocktailclub.com/', 'official_website'::source_type,
  '2026-08-22', '2026-08-23', 'verified'::verification_status,
  true, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000041', 'a1000000-0000-4000-8000-000000000020', 'Winter lunch menu',
  'A two- or three-course winter lunch, served through the afternoon.',
  250, null, 'lunch'::special_category, '{}',
  array[1, 2, 3, 4, 5, 6]::smallint[], '12:00', '16:00',
  null, null, 'R250 for two courses, R295 for three. Monday to Saturday. Advertised as a winter menu with no end date published, so confirm before relying on it in spring.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/Db0k4EDoNxL/', 'social'::source_type,
  '2026-08-09', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000042', 'a1000000-0000-4000-8000-000000000021', 'Happy hour',
  'Happy-hour prices at the bar, Wednesday through Saturday evening.',
  null, null, 'happy_hour'::special_category, '{}',
  array[3, 4, 5, 6]::smallint[], '18:00', '20:00',
  null, null, 'Advertised as 6pm to 8pm Wednesday to Saturday. One Friday post extended it to 10pm, so Friday may run longer.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcJaxFcimTs/', 'social'::source_type,
  '2026-08-17', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000043', 'a1000000-0000-4000-8000-000000000021', 'Free frozen cocktail with any pizza',
  'Order any pizza on a Wednesday and the frozen cocktail is on the house.',
  null, null, 'food'::special_category, '{}',
  array[3]::smallint[], null, null,
  null, null, 'Posted on three separate Wednesdays in August 2026, which is what makes it a weekly offer rather than a one-off.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcJaxFcimTs/', 'social'::source_type,
  '2026-08-19', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000044', 'a1000000-0000-4000-8000-000000000021', 'Half-price baskets on Thursdays',
  'Fifty percent off the basket menu, all night.',
  null, null, 'food'::special_category, '{}',
  array[4]::smallint[], null, null,
  null, null, 'Posted on three separate Thursdays in August 2026.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcLq5j0Diwf/', 'social'::source_type,
  '2026-08-20', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (
  'b2000000-0000-4000-8000-000000000045', 'a1000000-0000-4000-8000-000000000021', 'Free jug or bubbly with a party platter',
  'Order any party platter on a Friday and get a frozen jug or a bottle of bubbly free.',
  null, null, 'food'::special_category, '{}',
  array[5]::smallint[], null, null,
  null, null, 'Posted on three separate Fridays in August 2026.', false,
  'unknown'::holiday_status, 'https://www.instagram.com/p/DcTZWoFCKyH/', 'social'::source_type,
  '2026-08-21', '2026-08-23', 'verified'::verification_status,
  false, true
) on conflict (id) do nothing;

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
  '{"restaurant":"The Nines","street_address":"Main Road, Sea Point","title":"Fridays Come Alive, Aperitivo, and the winter set menu","days_of_week":[5],"start_time":"18:00","end_time":"22:00","note":"Three further offers listed with end dates but no prices at all."}'::jsonb,
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

commit;
