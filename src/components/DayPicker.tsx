'use client';

import { WEEKDAYS, WEEKDAY_NAMES, WEEKDAY_SHORT, type Weekday } from '@/lib/types';

interface Props {
  selected: Weekday;
  today: Weekday;
  counts: Record<Weekday, number>;
  onSelect: (day: Weekday) => void;
}

/**
 * The seven weekday buttons.
 *
 * All seven are always on screen — a four-column grid on phones (two rows) and
 * on desktop. An earlier version scrolled horizontally, which meant the strip
 * opened part-scrolled and the first days were invisible on a phone.
 *
 * Rendered as a radiogroup so screen readers and arrow keys behave the way
 * people expect from a segmented control.
 */
export default function DayPicker({ selected, today, counts, onSelect }: Props) {
  function handleKeyDown(event: React.KeyboardEvent) {
    const index = WEEKDAYS.indexOf(selected);
    if (event.key === 'ArrowRight' || event.key === 'ArrowDown') {
      event.preventDefault();
      onSelect(WEEKDAYS[(index + 1) % 7]);
    } else if (event.key === 'ArrowLeft' || event.key === 'ArrowUp') {
      event.preventDefault();
      onSelect(WEEKDAYS[(index + 6) % 7]);
    }
  }

  return (
    <div
      role="radiogroup"
      aria-label="Choose a day of the week"
      onKeyDown={handleKeyDown}
      className="grid grid-cols-4 gap-2"
    >
      {WEEKDAYS.map((day) => {
        const isSelected = day === selected;
        const isToday = day === today;
        const count = counts[day];
        return (
          <button
            key={day}
            type="button"
            role="radio"
            aria-checked={isSelected}
            tabIndex={isSelected ? 0 : -1}
            onClick={() => onSelect(day)}
            className={[
              'min-h-[76px] min-w-0 rounded-2xl border-2 px-3 py-3 text-left transition-colors',
              isSelected
                ? 'border-orange bg-orange text-ink shadow-[0_6px_20px_-8px_rgba(255,122,26,0.9)]'
                : 'border-line bg-surface hover:border-orange/50 text-white',
            ].join(' ')}
          >
            <span className="block text-[15px] font-bold">
              <span className="sm:hidden">{WEEKDAY_SHORT[day]}</span>
              <span className="hidden sm:inline">{WEEKDAY_NAMES[day]}</span>
            </span>
            <span
              className={`mt-1 block text-[12.5px] leading-tight tabular-nums ${
                isSelected ? 'text-ink/75' : 'text-white/60'
              }`}
            >
              {count} {count === 1 ? 'special' : 'specials'}
            </span>
            {isToday && (
              <span
                className={`mt-1 inline-block rounded-full px-2 py-0.5 text-[11px] font-bold tracking-wide uppercase ${
                  isSelected ? 'bg-ink/15 text-ink' : 'bg-orange-dim text-orange'
                }`}
              >
                Today
              </span>
            )}
            <span className="sr-only">
              {WEEKDAY_NAMES[day]}
              {isToday ? ', today' : ''}, {count} verified {count === 1 ? 'special' : 'specials'}
            </span>
          </button>
        );
      })}
    </div>
  );
}
