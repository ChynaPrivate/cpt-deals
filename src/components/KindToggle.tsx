'use client';

import type { SpecialKind } from '@/lib/types';

interface Props {
  value: SpecialKind;
  counts: Record<'food' | 'drinks', number>;
  onChange: (kind: SpecialKind) => void;
}

/**
 * Two filters: food, drinks.
 *
 * There is deliberately no "Everything" button. Neither one being pressed IS
 * everything, and the day button above already shows the full count — a third
 * chip would only repeat it. Pressing the active filter again clears it, so
 * getting back to the whole list never needs a control of its own.
 */
export default function KindToggle({ value, counts, onChange }: Props) {
  const options: Array<{ kind: Exclude<SpecialKind, 'all'>; label: string }> = [
    { kind: 'food', label: 'Food' },
    { kind: 'drinks', label: 'Drinks' },
  ];

  return (
    <div role="group" aria-label="Filter by food or drinks" className="grid grid-cols-2 gap-2">
      {options.map(({ kind, label }) => {
        const on = value === kind;
        return (
          <button
            key={kind}
            type="button"
            aria-pressed={on}
            // Pressing the active filter clears it, which is what returns the
            // list to everything.
            onClick={() => onChange(on ? 'all' : kind)}
            className={[
              'min-h-[52px] rounded-2xl border-2 px-4 text-[17px] font-bold transition-colors',
              on
                ? 'border-orange bg-orange text-ink'
                : 'border-line bg-surface hover:border-orange/50 text-white',
            ].join(' ')}
          >
            {label}
            <span className={`ml-2 tabular-nums ${on ? 'text-ink/70' : 'text-white/50'}`}>
              {counts[kind]}
            </span>
          </button>
        );
      })}
    </div>
  );
}
