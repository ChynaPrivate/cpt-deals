'use client';

import { useEffect, useRef, useState } from 'react';
import VenueAvatar from './VenueAvatar';
import { Pill, VerificationBadge } from './Badges';
import ReportForm from './ReportForm';
import { formatIsoDate, formatRand, formatTimeRange } from '@/lib/time';
import { freshnessLabel } from '@/lib/specials';
import {
  CATEGORY_LABELS,
  DISCLAIMER,
  WEEKDAY_NAMES,
  type SpecialWithRestaurant,
} from '@/lib/types';

interface Props {
  special: SpecialWithRestaurant | null;
  todayIso: string;
  onClose: () => void;
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

export default function SpecialDetail({ special, todayIso, onClose }: Props) {
  const dialogRef = useRef<HTMLDialogElement>(null);
  const [reporting, setReporting] = useState(false);

  useEffect(() => {
    const dialog = dialogRef.current;
    if (!dialog) return;
    if (special && !dialog.open) {
      dialog.showModal();
      setReporting(false);
    }
    if (!special && dialog.open) dialog.close();
  }, [special]);

  if (!special) {
    return <dialog ref={dialogRef} className="hidden" aria-hidden="true" />;
  }

  const price = formatRand(special.price);
  const restaurant = special.restaurant;
  const mapsUrl =
    restaurant.google_maps_url ??
    `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(
      `${restaurant.name}, ${restaurant.street_address}, ${restaurant.suburb}, Cape Town`,
    )}`;

  return (
    <dialog
      ref={dialogRef}
      onClose={onClose}
      aria-labelledby="special-detail-title"
      className="border-line bg-bg m-0 max-h-[92dvh] w-full max-w-[560px] rounded-t-[28px] border p-0 text-white backdrop:bg-black/75 sm:mx-auto sm:my-8 sm:rounded-[28px]"
      style={{ marginTop: 'auto', marginInline: 'auto' }}
    >
      <div className="max-h-[92dvh] overflow-y-auto px-5 pt-4 pb-8">
        <div className="border-line bg-bg sticky top-0 -mx-5 mb-2 flex items-start justify-between gap-3 border-b px-5 pt-1 pb-3">
          <div className="flex min-w-0 items-start gap-3">
            <VenueAvatar
              name={restaurant.name}
              categories={restaurant.categories}
              imageUrl={restaurant.image_url}
              size={40}
            />
            <div className="min-w-0">
              <p className="text-orange text-[13px] font-bold tracking-wider uppercase">
                {restaurant.name}
              </p>
              <h2 id="special-detail-title" className="text-[22px] leading-tight font-extrabold">
                {special.title}
              </h2>
            </div>
          </div>
          <button
            type="button"
            onClick={() => dialogRef.current?.close()}
            className="bg-surface-2 hover:bg-line min-h-[44px] min-w-[44px] shrink-0 rounded-full text-[20px] font-bold text-white transition-colors"
          >
            <span aria-hidden="true">×</span>
            <span className="sr-only">Close</span>
          </button>
        </div>

        <p className="text-[16px] text-white/85">{special.description}</p>

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

        <dl className="border-line bg-surface mt-4 rounded-2xl border px-4">
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

        <div className="mt-4 grid grid-cols-2 gap-2">
          {restaurant.phone && (
            <a
              href={`tel:${restaurant.phone}`}
              className="bg-orange text-ink hover:bg-orange-dark flex min-h-[52px] items-center justify-center rounded-xl px-3 text-[16px] font-bold transition-colors"
            >
              Call
            </a>
          )}
          <a
            href={mapsUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="bg-orange text-ink hover:bg-orange-dark flex min-h-[52px] items-center justify-center rounded-xl px-3 text-[16px] font-bold transition-colors"
          >
            Directions
          </a>
          {restaurant.booking_url && (
            <a
              href={restaurant.booking_url}
              target="_blank"
              rel="noopener noreferrer"
              className="border-orange text-orange hover:bg-orange-dim flex min-h-[52px] items-center justify-center rounded-xl border-2 px-3 text-[16px] font-bold transition-colors"
            >
              Book a table
            </a>
          )}
          <a
            href={special.source_url}
            target="_blank"
            rel="noopener noreferrer"
            className="border-orange text-orange hover:bg-orange-dim flex min-h-[52px] items-center justify-center rounded-xl border-2 px-3 text-center text-[15px] font-bold transition-colors"
          >
            Original source
          </a>
        </div>

        <p className="border-orange/25 bg-orange-dim mt-4 rounded-xl border px-4 py-3 text-[14px] text-white/85">
          {DISCLAIMER}
        </p>

        {reporting ? (
          <ReportForm specialId={special.id} onDone={() => setReporting(false)} />
        ) : (
          <button
            type="button"
            onClick={() => setReporting(true)}
            className="border-line bg-surface text-orange mt-4 min-h-[48px] w-full rounded-xl border px-4 text-[15px] font-semibold"
          >
            Report outdated information
          </button>
        )}
      </div>
    </dialog>
  );
}
