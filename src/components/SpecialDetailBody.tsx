'use client';

import { useState } from 'react';
import { Pill, VerificationBadge } from './Badges';
import ReportForm from './ReportForm';
import { formatIsoDate, formatRand, formatTimeRange } from '@/lib/time';
import { freshnessLabel } from '@/lib/specials';
import { CATEGORY_LABELS, DISCLAIMER, WEEKDAY_NAMES, type SpecialWithRestaurant } from '@/lib/types';

interface Props {
  special: SpecialWithRestaurant;
  todayIso: string;
}

function Row({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div className="border-line border-b py-3 last:border-b-0">
      <dt className="text-[13px] font-semibold tracking-wide text-white/60 uppercase">{label}</dt>
      <dd className="mt-1 text-[16px] text-white">{children}</dd>
    </div>
  );
}

const HOLIDAY_TEXT: Record<string, string> = {
  unknown: 'Not stated by the restaurant — please check before a public holiday.',
  valid: 'The restaurant states this offer also runs on public holidays.',
  not_valid: 'The restaurant states this offer does not run on public holidays.',
};

/**
 * Everything about one special that does not belong on the scanning list.
 *
 * This used to live inside a modal dialog. It now drops open inside the card
 * itself, so the reader keeps their place in the list — which matters on a
 * page where the whole point is comparing one offer against the next.
 */
export default function SpecialDetailBody({ special, todayIso }: Props) {
  const [reporting, setReporting] = useState(false);
  const price = formatRand(special.price);
  const restaurant = special.restaurant;
  const mapsUrl =
    restaurant.google_maps_url ??
    `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(
      `${restaurant.name}, ${restaurant.street_address}, ${restaurant.suburb}, Cape Town`,
    )}`;

  return (
    <div className="panel-in">
      <p className="text-[15px] text-white/85">{special.description}</p>

      <div className="mt-3 flex flex-wrap gap-2">
        <Pill>{CATEGORY_LABELS[special.category]}</Pill>
        {special.dietary_tags.map((tag) => (
          <Pill key={tag}>{tag[0].toUpperCase() + tag.slice(1)}</Pill>
        ))}
        <VerificationBadge
          state={freshnessLabel(special, todayIso)}
          lastVerified={formatIsoDate(special.last_verified_at) ?? ''}
        />
      </div>

      <dl className="border-line bg-surface-2 mt-3 rounded-2xl border px-4">
        <Row label="Price">
          {price ? (
            <span className="text-orange text-[20px] font-extrabold">{price}</span>
          ) : (
            'Discount offer — see the description above'
          )}
          {special.original_price !== null && (
            <span className="ml-2 text-white/60 line-through">
              {formatRand(special.original_price)}
            </span>
          )}
        </Row>
        <Row label="Days">{special.days_of_week.map((d) => WEEKDAY_NAMES[d]).join(', ')}</Row>
        <Row label="Time">{formatTimeRange(special.start_time, special.end_time)}</Row>
        <Row label="Valid">
          {special.valid_from || special.valid_until ? (
            <>
              {special.valid_from ? `From ${formatIsoDate(special.valid_from)}` : 'Running now'}
              {special.valid_until ? ` until ${formatIsoDate(special.valid_until)}` : ''}
            </>
          ) : (
            'No end date published by the restaurant'
          )}
        </Row>
        {special.terms && <Row label="Terms and exclusions">{special.terms}</Row>}
        <Row label="Booking">
          {special.booking_required ? 'Booking required.' : 'No booking requirement published.'}
        </Row>
        <Row label="Public holidays">{HOLIDAY_TEXT[special.public_holiday_status]}</Row>
        <Row label="Address">
          {restaurant.street_address}, {restaurant.suburb}, Cape Town
        </Row>
        {restaurant.phone && (
          <Row label="Phone">
            <a className="text-orange font-semibold underline" href={`tel:${restaurant.phone}`}>
              {restaurant.phone}
            </a>
          </Row>
        )}
        <Row label="Last verified">{formatIsoDate(special.last_verified_at)}</Row>
      </dl>

      <div className="mt-3 grid grid-cols-2 gap-2">
        {restaurant.phone && (
          <a
            href={`tel:${restaurant.phone}`}
            className="bg-orange text-ink hover:bg-orange-dark flex min-h-[48px] items-center justify-center rounded-xl px-3 text-[15px] font-bold transition-colors"
          >
            Call
          </a>
        )}
        <a
          href={mapsUrl}
          target="_blank"
          rel="noopener noreferrer"
          className="bg-orange text-ink hover:bg-orange-dark flex min-h-[48px] items-center justify-center rounded-xl px-3 text-[15px] font-bold transition-colors"
        >
          Directions
        </a>
        {restaurant.booking_url && (
          <a
            href={restaurant.booking_url}
            target="_blank"
            rel="noopener noreferrer"
            className="border-orange text-orange hover:bg-orange-dim flex min-h-[48px] items-center justify-center rounded-xl border-2 px-3 text-[15px] font-bold transition-colors"
          >
            Book a table
          </a>
        )}
        <a
          href={special.source_url}
          target="_blank"
          rel="noopener noreferrer"
          className="border-orange text-orange hover:bg-orange-dim flex min-h-[48px] items-center justify-center rounded-xl border-2 px-3 text-center text-[14px] font-bold transition-colors"
        >
          Original source
        </a>
      </div>

      <p className="border-orange/25 bg-orange-dim mt-3 rounded-xl border px-4 py-3 text-[14px] text-white/85">
        {DISCLAIMER}
      </p>

      {reporting ? (
        <ReportForm specialId={special.id} onDone={() => setReporting(false)} />
      ) : (
        <button
          type="button"
          onClick={() => setReporting(true)}
          className="border-line bg-surface-2 text-orange mt-3 min-h-[44px] w-full rounded-xl border px-4 text-[14px] font-semibold"
        >
          Report outdated information
        </button>
      )}
    </div>
  );
}
