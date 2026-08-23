'use client';

import { WEEKDAYS, WEEKDAY_NAMES, type Weekday } from '@/lib/types';

interface Props {
  selected: Weekday;
  today: Weekday;
  counts: Record<Weekday, number>;
  onSelect: (day: Weekday) => void;
}

/**
 * The seven weekday buttons, stacked one per row and sized to fill the first
 * screen.
 *
 * Earlier versions packed them into a grid, which left the top of the phone
 * mostly empty and made the day — the thing the whole site turns on — feel
 * incidental. Now the opening screen is the question: which day?
 *
 * The rows share the space with `flex-1`, so seven of them fill the viewport
 * without any per-device height maths. `min-h-[64px]` stops them collapsing
 * below a comfortable touch target on a short screen, at which point the page
 * simply scrolls.
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
      className="flex min-h-[70svh] flex-col gap-2"
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
              'flex min-h-[64px] flex-1 items-center justify-between gap-3 rounded-2xl border-2',
              'px-5 text-left transition-colors',
              isSelected
                ? 'border-orange bg-orange text-ink shadow-[0_6px_20px_-8px_rgba(255,122,26,0.9)]'
                : 'border-line bg-surface hover:border-orange/50 text-white',
            ].join(' ')}
          >
            <span className="flex items-center gap-3">
              <span className="text-[20px] font-bold">{WEEKDAY_NAMES[day]}</span>
              {isToday && (
                <span
                  className={`rounded-full px-2 py-0.5 text-[11px] font-bold tracking-wide uppercase ${
                    isSelected ? 'bg-ink/15 text-ink' : 'bg-orange-dim text-orange'
                  }`}
                >
                  Today
                </span>
              )}
            </span>
            <span
              className={`text-[15px] tabular-nums ${isSelected ? 'text-ink/75' : 'text-white/60'}`}
            >
              {count}
            </span>
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
