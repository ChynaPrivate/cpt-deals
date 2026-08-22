'use client';

import { useCallback, useEffect, useMemo, useState } from 'react';
import DayPicker from './DayPicker';
import ControlBar from './ControlBar';
import InstallHelp from './InstallHelp';
import SpecialCard from './SpecialCard';
import SpecialDetail from './SpecialDetail';
import {
  applyFilters,
  countsByDay,
  countsBySuburb,
  distanceForSpecial,
  sortSpecials,
  specialsForDay,
  type Coords,
} from '@/lib/specials';
import { zonedNow, type ZonedNow } from '@/lib/time';
import {
  DISCLAIMER,
  WEEKDAY_NAMES,
  type FilterKey,
  type SortKey,
  type SpecialWithRestaurant,
  type Suburb,
  type Weekday,
} from '@/lib/types';

interface Props {
  specials: SpecialWithRestaurant[];
  /** Cape Town "now" computed on the server so the first paint is correct. */
  serverNow: ZonedNow;
}

type LocationState = 'idle' | 'asking' | 'granted' | 'denied' | 'unsupported';

export default function SpecialsBrowser({ specials, serverNow }: Props) {
  // Start from the server's value, then keep it current on the client.
  const [now, setNow] = useState<ZonedNow>(serverNow);
  const [selectedDay, setSelectedDay] = useState<Weekday>(serverNow.weekday);
  const [dayChosenByUser, setDayChosenByUser] = useState(false);
  const [filters, setFilters] = useState<FilterKey[]>([]);
  // Empty means every suburb — how the site opens.
  const [suburbs, setSuburbs] = useState<Suburb[]>([]);
  const [sort, setSort] = useState<SortKey>('recommended');
  const [coords, setCoords] = useState<Coords | null>(null);
  const [locationState, setLocationState] = useState<LocationState>('idle');
  const [openSpecial, setOpenSpecial] = useState<SpecialWithRestaurant | null>(null);

  // Re-evaluate the clock after hydration and then once a minute, so "Open now"
  // and the Today highlight stay honest without reloading the page.
  useEffect(() => {
    const tick = () => {
      const current = zonedNow();
      setNow(current);
      // If the page was served before midnight, follow the real day until the
      // visitor picks one themselves.
      setSelectedDay((day) => (dayChosenByUser ? day : current.weekday));
    };
    tick();
    const timer = window.setInterval(tick, 60_000);
    return () => window.clearInterval(timer);
  }, [dayChosenByUser]);

  const chooseDay = useCallback((day: Weekday) => {
    setDayChosenByUser(true);
    setSelectedDay(day);
  }, []);

  const counts = useMemo(
    () => countsByDay(specials, now.date, suburbs),
    [specials, now.date, suburbs],
  );

  const suburbCounts = useMemo(
    () => countsBySuburb(specials, now.date, selectedDay),
    [specials, now.date, selectedDay],
  );

  const visible = useMemo(() => {
    const forDay = specialsForDay(specials, selectedDay, now.date, suburbs);
    const filtered = applyFilters(forDay, filters, now);
    return sortSpecials(filtered, sort, now, coords);
  }, [specials, selectedDay, now, filters, sort, coords, suburbs]);

  const requestLocation = useCallback(() => {
    if (!('geolocation' in navigator)) {
      setLocationState('unsupported');
      return;
    }
    setLocationState('asking');
    navigator.geolocation.getCurrentPosition(
      (position) => {
        setCoords({
          latitude: position.coords.latitude,
          longitude: position.coords.longitude,
        });
        setLocationState('granted');
      },
      () => setLocationState('denied'),
      { enableHighAccuracy: false, timeout: 10_000, maximumAge: 300_000 },
    );
  }, []);

  function handleSort(next: SortKey) {
    setSort(next);
    // Location is only ever requested once the visitor asks for "Nearest".
    if (next === 'nearest' && !coords && locationState === 'idle') requestLocation();
  }

  function toggleFilter(filter: FilterKey) {
    setFilters((current) =>
      current.includes(filter) ? current.filter((f) => f !== filter) : [...current, filter],
    );
  }

  const isToday = selectedDay === now.weekday;

  return (
    <>
      {/* The visible site name lives in the shared header; this is the page's
          own heading for screen readers and search engines. */}
      <h1 className="sr-only">
        CPT Deals — verified restaurant and bar specials across Cape Town, by day of the week
      </h1>

      <section aria-labelledby="day-heading">
        <div className="flex items-baseline justify-between gap-3">
          <h2 id="day-heading" className="text-[18px] font-bold">
            Pick a day
          </h2>
          {!isToday && (
            <button
              type="button"
              onClick={() => chooseDay(now.weekday)}
              className="bg-orange text-ink min-h-[40px] rounded-full px-4 text-[14px] font-bold"
            >
              Back to today
            </button>
          )}
        </div>
        <div className="mt-3">
          <DayPicker
            selected={selectedDay}
            today={now.weekday}
            counts={counts}
            onSelect={chooseDay}
          />
        </div>
      </section>

      <ControlBar
        suburbs={suburbs}
        suburbCounts={suburbCounts}
        filters={filters}
        sort={sort}
        locationState={locationState}
        onToggleSuburb={(suburb) =>
          setSuburbs((current) =>
            current.includes(suburb)
              ? current.filter((item) => item !== suburb)
              : [...current, suburb],
          )
        }
        onClearSuburbs={() => setSuburbs([])}
        onToggleFilter={toggleFilter}
        onSort={handleSort}
        onClearFilters={() => setFilters([])}
      />

      <section aria-labelledby="results-heading" className="mt-6">
        <h2 id="results-heading" className="text-[18px] font-bold">
          {WEEKDAY_NAMES[selectedDay]}
          {isToday && <span className="text-orange"> — today</span>}
        </h2>
        <p aria-live="polite" className="mt-1 text-[15px] text-white/60">
          {visible.length} {visible.length === 1 ? 'special' : 'specials'}
          {suburbs.length > 0 ? ` in ${suburbs.join(', ')}` : ' across all suburbs'}
          {filters.length > 0 ? ', matching your filters' : ''}
        </p>

        {visible.length === 0 ? (
          <div className="border-line bg-surface mt-4 rounded-[var(--radius-card)] border p-6 text-center">
            <p className="text-[17px] font-bold">No verified specials found for this day yet.</p>
            <p className="mt-2 text-[15px] text-white/60">
              {filters.length > 0 || suburbs.length > 0
                ? 'Try widening the suburbs or clearing the filters, or have a look at another day.'
                : 'Try another day — Tuesday and Sunday usually have the most on offer.'}
            </p>
            {filters.length > 0 && (
              <button
                type="button"
                onClick={() => setFilters([])}
                className="bg-orange text-ink mt-3 min-h-[44px] rounded-xl px-4 text-[15px] font-bold"
              >
                Clear filters
              </button>
            )}
          </div>
        ) : (
          <ul className="mt-4 space-y-3">
            {visible.map((special) => (
              <SpecialCard
                key={special.id}
                special={special}
                now={now}
                distanceKm={sort === 'nearest' ? distanceForSpecial(special, coords) : null}
                onOpen={setOpenSpecial}
              />
            ))}
          </ul>
        )}
      </section>

      <p className="border-orange/25 bg-orange-dim mt-6 rounded-xl border px-4 py-3 text-[14px] text-white/85">
        {DISCLAIMER}
      </p>

      <InstallHelp />

      <SpecialDetail
        special={openSpecial}
        todayIso={now.date}
        onClose={() => setOpenSpecial(null)}
      />
    </>
  );
}
