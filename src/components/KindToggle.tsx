'use client';

import type { SpecialKind } from '@/lib/types';

interface Props {
  value: SpecialKind;
  counts: Record<'food' | 'drinks', number>;
  onChange: (kind: SpecialKind) => void;
}

/** Left to right: food only, both, drinks only. */
const ORDER: SpecialKind[] = ['food', 'all', 'drinks'];

/**
 * A three-position slider rather than two buttons.
 *
 * The old pair had a hidden rule — press the lit button again to get back to
 * everything — which nothing on screen explained. Here "Both" is a position you
 * can see and slide to, so the middle state stops being a secret.
 *
 * The orange thumb is one element that translates by its own width, so it
 * genuinely slides between the three stops instead of three backgrounds
 * blinking on and off. Arrow keys move it, as people expect from a segmented
 * control.
 */
export default function KindToggle({ value, counts, onChange }: Props) {
  const index = Math.max(0, ORDER.indexOf(value));

  const options: Array<{ kind: SpecialKind; label: string; count: number }> = [
    { kind: 'food', label: 'Food', count: counts.food },
    { kind: 'all', label: 'Both', count: counts.food + counts.drinks },
    { kind: 'drinks', label: 'Drinks', count: counts.drinks },
  ];

  function handleKeyDown(event: React.KeyboardEvent) {
    if (event.key === 'ArrowRight') {
      event.preventDefault();
      onChange(ORDER[Math.min(index + 1, ORDER.length - 1)]);
    } else if (event.key === 'ArrowLeft') {
      event.preventDefault();
      onChange(ORDER[Math.max(index - 1, 0)]);
    }
  }

  return (
    <div
      role="radiogroup"
      aria-label="Show food, both, or drinks"
      onKeyDown={handleKeyDown}
      className="border-line bg-surface relative grid grid-cols-3 rounded-2xl border-2 p-1"
    >
      {/* The thumb. One third of the inner width, moved by whole multiples of
          itself — so it lands exactly on each stop at any screen size. */}
      <span
        aria-hidden="true"
        className="bg-orange absolute inset-y-1 left-1 w-[calc((100%-0.5rem)/3)] rounded-xl transition-transform duration-200 ease-out motion-reduce:transition-none"
        style={{ transform: `translateX(${index * 100}%)` }}
      />

      {options.map(({ kind, label, count }) => {
        const on = value === kind;
        return (
          <button
            key={kind}
            type="button"
            role="radio"
            aria-checked={on}
            tabIndex={on ? 0 : -1}
            onClick={() => onChange(kind)}
            className={`relative z-10 flex min-h-[44px] items-center justify-center gap-1.5 rounded-xl text-[16px] font-bold transition-colors ${
              on ? 'text-ink' : 'text-white'
            }`}
          >
            {label}
            <span className={`tabular-nums ${on ? 'text-ink/70' : 'text-white/50'}`}>{count}</span>
          </button>
        );
      })}
    </div>
  );
}
