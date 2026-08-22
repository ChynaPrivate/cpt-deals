/**
 * Regenerates supabase/seed.sql from the typed seed data in src/lib/data/seed.ts,
 * so the SQL and the local fallback data can never drift apart.
 *
 *   npm run seed:sql
 */
import { writeFileSync } from 'node:fs';
import path from 'node:path';
import { RESEARCH_QUEUE_SEED, RESTAURANTS_SEED, SPECIALS_SEED } from '../src/lib/data/seed';

const q = (value: string | null | undefined): string =>
  value === null || value === undefined ? 'null' : `'${value.replace(/'/g, "''")}'`;

const num = (value: number | null): string => (value === null ? 'null' : String(value));
const bool = (value: boolean): string => (value ? 'true' : 'false');
const textArray = (values: string[]): string =>
  values.length === 0 ? `'{}'` : `array[${values.map(q).join(', ')}]::text[]`;
const dietaryArray = (values: string[]): string =>
  values.length === 0 ? `'{}'` : `array[${values.map(q).join(', ')}]::dietary_tag[]`;
const smallintArray = (values: number[]): string => `array[${values.join(', ')}]::smallint[]`;

const lines: string[] = [
  '-- ============================================================================',
  '-- CPT Deals — verified seed data',
  '-- GENERATED FILE. Edit src/lib/data/seed.ts and run `npm run seed:sql`.',
  '--',
  '-- Every special below carries the source URL it was verified against and the',
  '-- date it was checked. Candidates that could not be confirmed are inserted',
  '-- into research_queue instead, where they stay out of public results.',
  '-- ============================================================================',
  '',
  'begin;',
  '',
];

lines.push('-- ---------------------------------------------------------- restaurants');
for (const r of RESTAURANTS_SEED) {
  lines.push(
    `insert into public.restaurants (id, name, slug, description, categories, street_address, suburb, latitude, longitude, phone, website_url, booking_url, instagram_url, facebook_url, google_maps_url, image_url, active, last_checked_at) values (`,
    `  ${q(r.id)}, ${q(r.name)}, ${q(r.slug)}, ${q(r.description)}, ${textArray(r.categories)},`,
    `  ${q(r.street_address)}, ${q(r.suburb)}, ${num(r.latitude)}, ${num(r.longitude)}, ${q(r.phone)},`,
    `  ${q(r.website_url)}, ${q(r.booking_url)}, ${q(r.instagram_url)}, ${q(r.facebook_url)},`,
    `  ${q(r.google_maps_url)}, ${q(r.image_url)}, ${bool(r.active)}, ${q(r.last_checked_at)}`,
    `) on conflict (id) do nothing;`,
    '',
  );
}

lines.push('-- ------------------------------------------------------------- specials');
for (const s of SPECIALS_SEED) {
  lines.push(
    `insert into public.specials (id, restaurant_id, title, description, price, original_price, category, dietary_tags, days_of_week, start_time, end_time, valid_from, valid_until, terms, booking_required, public_holiday_status, source_url, source_type, source_published_at, last_verified_at, verification_status, featured, active) values (`,
    `  ${q(s.id)}, ${q(s.restaurant_id)}, ${q(s.title)},`,
    `  ${q(s.description)},`,
    `  ${num(s.price)}, ${num(s.original_price)}, ${q(s.category)}::special_category, ${dietaryArray(s.dietary_tags)},`,
    `  ${smallintArray(s.days_of_week)}, ${q(s.start_time)}, ${q(s.end_time)},`,
    `  ${q(s.valid_from)}, ${q(s.valid_until)}, ${q(s.terms)}, ${bool(s.booking_required)},`,
    `  ${q(s.public_holiday_status)}::holiday_status, ${q(s.source_url)}, ${q(s.source_type)}::source_type,`,
    `  ${q(s.source_published_at)}, ${q(s.last_verified_at)}, ${q(s.verification_status)}::verification_status,`,
    `  ${bool(s.featured)}, ${bool(s.active)}`,
    `) on conflict (id) do nothing;`,
    '',
  );
}

lines.push('-- ------------------------------------------- research queue (not public)');
for (const item of RESEARCH_QUEUE_SEED) {
  lines.push(
    `insert into public.research_queue (id, restaurant_id, proposed_special_data, source_url, detected_at, confidence, review_status, reviewer_notes) values (`,
    `  ${q(item.id)}, ${item.restaurant_id ? q(item.restaurant_id) : 'null'},`,
    `  ${q(JSON.stringify(item.proposed_special_data))}::jsonb,`,
    `  ${q(item.source_url)}, ${q(item.detected_at)}, ${q(item.confidence)}::confidence_level,`,
    `  ${q(item.review_status)}::review_status, ${q(item.reviewer_notes)}`,
    `) on conflict (id) do nothing;`,
    '',
  );
}

lines.push('commit;', '');

const out = path.join(process.cwd(), 'supabase', 'seed.sql');
writeFileSync(out, lines.join('\n'), 'utf8');
console.log(
  `Wrote ${out} — ${RESTAURANTS_SEED.length} restaurants, ${SPECIALS_SEED.length} specials, ${RESEARCH_QUEUE_SEED.length} research candidates.`,
);
