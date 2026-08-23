'use client';

import VenueAvatar from './VenueAvatar';
import { Pill, VerificationBadge } from './Badges';
import { formatIsoDate, formatRand, formatTimeRange, isOpenNow, type ZonedNow } from '@/lib/time';
import { freshnessLabel } from '@/lib/specials';
import { CATEGORY_LABELS, WEEKDAY_SHORT, type SpecialWithRestaurant } from '@/lib/types';

interface Props {
  special: SpecialWithRestaurant;
  now: ZonedNow;
  distanceKm: number | null;
  onOpen: (special: SpecialWithRestaurant) => void;
}

export default function SpecialCard({ special, now, distanceKm, onOpen }: Props) {
  const price = formatRand(special.price);
  const wasPrice = formatRand(special.original_price);
  const freshness = freshnessLabel(special, now.date);
  const open = isOpenNow(special, now);
  const validity = special.valid_until
    ? `Until ${formatIsoDate(special.valid_until)}`
    : special.valid_from
      ? `From ${formatIsoDate(special.valid_from)}`
      : 'No end date published';

  return (
    <li className="border-line bg-surface overflow-hidden rounded-[var(--radius-card)] border">
      <article className="p-4">
        <div className="flex items-center gap-3">
          <VenueAvatar
            name={special.restaurant.name}
            categories={special.restaurant.categories}
            imageUrl={special.restaurant.image_url}
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

        <h4 className="mt-4 text-[20px] leading-snug font-extrabold tracking-tight text-white">
          {special.title}
        </h4>
        <p className="mt-1 text-[15px] text-white/75">{special.description}</p>

        <div className="mt-3 flex flex-wrap items-baseline gap-x-3 gap-y-1">
          {price ? (
            <span className="text-orange text-[24px] leading-none font-extrabold">{price}</span>
          ) : (
            <span className="text-orange text-[16px] font-bold">See offer</span>
          )}
          {wasPrice && (
            <span className="text-[15px] text-white/45 line-through">
              <span className="sr-only">Usual price </span>
              {wasPrice}
            </span>
          )}
          <span className="text-[14px] text-white/60">
            {formatTimeRange(special.start_time, special.end_time)}
          </span>
        </div>

        <div className="mt-3 flex flex-wrap gap-2">
          {open && <Pill tone="solid">Open now</Pill>}
          <Pill tone="accent">{special.restaurant.suburb}</Pill>
          <Pill>{CATEGORY_LABELS[special.category]}</Pill>
          {special.dietary_tags.includes('vegetarian') && <Pill>Vegetarian</Pill>}
          <Pill tone="outline">{special.days_of_week.map((d) => WEEKDAY_SHORT[d]).join(', ')}</Pill>
          <Pill tone="outline">{validity}</Pill>
          <VerificationBadge
            state={freshness}
            lastVerified={formatIsoDate(special.last_verified_at) ?? ''}
          />
        </div>

        <button
          type="button"
          onClick={() => onOpen(special)}
          className="bg-orange text-ink hover:bg-orange-dark mt-4 min-h-[48px] w-full rounded-xl px-4 text-[16px] font-bold transition-colors"
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
