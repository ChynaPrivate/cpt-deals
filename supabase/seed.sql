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

-- ------------------------------------------- research queue (not public)
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
