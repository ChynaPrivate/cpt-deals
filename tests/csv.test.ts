import { describe, expect, it } from 'vitest';
import { CSV_TEMPLATE, csvToSpecials, parseCsv } from '@/lib/admin/csv';
import { findDuplicates } from '@/lib/admin/api';
import { SPECIALS_SEED } from '@/lib/data/seed';
import type { Special } from '@/lib/types';

describe('CSV parsing', () => {
  it('handles quoted fields, embedded commas and escaped quotes', () => {
    const rows = parseCsv('a,b\n"one, two","he said ""hi"""\n');
    expect(rows).toEqual([
      ['a', 'b'],
      ['one, two', 'he said "hi"'],
    ]);
  });

  it('handles CRLF line endings and skips blank lines', () => {
    expect(parseCsv('a,b\r\n1,2\r\n\r\n')).toEqual([
      ['a', 'b'],
      ['1', '2'],
    ]);
  });
});

describe('CSV validation', () => {
  const header =
    'restaurant_slug,title,description,price,category,days_of_week,source_url,source_type';

  it('accepts the bundled template', () => {
    const { rows, errors } = csvToSpecials(CSV_TEMPLATE, '2026-08-20');
    expect(errors).toEqual([]);
    expect(rows).toHaveLength(1);
    expect(rows[0].days_of_week).toEqual([2]);
  });

  it('imports rows as unverified regardless of what the file says', () => {
    const csv = `${header},verification_status\nricks,Test,Desc,100,food,1|2,https://example.com,official_website,verified`;
    const { rows } = csvToSpecials(csv, '2026-08-20');
    expect(rows[0].verification_status).toBe('unverified');
  });

  it('rejects a missing required column', () => {
    const { errors } = csvToSpecials('title,description\nx,y', '2026-08-20');
    expect(errors.join(' ')).toContain('Missing required column: restaurant_slug');
  });

  it('rejects an unknown category and a bad weekday', () => {
    const csv = `${header}\nricks,Test,Desc,100,sandwiches,9,https://example.com,official_website`;
    const { errors, rows } = csvToSpecials(csv, '2026-08-20');
    expect(rows).toHaveLength(0);
    expect(errors[0]).toContain('category "sandwiches" is not recognised');
    expect(errors[0]).toContain('days_of_week values must be between 1 and 7');
  });

  it('rejects a half-specified time window and a backwards date range', () => {
    const csv = `${header},start_time,end_time,valid_from,valid_until\nricks,Test,Desc,100,food,1,https://example.com,official_website,18:00,,2026-09-01,2026-08-01`;
    const { errors } = csvToSpecials(csv, '2026-08-20');
    expect(errors[0]).toContain('give both start_time and end_time');
    expect(errors[0]).toContain('valid_until is before valid_from');
  });

  it('rejects a source URL that is not a full link', () => {
    const csv = `${header}\nricks,Test,Desc,100,food,1,example.com,official_website`;
    const { errors } = csvToSpecials(csv, '2026-08-20');
    expect(errors[0]).toContain('source_url must be a full http(s) URL');
  });

  it('de-duplicates and sorts the weekday list', () => {
    const csv = `${header}\nricks,Test,Desc,100,food,3|1|3|2,https://example.com,official_website`;
    const { rows } = csvToSpecials(csv, '2026-08-20');
    expect(rows[0].days_of_week).toEqual([1, 2, 3]);
  });

  it('defaults the verification date to today when the column is absent', () => {
    const csv = `${header}\nricks,Test,Desc,100,food,1,https://example.com,official_website`;
    const { rows } = csvToSpecials(csv, '2026-08-20');
    expect(rows[0].last_verified_at).toBe('2026-08-20');
  });
});

describe('duplicate detection', () => {
  it('flags two identically titled specials at the same venue', () => {
    const base = SPECIALS_SEED[0] as Special;
    const pairs = findDuplicates([base, { ...base, id: 'copy' }]);
    expect(pairs).toHaveLength(1);
  });

  it('does not flag different offers at the same venue', () => {
    const [a, b] = SPECIALS_SEED as Special[];
    expect(findDuplicates([a, b])).toHaveLength(0);
  });

  it('does not treat a shared price as a duplicate on its own', () => {
    // Ferryman's really does run both of these at R169 on the same days.
    const base = SPECIALS_SEED[0] as Special;
    const a: Special = {
      ...base,
      id: 'a',
      title: 'R169 specials',
      category: 'food',
      price: 169,
      days_of_week: [1, 2, 3, 4, 5, 6, 7],
    };
    const b: Special = { ...a, id: 'b', title: 'A meal and a Guinness from R169' };
    expect(findDuplicates([a, b])).toHaveLength(0);
  });

  it('still flags a shared price when the titles describe the same thing', () => {
    const base = SPECIALS_SEED[0] as Special;
    const a: Special = {
      ...base,
      id: 'a',
      title: 'Oysters and bubbly for R179',
      category: 'drinks',
      price: 179,
      days_of_week: [1, 2, 3],
    };
    const b: Special = { ...a, id: 'b', title: 'Six oysters with bubbly, R179' };
    expect(findDuplicates([a, b])).toHaveLength(1);
  });

  it('finds no duplicates in the shipped seed data', () => {
    expect(findDuplicates(SPECIALS_SEED as Special[])).toHaveLength(0);
  });
});
