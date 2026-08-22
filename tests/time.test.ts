import { describe, expect, it } from 'vitest';
import {
  crossesMidnight,
  daysBetween,
  formatIsoDate,
  formatRand,
  formatTimeRange,
  isExpired,
  isExpiringSoon,
  isOpenNow,
  isWithinValidity,
  needsRecheck,
  previousDay,
  timeToMinutes,
  zonedNow,
} from '@/lib/time';
import type { Special, Weekday } from '@/lib/types';

/** Minimal special used for time assertions. */
function offer(overrides: Partial<Special> = {}) {
  return {
    days_of_week: [1, 2, 3, 4, 5, 6, 7] as Weekday[],
    start_time: null,
    end_time: null,
    valid_from: null,
    valid_until: null,
    last_verified_at: '2026-08-20',
    ...overrides,
  };
}

describe('Africa/Johannesburg clock', () => {
  it('reports the Cape Town date even when the process is on UTC', () => {
    // 22:30 UTC on 20 August is already 00:30 on 21 August in Cape Town.
    const now = zonedNow(new Date('2026-08-20T22:30:00Z'));
    expect(now.date).toBe('2026-08-21');
    expect(now.weekday).toBe(5); // Friday
    expect(now.minutes).toBe(30);
  });

  it('handles a UTC instant that is still the previous Cape Town day', () => {
    const now = zonedNow(new Date('2026-08-20T21:59:00Z'));
    expect(now.date).toBe('2026-08-20');
    expect(now.weekday).toBe(4); // Thursday
    expect(now.minutes).toBe(23 * 60 + 59);
  });

  it('numbers weekdays Monday=1 through Sunday=7', () => {
    expect(zonedNow(new Date('2026-08-17T09:00:00Z')).weekday).toBe(1);
    expect(zonedNow(new Date('2026-08-23T09:00:00Z')).weekday).toBe(7);
  });

  it('rolls the previous day around the week', () => {
    expect(previousDay(1)).toBe(7);
    expect(previousDay(5)).toBe(4);
  });

  it('reads times and spots midnight-crossing windows', () => {
    expect(timeToMinutes('16:30')).toBe(990);
    expect(timeToMinutes(null)).toBeNull();
    expect(timeToMinutes('nonsense')).toBeNull();
    expect(crossesMidnight('22:00', '02:00')).toBe(true);
    expect(crossesMidnight('22:00', '00:00')).toBe(true);
    expect(crossesMidnight('15:00', '18:00')).toBe(false);
  });

  it('counts whole days between dates', () => {
    expect(daysBetween('2026-08-20', '2026-08-27')).toBe(7);
    expect(daysBetween('2026-08-27', '2026-08-20')).toBe(-7);
    expect(daysBetween('2026-02-28', '2026-03-01')).toBe(1);
  });
});

describe('validity windows', () => {
  it('treats both bounds as inclusive', () => {
    const special = offer({ valid_from: '2026-08-01', valid_until: '2026-08-31' });
    expect(isWithinValidity(special, '2026-08-01')).toBe(true);
    expect(isWithinValidity(special, '2026-08-31')).toBe(true);
    expect(isWithinValidity(special, '2026-07-31')).toBe(false);
    expect(isWithinValidity(special, '2026-09-01')).toBe(false);
  });

  it('treats a missing bound as open ended', () => {
    expect(isWithinValidity(offer(), '2030-01-01')).toBe(true);
  });

  it('marks an offer expired only after its end date', () => {
    const special = offer({ valid_until: '2026-08-31' });
    expect(isExpired(special, '2026-08-31')).toBe(false);
    expect(isExpired(special, '2026-09-01')).toBe(true);
  });

  it('flags offers ending within seven days', () => {
    const special = offer({ valid_until: '2026-08-27' });
    expect(isExpiringSoon(special, '2026-08-20')).toBe(true);
    expect(isExpiringSoon(special, '2026-08-19')).toBe(false); // eight days out
    expect(isExpiringSoon(special, '2026-08-28')).toBe(false); // already expired
    expect(isExpiringSoon(offer(), '2026-08-20')).toBe(false); // no end date
  });

  it('flags offers not checked for 30 days', () => {
    expect(needsRecheck(offer({ last_verified_at: '2026-08-20' }), '2026-09-19')).toBe(false);
    expect(needsRecheck(offer({ last_verified_at: '2026-08-20' }), '2026-09-20')).toBe(true);
  });
});

