'use client';

import { useId, useState } from 'react';
import VenueAvatar from './VenueAvatar';
import SpecialDetailBody from './SpecialDetailBody';
import { formatRand, formatTimeRange, type ZonedNow } from '@/lib/time';
import { splitTitlePrice } from '@/lib/title-price';
import { SUBURB_SHORT, type SpecialWithRestaurant } from '@/lib/types';

interface Props {
  special: SpecialWithRestaurant;
  now: ZonedNow;
  distanceKm: number | null;
}

/**
 * Deliberately sparse when closed. The list is for scanning — venue, where,
 * what, how much — and the rest drops open inside the card rather than over
 * it, so opening one offer never loses your place in the list.
 *
 * The plus is drawn as a 28px circle but sits inside a 44px button, so the
 * touch target clears the accessibility minimum without the circle looking
 * heavy in the corner. Open, the same glyph turns 45 degrees into a close X.
 */
export default function SpecialCard({ special, now, distanceKm }: Props) {
  const [open, setOpen] = useState(false);
  const panelId = useId();
  // Titles like "Two Aperol Spritz for R215" carry their own price. Lift it out
  // and show it once, in orange, rather than twice in two different styles.
  const { title, price: priceFromTitle } = splitTitlePrice(special.title);
  const price = formatRand(special.price) ?? priceFromTitle;
  const showPrice = price !== null && !title.includes(price);
  const when = formatTimeRange(special.start_time, special.end_time);
  // restaurant.suburb is a plain string on the row type, so look it up loosely
  // and fall back to whatever the database holds.
  const suburb =
    (SUBURB_SHORT as Record<string, string>)[special.restaurant.suburb] ??
    special.restaurant.suburb;
  // Some street addresses already end in the suburb ("…, V&A Waterfront").
  // Appending it again reads like a bug, so only add it when it is missing.
  const address = special.restaurant.street_address;
  const where = address.toLowerCase().includes(suburb.toLowerCase())
    ? address
    : `${address}, ${suburb}`;

  return (
    <li className="border-line bg-surface relative overflow-hidden rounded-[var(--radius-card)] border">
      <article className="p-4">
        <div className="flex items-center gap-3 pr-11">
          <VenueAvatar
            name={special.restaurant.name}
            categories={special.restaurant.categories}
            imageUrl={special.restaurant.image_url}
            size={44}
          />

          <div className="min-w-0 flex-1">
            <h3 className="text-[16px] leading-tight font-bold text-white">
              {special.restaurant.name}
            </h3>
            {/* Short suburb name here: several street addresses already end in
                the suburb, and "…V&A Waterfront, Victoria & Alfred Waterfront"
                reads like a bug. Two lines is the ceiling. */}
            <p className="mt-0.5 line-clamp-2 text-[13px] text-white/55">
              {where}
              {distanceKm !== null && (
                <span>
                  {' · '}
                  {distanceKm < 1
                    ? `${Math.round(distanceKm * 1000)} m`
                    : `${distanceKm.toFixed(1)} km`}{' '}
                  away
                </span>
              )}
            </p>
          </div>
        </div>

        <h4 className="mt-3 text-[18px] leading-snug font-extrabold tracking-tight text-white">
          {title}
        </h4>

        {/* When it runs on the left, what it costs on the right. Everything
            else waits until the card is opened. */}
        <div className="mt-2 flex items-center justify-between gap-3">
          <span className="bg-surface-2 rounded-lg px-2 py-1 text-[12px] font-semibold text-white/70">
            {when}
          </span>
          {showPrice && (
            <span className="text-orange text-[22px] leading-none font-extrabold">{price}</span>
          )}
        </div>

        {open && (
          <div id={panelId} className="mt-4">
            <SpecialDetailBody special={special} todayIso={now.date} />
          </div>
        )}

        <button
          type="button"
          aria-expanded={open}
          aria-controls={panelId}
          onClick={() => setOpen((value) => !value)}
          className="group absolute top-1 right-1 grid h-11 w-11 place-items-center rounded-full"
        >
          <span
            aria-hidden="true"
            className="bg-orange text-ink group-hover:bg-orange-dark grid h-7 w-7 place-items-center rounded-full transition-colors"
          >
            <svg
              viewBox="0 0 24 24"
              className={`h-4 w-4 transition-transform duration-200 ${open ? 'rotate-45' : ''}`}
            >
              <path
                d="M12 5v14M5 12h14"
                fill="none"
                stroke="currentColor"
                strokeWidth="2.6"
                strokeLinecap="round"
              />
            </svg>
          </span>
          <span className="sr-only">
            {open ? 'Hide details for' : 'View details for'} {title} at {special.restaurant.name}
          </span>
        </button>
      </article>
    </li>
  );
}
