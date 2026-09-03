'use client';

import { useId, useState } from 'react';
import { useMediaQuery } from '@/lib/hooks/useMediaQuery';
import {
  FILTER_LABELS,
  SORT_LABELS,
  FILTER_SUBURBS,
  SUBURB_SHORT,
  type FilterKey,
  type SortKey,
  type Suburb,
} from '@/lib/types';

const FILTER_ORDER: FilterKey[] = [
  'food',
  'drinks',
  'breakfast',
  'lunch',
  'dinner',
  'happy_hour',
  'vegetarian',
  'under_150',
  'under_250',
  'open_now',
];

const SORT_ORDER: SortKey[] = [
  'recommended',
  'price_asc',
  'nearest',
  'recently_verified',
  'expiring_soon',
];

interface Props {
  suburbs: Suburb[];
  suburbCounts: Record<string, number>;
  filters: FilterKey[];
  sort: SortKey;
  locationState: 'idle' | 'asking' | 'granted' | 'denied' | 'unsupported';
  onToggleSuburb: (suburb: Suburb) => void;
  onClearSuburbs: () => void;
  onToggleFilter: (filter: FilterKey) => void;
  onSort: (sort: SortKey) => void;
  onClearFilters: () => void;
}

function Chip({
  on,
  onClick,
  children,
  dimmed = false,
}: {
  on: boolean;
  onClick: () => void;
  children: React.ReactNode;
  dimmed?: boolean;
}) {
  return (
    <button
      type="button"
      aria-pressed={on}
      onClick={onClick}
      className={[
        'min-h-[40px] shrink-0 rounded-full px-3.5 text-[14px] font-semibold transition-colors',
        on ? 'sunset-selected' : 'glass-btn text-ink',
        dimmed && !on ? 'opacity-55' : '',
      ].join(' ')}
    >
      {children}
    </button>
  );
}

function Toggle({
  label,
  count,
  open,
  controls,
  onClick,
}: {
  label: string;
  count: number;
  open: boolean;
  controls: string;
  onClick: () => void;
}) {
  return (
    <button
      type="button"
      aria-expanded={open}
      aria-controls={controls}
      onClick={onClick}
      className="glass-btn text-ink flex min-h-[52px] w-full items-center justify-center gap-2 rounded-2xl px-4 text-[17px] font-bold transition-colors"
    >
      {label}
      {count > 0 && (
        <span className="text-ink grid h-5 min-w-5 place-items-center rounded-full bg-white/65 px-1.5 text-[12px] font-bold">
          {count}
          <span className="sr-only"> selected</span>
        </span>
      )}
      <span aria-hidden="true" className="text-ink/70 text-[11px]">
        {open ? '▴' : '▾'}
      </span>
    </button>
  );
}

/**
 * Where, what and in which order — kept on one compact row so the weekday
 * buttons stay at the top of the screen. Both panels open by default where
 * there is room and stay collapsed on a phone until asked for.
 */
export default function ControlBar({
  suburbs,
  suburbCounts,
  filters,
  sort,
  locationState,
  onToggleSuburb,
  onClearSuburbs,
  onToggleFilter,
  onSort,
  onClearFilters,
}: Props) {
  const baseId = useId();
  const suburbPanelId = `${baseId}-suburbs`;
  const filterPanelId = `${baseId}-filters`;
  const hasRoom = useMediaQuery('(min-width: 640px)');
  const [suburbOverride, setSuburbOverride] = useState<boolean | null>(null);
  const [filterOverride, setFilterOverride] = useState<boolean | null>(null);
  const suburbOpen = suburbOverride ?? hasRoom;
  const filterOpen = filterOverride ?? hasRoom;

  return (
    <section aria-label="Choose suburbs, filter and sort" className="mt-2">
      <div className="grid grid-cols-2 gap-2">
        <Toggle
          label="Suburbs"
          count={suburbs.length}
          open={suburbOpen}
          controls={suburbPanelId}
          onClick={() => setSuburbOverride(!suburbOpen)}
        />
        <Toggle
          label="Filters"
          count={filters.length}
          open={filterOpen}
          controls={filterPanelId}
          onClick={() => setFilterOverride(!filterOpen)}
        />
      </div>

      <div className="mt-3 flex flex-wrap items-center gap-3">
        <span className="inline-flex items-center gap-2">
          <label htmlFor="sort" className="text-ink/90 text-[14px] font-semibold">
            Sort by
          </label>
          <select
            id="sort"
            value={sort}
            onChange={(event) => onSort(event.target.value as SortKey)}
            className="glass-btn text-ink min-h-[40px] rounded-xl px-3 text-[14px] font-semibold"
          >
            {SORT_ORDER.map((key) => (
              <option key={key} value={key}>
                {SORT_LABELS[key]}
              </option>
            ))}
          </select>
        </span>
      </div>

      {suburbOpen && (
        <div id={suburbPanelId} role="group" aria-label="Choose suburbs" className="mt-3">
          <button
            type="button"
            aria-pressed={suburbs.length === 0}
            onClick={onClearSuburbs}
            className={[
              'min-h-[44px] w-full rounded-xl px-4 text-[14px] font-semibold transition-colors',
              suburbs.length === 0 ? 'sunset-selected' : 'glass-btn text-ink',
            ].join(' ')}
          >
            All suburbs
          </button>

          {/* Six suburbs, two to a row. Equal widths so the block reads as one
              shape rather than a ragged wrap. */}
          <div className="mt-2 grid grid-cols-2 gap-2">
            {FILTER_SUBURBS.map((suburb) => {
              const count = suburbCounts[suburb] ?? 0;
              const on = suburbs.includes(suburb);
              return (
                <button
                  key={suburb}
                  type="button"
                  aria-pressed={on}
                  onClick={() => onToggleSuburb(suburb)}
                  className={[
                    'flex min-h-[44px] items-center justify-center gap-1.5 rounded-xl px-3',
                    'text-[14px] font-semibold transition-colors',
                    on ? 'sunset-selected' : 'glass-btn text-ink',
                    count === 0 && !on ? 'opacity-55' : '',
                  ].join(' ')}
                >
                  {SUBURB_SHORT[suburb]}
                  <span className="text-ink/80 tabular-nums">{count}</span>
                  <span className="sr-only">
                    {' '}
                    {count === 1 ? 'special' : 'specials'} on the selected day
                  </span>
                </button>
              );
            })}
          </div>
        </div>
      )}

      {filterOpen && (
        <div
          id={filterPanelId}
          role="group"
          aria-label="Filters"
          className="mt-3 flex flex-wrap gap-2"
        >
          {FILTER_ORDER.map((filter) => (
            <Chip key={filter} on={filters.includes(filter)} onClick={() => onToggleFilter(filter)}>
              {FILTER_LABELS[filter]}
            </Chip>
          ))}
          {filters.length > 0 && (
            <button
              type="button"
              onClick={onClearFilters}
              className="text-accent min-h-[40px] rounded-xl px-3 text-[14px] font-semibold underline underline-offset-2"
            >
              Clear filters
            </button>
          )}
        </div>
      )}

      {sort === 'nearest' && locationState !== 'granted' && (
        <p role="status" className="text-ink/90 mt-2 text-[14px]">
          {locationState === 'asking' && 'Asking your browser for your location…'}
          {locationState === 'denied' &&
            'Location was declined, so specials stay in their usual order. Everything else still works.'}
          {locationState === 'unsupported' &&
            'This browser cannot share a location, so specials stay in their usual order.'}
          {locationState === 'idle' && 'Choose “Nearest” to be asked for your location.'}
        </p>
      )}
    </section>
  );
}
