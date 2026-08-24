'use client';

import { WEEKDAYS, WEEKDAY_NAMES, type Weekday } from '@/lib/types';

interface Props {
  selected: Weekday;
  today: Weekday;
  counts: Record<Weekday, number>;
  onSelect: (day: Weekday) => void;
}

/**
 * The seven weekday buttons, stacked one per row.
 *
 * They used to stretch to fill the viewport. Now they share the first screen
 * with the hero banner and the four filter buttons, so they are sized rather
 * than stretched: 46px is still a comfortable thumb target, and seven of them
 * plus the banner and the buttons land inside a normal phone screen without
 * scrolling.
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
      className="flex flex-col gap-1.5"
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
              'flex min-h-[46px] items-center justify-between gap-3 rounded-2xl border-2 sm:min-h-[56px]',
              'px-4 text-left transition-colors',
              isSelected
                ? 'border-orange bg-orange text-ink shadow-[0_6px_20px_-8px_rgba(255,122,26,0.9)]'
                : 'border-line bg-surface hover:border-orange/50 text-white',
            ].join(' ')}
          >
            <span className="flex items-center gap-3">
              <span className="text-[17px] font-bold sm:text-[19px]">{WEEKDAY_NAMES[day]}</span>
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
              className={`text-[14px] tabular-nums ${isSelected ? 'text-ink/75' : 'text-white/60'}`}
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
