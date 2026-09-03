'use client';

import { useId } from 'react';

interface Props {
  value: string;
  /** How many specials the current query is showing, for the live region. */
  resultCount: number;
  onChange: (value: string) => void;
}

/**
 * Free-text search across the day's specials.
 *
 * The suburb and filter chips answer "what kind of thing"; this answers "that
 * place I heard about". A restaurant name is by far the most common thing
 * someone arrives with, so the placeholder says "restaurant" first — an earlier
 * draft said "a place", which reads as an area and hid the feature people
 * wanted most.
 *
 * It sits under the chips and runs full width because it is the widest net on
 * the screen — it reads venue name, offer title, description, category and
 * street address at once, so a search for "burger", "Long Street" or "Kloof"
 * all land somewhere sensible.
 *
 * `type="search"` gets the phone keyboard's Search key and, on iOS, the native
 * clear button; the explicit clear button below is for everyone else. Deliberately
 * NOT inside a form — submitting would reload the page, and results already
 * update as you type.
 */
export default function SearchBox({ value, resultCount, onChange }: Props) {
  const id = useId();
  const has = value.trim().length > 0;

  return (
    <div className="mt-2">
      <label htmlFor={id} className="sr-only">
        Search specials by restaurant, dish, area or street
      </label>

      <div className="relative">
        <span
          aria-hidden="true"
          className="pointer-events-none absolute inset-y-0 left-4 grid place-items-center"
        >
          <svg viewBox="0 0 24 24" className="text-ink/70 h-5 w-5">
            <circle cx="11" cy="11" r="7" fill="none" stroke="currentColor" strokeWidth="2.2" />
            <path
              d="M16.5 16.5 21 21"
              fill="none"
              stroke="currentColor"
              strokeWidth="2.2"
              strokeLinecap="round"
            />
          </svg>
        </span>

        <input
          id={id}
          type="search"
          inputMode="search"
          enterKeyHint="search"
          autoComplete="off"
          value={value}
          onChange={(event) => onChange(event.target.value)}
          placeholder="Search a restaurant or dish"
          className="glass-btn focus:border-line-bright text-ink placeholder:text-ink/70 w-full rounded-2xl py-3 pr-12 pl-12 text-[16px] font-semibold transition-colors outline-none placeholder:font-normal [&::-webkit-search-cancel-button]:hidden"
        />

        {has && (
          <button
            type="button"
            onClick={() => onChange('')}
            className="text-ink/65 hover:text-ink absolute inset-y-0 right-0 grid w-12 place-items-center rounded-r-2xl"
          >
            <span className="sr-only">Clear the search</span>
            <svg viewBox="0 0 24 24" aria-hidden="true" className="h-5 w-5">
              <path
                d="M6 6l12 12M18 6L6 18"
                fill="none"
                stroke="currentColor"
                strokeWidth="2.4"
                strokeLinecap="round"
              />
            </svg>
          </button>
        )}
      </div>

      {/* Announced to screen readers as the count changes, so someone who
          cannot see the list still knows whether the query narrowed it. */}
      {has && (
        <p aria-live="polite" className="text-ink/65 mt-1.5 px-1 text-[13px]">
          {resultCount === 0
            ? 'Nothing matches that.'
            : `${resultCount} ${resultCount === 1 ? 'match' : 'matches'} for “${value.trim()}”`}
        </p>
      )}
    </div>
  );
}
