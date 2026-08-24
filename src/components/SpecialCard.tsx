'use client';

import VenueAvatar from './VenueAvatar';
import { formatRand, type ZonedNow } from '@/lib/time';
import { type SpecialWithRestaurant } from '@/lib/types';

interface Props {
  special: SpecialWithRestaurant;
  now: ZonedNow;
  distanceKm: number | null;
  onOpen: (special: SpecialWithRestaurant) => void;
}

/**
 * Deliberately sparse. The list is for scanning — venue, where, what, how much —
 * and everything else (times, days, terms, verification, the call and directions
 * buttons) lives one tap away in the details view.
 */
export default function SpecialCard({ special, distanceKm, onOpen }: Props) {
  const price = formatRand(special.price);
  // Plenty of titles already say the price ("Two Aperol Spritz for R215").
  // Repeating it beside them just adds noise.
  const showPrice = price !== null && !special.title.includes(price);

  return (
    <li className="border-line bg-surface overflow-hidden rounded-[var(--radius-card)] border">
      <article className="p-4">
        <div className="flex items-center gap-3">
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
            <p className="mt-0.5 text-[13px] text-white/55">
              {special.restaurant.street_address}, {special.restaurant.suburb}
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

        <div className="mt-3 flex items-baseline justify-between gap-3">
          <h4 className="min-w-0 text-[18px] leading-snug font-extrabold tracking-tight text-white">
            {special.title}
          </h4>
          {showPrice && (
            <span className="text-orange shrink-0 text-[20px] leading-none font-extrabold">
              {price}
            </span>
          )}
        </div>

        <button
          type="button"
          onClick={() => onOpen(special)}
          className="bg-orange text-ink hover:bg-orange-dark mt-3 min-h-[44px] w-full rounded-xl px-4 text-[15px] font-bold transition-colors"
        >
          View details
          <span className="sr-only">
            {' '}
            for {special.title} at {special.restaurant.name}
          </span>
        </button>
      </article>
    </li>
  );
}