describe('open now', () => {
  const friday = { date: '2026-08-21', weekday: 5 as Weekday, minutes: 17 * 60 };

  it('treats an all-day offer as open whenever the day matches', () => {
    expect(isOpenNow(offer({ days_of_week: [5] }), friday)).toBe(true);
    expect(isOpenNow(offer({ days_of_week: [1] }), friday)).toBe(false);
  });

  it('respects a same-day window, exclusive of the end minute', () => {
    const happyHour = offer({ days_of_week: [5], start_time: '16:30', end_time: '18:30' });
    expect(isOpenNow(happyHour, friday)).toBe(true);
    expect(isOpenNow(happyHour, { ...friday, minutes: 16 * 60 + 29 })).toBe(false);
    expect(isOpenNow(happyHour, { ...friday, minutes: 18 * 60 + 30 })).toBe(false);
    expect(isOpenNow(happyHour, { ...friday, minutes: 18 * 60 + 29 })).toBe(true);
  });

  it('keeps a midnight-crossing offer open into the next calendar day', () => {
    // Friday 22:00 to 02:00.
    const lateNight = offer({ days_of_week: [5], start_time: '22:00', end_time: '02:00' });
    expect(isOpenNow(lateNight, { ...friday, minutes: 23 * 60 })).toBe(true);
    // 01:00 on Saturday is still inside Friday's window.
    expect(isOpenNow(lateNight, { date: '2026-08-22', weekday: 6, minutes: 60 })).toBe(true);
    // 03:00 on Saturday is not.
    expect(isOpenNow(lateNight, { date: '2026-08-22', weekday: 6, minutes: 180 })).toBe(false);
    // 01:00 on Friday belongs to Thursday's window, which does not exist.
    expect(isOpenNow(lateNight, { date: '2026-08-21', weekday: 5, minutes: 60 })).toBe(false);
  });

  it('handles a window that ends exactly at midnight', () => {
    const untilMidnight = offer({ days_of_week: [5], start_time: '22:00', end_time: '00:00' });
    expect(isOpenNow(untilMidnight, { ...friday, minutes: 23 * 60 + 59 })).toBe(true);
    expect(isOpenNow(untilMidnight, { date: '2026-08-22', weekday: 6, minutes: 1 })).toBe(false);
  });

  it('will not call an out-of-date offer open', () => {
    const expired = offer({
      days_of_week: [5],
      start_time: '16:00',
      end_time: '18:00',
      valid_until: '2026-08-01',
    });
    expect(isOpenNow(expired, friday)).toBe(false);
  });
});

describe('formatting', () => {
  it('renders time ranges for people', () => {
    expect(formatTimeRange('16:30', '18:30')).toBe('4:30pm – 6:30pm');
    expect(formatTimeRange('22:00', '00:00')).toBe('10:00pm – midnight');
    expect(formatTimeRange(null, null)).toBe('All day');
    expect(formatTimeRange('09:00', '12:00')).toBe('9:00am – 12:00pm');
  });

  it('renders dates and rand amounts', () => {
    expect(formatIsoDate('2026-08-20')).toBe('20 Aug 2026');
    expect(formatIsoDate(null)).toBeNull();
    expect(formatRand(185)).toBe('R185');
    expect(formatRand(99.5)).toBe('R99.50');
    expect(formatRand(null)).toBeNull();
  });
});
