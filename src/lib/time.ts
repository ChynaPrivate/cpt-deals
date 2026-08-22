/**
 * All day and time logic for CPT Deals runs in Africa/Johannesburg,
 * regardless of where the visitor's device clock is set.
 */
import type { Special, Weekday } from './types';

export const TIMEZONE = 'Africa/Johannesburg';

export interface ZonedNow {
  /** ISO calendar date in Africa/Johannesburg, e.g. "2026-08-20". */
  date: string;
  /** ISO weekday, Monday = 1 ... Sunday = 7. */
  weekday: Weekday;
  /** Minutes elapsed since local midnight. */
  minutes: number;
}

const partsFormatter = new Intl.DateTimeFormat('en-GB', {
  timeZone: TIMEZONE,
  year: 'numeric',
  month: '2-digit',
  day: '2-digit',
  hour: '2-digit',
  minute: '2-digit',
  weekday: 'short',
  hour12: false,
});

const WEEKDAY_FROM_SHORT: Record<string, Weekday> = {
  Mon: 1,
  Tue: 2,
  Wed: 3,
  Thu: 4,
  Fri: 5,
  Sat: 6,
  Sun: 7,
};

/** Resolve a Date (or "now") into Cape Town calendar date, weekday and clock minutes. */
export function zonedNow(now: Date = new Date()): ZonedNow {
  const parts = partsFormatter.formatToParts(now);
  const get = (type: Intl.DateTimeFormatPartTypes) =>
    parts.find((p) => p.type === type)?.value ?? '';

  const year = get('year');
  const month = get('month');
  const day = get('day');
  // Intl renders midnight as "24" in some en-GB/hourCycle combinations.
  const hour = get('hour') === '24' ? 0 : Number(get('hour'));
  const minute = Number(get('minute'));
  const weekday = WEEKDAY_FROM_SHORT[get('weekday')] ?? 1;

  return {
    date: `${year}-${month}-${day}`,
    weekday,
    minutes: hour * 60 + minute,
  };
}

/** "HH:MM" -> minutes since midnight. Returns null for empty/invalid input. */
export function timeToMinutes(time: string | null | undefined): number | null {
  if (!time) return null;
  const match = /^(\d{1,2}):(\d{2})/.exec(time);
  if (!match) return null;
  const hours = Number(match[1]);
  const mins = Number(match[2]);
  if (hours > 24 || mins > 59) return null;
  return (hours % 24) * 60 + mins;
}

/** True when the window wraps past midnight, e.g. 22:00 -> 02:00 or 22:00 -> 00:00. */
export function crossesMidnight(startTime: string | null, endTime: string | null): boolean {
  const start = timeToMinutes(startTime);
  const end = timeToMinutes(endTime);
  if (start === null || end === null) return false;
  return end <= start;
}

/** Does this special run on the given weekday? */
export function runsOnDay(special: Pick<Special, 'days_of_week'>, day: Weekday): boolean {
  return special.days_of_week.includes(day);
}

/** Yesterday's ISO weekday. */
export function previousDay(day: Weekday): Weekday {
  return (day === 1 ? 7 : day - 1) as Weekday;
}

function addDays(isoDate: string, days: number): string {
  const [y, m, d] = isoDate.split('-').map(Number);
  const dt = new Date(Date.UTC(y, m - 1, d));
  dt.setUTCDate(dt.getUTCDate() + days);
  return dt.toISOString().slice(0, 10);
}

export function daysBetween(fromIso: string, toIso: string): number {
  const [fy, fm, fd] = fromIso.split('-').map(Number);
  const [ty, tm, td] = toIso.split('-').map(Number);
  const from = Date.UTC(fy, fm - 1, fd);
  const to = Date.UTC(ty, tm - 1, td);
  return Math.round((to - from) / 86_400_000);
}

/**
 * Is the special inside its validity window on the given calendar date?
 * valid_from and valid_until are inclusive. A missing bound is treated as open-ended.
 */
export function isWithinValidity(
  special: Pick<Special, 'valid_from' | 'valid_until'>,
  isoDate: string,
): boolean {
  if (special.valid_from && isoDate < special.valid_from) return false;
  if (special.valid_until && isoDate > special.valid_until) return false;
  return true;
}

