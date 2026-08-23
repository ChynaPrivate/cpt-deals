'use client';

import { KIND_LABELS, type SpecialKind } from '@/lib/types';

interface Props {
  value: SpecialKind;
  counts: Record<'food' | 'drinks', number>;
  onChange: (kind: SpecialKind) => void;
}

const OPTIONS: SpecialKind[] = ['all', 'food', 'drinks'];

/**
 * The first question a visitor actually asks: eating, or drinking?
 *
 * A three-way segmented control rather than two independent toggles, so there
 * is always exactly one answer selected — no state where both are off and the
 * screen is empty for no visible reason.
 */
export default function KindToggle({ value, counts, onChange }: Props) {
  const total = counts.food + counts.drinks;

  return (
    <div
      role="radiogroup"
      aria-label="Food or drinks"
      className="border-line bg-surface grid grid-cols-3 gap-1 rounded-2xl border p-1"
    >
      {OPTIONS.map((option) => {
        const on = value === option;
        const count = option === 'all' ? total : counts[option];
        return (
          <button
            key={option}
            type="button"
            role="radio"
            aria-checked={on}
            onClick={() => onChange(option)}
            className={`min-h-[44px] rounded-xl px-3 text-[15px] font-bold transition-colors ${
              on ? 'bg-orange text-ink' : 'text-white hover:bg-white/5'
            }`}
          >
            {KIND_LABELS[option]}
            <span className={`ml-1.5 tabular-nums ${on ? 'text-ink/70' : 'text-white/50'}`}>
              {count}
            </span>
          </button>
        );
      })}
    </div>
  );
}
