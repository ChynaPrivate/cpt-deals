'use client';

import { useId, useState } from 'react';
import { useMediaQuery } from '@/lib/hooks/useMediaQuery';
import {
  FILTER_LABELS,
  SORT_LABELS,
  SUBURBS,
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
        'min-h-[40px] shrink-0 rounded-full border px-3.5 text-[14px] font-semibold transition-colors',
        on
          ? 'border-orange bg-orange text-ink'
          : 'border-line bg-surface hover:border-orange/50 text-white',
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
      className={`bg-surface-2 flex min-h-[52px] w-full items-center justify-center gap-2 rounded-2xl border-2 px-4 text-[17px] font-bold text-white transition-colors ${
        open ? 'border-orange/50' : 'border-line hover:border-orange/50'
      }`}
    >
      {label}
      {count > 0 && (
        <span className="bg-orange text-ink grid h-5 min-w-5 place-items-center rounded-full px-1.5 text-[12px] font-bold">
          {count}
          <span className="sr-only"> selected</span>
        </span>
      )}
      <span aria-hidden="true" className="text-[11px] text-white/60">
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
          <label htmlFor="sort" className="text-[14px] font-semibold text-white/60">
            Sort by
          </label>
          <select
            id="sort"
            value={sort}
            onChange={(event) => onSort(event.target.value as SortKey)}
            className="border-line bg-surface min-h-[40px] rounded-xl border px-3 text-[14px] font-semibold text-white"
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
        <div
          id={suburbPanelId}
          role="group"
          aria-label="Choose suburbs"
          className="mt-3 flex flex-wrap gap-2"
        >
          <Chip on={suburbs.length === 0} onClick={onClearSuburbs}>
            All suburbs
          </Chip>
          {SUBURBS.map((suburb) => {
            const count = suburbCounts[suburb] ?? 0;
            const on = suburbs.includes(suburb);
            return (
              <Chip
                key={suburb}
                on={on}
                dimmed={count === 0}
                onClick={() => onToggleSuburb(suburb)}
              >
                {SUBURB_SHORT[suburb]}
                <span className={`ml-1.5 tabular-nums ${on ? 'text-ink/70' : 'text-white/50'}`}>
                  {count}
                </span>
                <span className="sr-only">
                  {' '}
                  {count === 1 ? 'special' : 'specials'} on the selected day
                </span>
              </Chip>
            );
          })}
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
              className="text-orange min-h-[40px] rounded-xl px-3 text-[14px] font-semibold underline underline-offset-2"
            >
              Clear filters
            </button>
          )}
        </div>
      )}

      {sort === 'nearest' && locationState !== 'granted' && (
        <p role="status" className="mt-2 text-[14px] text-white/60">
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
