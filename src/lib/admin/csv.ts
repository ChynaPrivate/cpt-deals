/**
 * CSV import for specials that an administrator has already reviewed.
 * Parsing and validation live here (with no React) so they can be unit-tested.
 */
import type { DietaryTag, Special, Weekday } from '@/lib/types';

export const CSV_COLUMNS = [
  'restaurant_slug',
  'title',
  'description',
  'price',
  'original_price',
  'category',
  'dietary_tags',
  'days_of_week',
  'start_time',
  'end_time',
  'valid_from',
  'valid_until',
  'terms',
  'booking_required',
  'public_holiday_status',
  'source_url',
  'source_type',
  'source_published_at',
  'last_verified_at',
  'verification_status',
  'featured',
] as const;

/** RFC-4180-style parser: handles quoted fields, escaped quotes and CRLF. */
export function parseCsv(text: string): string[][] {
  const rows: string[][] = [];
  let row: string[] = [];
  let field = '';
  let inQuotes = false;

  for (let i = 0; i < text.length; i += 1) {
    const char = text[i];

    if (inQuotes) {
      if (char === '"') {
        if (text[i + 1] === '"') {
          field += '"';
          i += 1;
        } else {
          inQuotes = false;
        }
      } else {
        field += char;
      }
      continue;
    }

    if (char === '"') {
      inQuotes = true;
    } else if (char === ',') {
      row.push(field);
      field = '';
    } else if (char === '\n' || char === '\r') {
      if (char === '\r' && text[i + 1] === '\n') i += 1;
      row.push(field);
      rows.push(row);
      row = [];
      field = '';
    } else {
      field += char;
    }
  }

  if (field.length > 0 || row.length > 0) {
    row.push(field);
    rows.push(row);
  }

  return rows.filter((r) => r.some((cell) => cell.trim() !== ''));
}

export interface CsvResult {
  rows: Array<Partial<Special> & { restaurant_slug: string }>;
  errors: string[];
}

const CATEGORIES = new Set(['food', 'drinks', 'breakfast', 'lunch', 'dinner', 'happy_hour']);
const SOURCE_TYPES = new Set([
  'official_website',
  'official_menu',
  'booking_page',
  'google_business',
  'publication',
  'social',
]);
const DIETARY = new Set(['vegetarian', 'vegan', 'halaal']);

function splitList(value: string): string[] {
  return value
    .split(/[|;]/)
    .map((part) => part.trim())
    .filter(Boolean);
}

/** Validate a parsed CSV against the specials schema. Nothing is imported unless it passes. */
export function csvToSpecials(text: string, todayIso: string): CsvResult {
  const parsed = parseCsv(text);
  const errors: string[] = [];
  const rows: CsvResult['rows'] = [];

  if (parsed.length === 0) {
    return { rows, errors: ['The file is empty.'] };
  }

  const header = parsed[0].map((h) => h.trim().toLowerCase());
  for (const required of [
    'restaurant_slug',
    'title',
    'description',
    'category',
    'days_of_week',
    'source_url',
    'source_type',
  ]) {
    if (!header.includes(required)) errors.push(`Missing required column: ${required}`);
  }
  if (errors.length) return { rows, errors };

  const at = (row: string[], column: string): string => {
    const index = header.indexOf(column);
    return index === -1 ? '' : (row[index] ?? '').trim();
  };

  for (let i = 1; i < parsed.length; i += 1) {
    const row = parsed[i];
    const line = i + 1;
    const problems: string[] = [];

    const slug = at(row, 'restaurant_slug');
    const title = at(row, 'title');
    const description = at(row, 'description');
    const category = at(row, 'category').toLowerCase();
    const sourceUrl = at(row, 'source_url');
    const sourceType = at(row, 'source_type').toLowerCase();

    if (!slug) problems.push('restaurant_slug is required');
    if (!title) problems.push('title is required');
    if (!description) problems.push('description is required');
    if (!CATEGORIES.has(category)) problems.push(`category "${category}" is not recognised`);
    if (!/^https?:\/\//i.test(sourceUrl)) problems.push('source_url must be a full http(s) URL');
    if (!SOURCE_TYPES.has(sourceType))
      problems.push(`source_type "${sourceType}" is not recognised`);

    const days = splitList(at(row, 'days_of_week'))
      .map((d) => Number(d))
      .filter((d) => Number.isInteger(d));
    if (days.length === 0) problems.push('days_of_week must list at least one day (1=Mon … 7=Sun)');
    if (days.some((d) => d < 1 || d > 7))
      problems.push('days_of_week values must be between 1 and 7');

    const dietary = splitList(at(row, 'dietary_tags')).map((t) => t.toLowerCase());
    if (dietary.some((t) => !DIETARY.has(t)))
      problems.push('dietary_tags may only be vegetarian, vegan or halaal');

    const start = at(row, 'start_time');
    const end = at(row, 'end_time');
    if (Boolean(start) !== Boolean(end))
      problems.push('give both start_time and end_time, or neither');

    const priceRaw = at(row, 'price');
    const price = priceRaw === '' ? null : Number(priceRaw);
    if (price !== null && (Number.isNaN(price) || price < 0))
      problems.push('price must be a number');

    const originalRaw = at(row, 'original_price');
    const originalPrice = originalRaw === '' ? null : Number(originalRaw);
    if (originalPrice !== null && Number.isNaN(originalPrice))
      problems.push('original_price must be a number');

    const validFrom = at(row, 'valid_from') || null;
    const validUntil = at(row, 'valid_until') || null;
    if (validFrom && validUntil && validUntil < validFrom) {
      problems.push('valid_until is before valid_from');
    }

    if (problems.length) {
      errors.push(`Line ${line}: ${problems.join('; ')}`);
      continue;
    }

    rows.push({
      restaurant_slug: slug,
      title,
      description,
      price,
      original_price: originalPrice,
      category: category as Special['category'],
      dietary_tags: dietary as DietaryTag[],
      days_of_week: [...new Set(days)].sort() as Weekday[],
      start_time: start || null,
      end_time: end || null,
      valid_from: validFrom,
      valid_until: validUntil,
      terms: at(row, 'terms') || null,
      booking_required: /^(true|yes|1)$/i.test(at(row, 'booking_required')),
      public_holiday_status:
        (at(row, 'public_holiday_status') as Special['public_holiday_status']) || 'unknown',
      source_url: sourceUrl,
      source_type: sourceType as Special['source_type'],
      source_published_at: at(row, 'source_published_at') || null,
      last_verified_at: at(row, 'last_verified_at') || todayIso,
      // Imports never publish themselves — a person still has to verify each row.
      verification_status: 'unverified',
      featured: /^(true|yes|1)$/i.test(at(row, 'featured')),
      active: true,
    });
  }

  return { rows, errors };
}

export const CSV_TEMPLATE = `${CSV_COLUMNS.join(',')}
ricks-cafe-americain,Two-for-one burgers,"Buy one burger and get a second free.",,,food,,2,,,,,"Dine-in only.",false,unknown,https://rickscafe.co.za/specials,official_website,,2026-08-20,unverified,false
`;