/** Has the offer's end date passed relative to the given Cape Town date? */
export function isExpired(special: Pick<Special, 'valid_until'>, isoDate: string): boolean {
  return Boolean(special.valid_until && isoDate > special.valid_until);
}

/** Ends within the next `withinDays` days (inclusive of today). */
export function isExpiringSoon(
  special: Pick<Special, 'valid_until'>,
  isoDate: string,
  withinDays = 7,
): boolean {
  if (!special.valid_until) return false;
  const remaining = daysBetween(isoDate, special.valid_until);
  return remaining >= 0 && remaining <= withinDays;
}

/** Not checked by a human in the last `staleAfterDays` days. */
export function needsRecheck(
  special: Pick<Special, 'last_verified_at'>,
  isoDate: string,
  staleAfterDays = 30,
): boolean {
  return daysBetween(special.last_verified_at.slice(0, 10), isoDate) > staleAfterDays;
}

/**
 * Is the special running right now in Cape Town?
 *
 * Handles two cases the naive version gets wrong:
 *  - all-day specials (no start/end time) are open whenever the day matches;
 *  - windows that cross midnight stay open into the following calendar day,
 *    so a Friday 22:00–02:00 happy hour is still "open now" at 01:00 on Saturday.
 */
export function isOpenNow(
  special: Pick<Special, 'days_of_week' | 'start_time' | 'end_time' | 'valid_from' | 'valid_until'>,
  now: ZonedNow,
): boolean {
  const start = timeToMinutes(special.start_time);
  const end = timeToMinutes(special.end_time);

  // All-day offer: only the weekday and validity window matter.
  if (start === null || end === null) {
    return runsOnDay(special, now.weekday) && isWithinValidity(special, now.date);
  }

  if (end > start) {
    return (
      runsOnDay(special, now.weekday) &&
      isWithinValidity(special, now.date) &&
      now.minutes >= start &&
      now.minutes < end
    );
  }

  // Crosses midnight. `end === start` means a full 24 hours from the start time,
  // so the tail runs right up to the same clock time the next day.
  const tailEnd = end === start ? start : end;

  // Late part of today's window.
  if (
    runsOnDay(special, now.weekday) &&
    isWithinValidity(special, now.date) &&
    now.minutes >= start
  ) {
    return true;
  }

  // Early-hours tail of yesterday's window.
  const yesterday = addDays(now.date, -1);
  if (
    runsOnDay(special, previousDay(now.weekday)) &&
    isWithinValidity(special, yesterday) &&
    now.minutes < tailEnd
  ) {
    return true;
  }

  return false;
}

/** "15:00" -> "3:00pm" style label used on cards. */
export function formatTime(time: string | null): string | null {
  const minutes = timeToMinutes(time);
  if (minutes === null) return null;
  const hours24 = Math.floor(minutes / 60) % 24;
  const mins = minutes % 60;
  const suffix = hours24 < 12 ? 'am' : 'pm';
  const hours12 = hours24 % 12 === 0 ? 12 : hours24 % 12;
  return `${hours12}:${String(mins).padStart(2, '0')}${suffix}`;
}

export function formatTimeRange(start: string | null, end: string | null): string {
  const from = formatTime(start);
  const to = formatTime(end);
  if (!from || !to) return 'All day';
  if (crossesMidnight(start, end) && timeToMinutes(end) === 0) return `${from} – midnight`;
  return `${from} – ${to}`;
}

/** "2026-08-20" -> "20 Aug 2026" */
export function formatIsoDate(iso: string | null): string | null {
  if (!iso) return null;
  const [y, m, d] = iso.slice(0, 10).split('-').map(Number);
  if (!y || !m || !d) return null;
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return `${d} ${months[m - 1]} ${y}`;
}

export function formatRand(amount: number | null): string | null {
  if (amount === null || Number.isNaN(amount)) return null;
  const rounded = Math.round(amount * 100) / 100;
  return Number.isInteger(rounded) ? `R${rounded}` : `R${rounded.toFixed(2)}`;
}
