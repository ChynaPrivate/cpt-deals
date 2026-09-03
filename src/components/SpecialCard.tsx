'use client';

import { useId, useState } from 'react';
import VenueAvatar from './VenueAvatar';
import SpecialDetailBody from './SpecialDetailBody';
import ShareButton from './ShareButton';
import { formatRand, formatTimeRange, type ZonedNow } from '@/lib/time';
import { splitTitlePrice } from '@/lib/title-price';
import { shareMessage } from '@/lib/specials';
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
 * The whole summary is the button. A 28px circle is a small thing to hit on a
 * moving train, and people tap the card anyway — so the control is a
 * transparent overlay across the summary, and the plus is left as the visual
 * cue for what tapping will do. It brightens on hover along with the rest of
 * the card, which is how you tell the card is live without a label saying so.
 * Open, the same glyph turns 45 degrees into a close X.
 *
 * The overlay stops at the summary. Once open, the panel below holds real
 * links — call, directions, booking, the original source — and a tap meant for
 * one of those must never collapse the card instead.
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
    <li className="glass hover:border-line-bright relative overflow-hidden rounded-[var(--radius-card)] transition-colors">
      <article className="group p-4">
        {/* Everything down to the price row is one control. */}
        <div className="relative">
          <button
            type="button"
            aria-expanded={open}
            aria-controls={panelId}
            onClick={() => setOpen((value) => !value)}
            className="focus-visible:outline-orange absolute inset-0 z-10 cursor-pointer rounded-xl focus-visible:outline-2 focus-visible:outline-offset-4"
          >
            <span className="sr-only">
              {open ? 'Hide details for' : 'View details for'} {title} at {special.restaurant.name}
            </span>
          </button>

          <div className="flex items-center gap-3 pr-11">
            <VenueAvatar
              name={special.restaurant.name}
              categories={special.restaurant.categories}
              imageUrl={special.restaurant.image_url}
              size={44}
            />

            <div className="min-w-0 flex-1">
              <h3 className="text-ink text-[16px] leading-tight font-bold">
                {special.restaurant.name}
              </h3>
              {/* Short suburb name here: several street addresses already end in
                  the suburb, and "…V&A Waterfront, Victoria & Alfred Waterfront"
                  reads like a bug. Two lines is the ceiling. */}
              <p className="text-ink/70 mt-0.5 line-clamp-2 text-[13px]">
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

          {/* pr-12 clears the button stack. The header row above reserves its
              own space, but with a single-line venue name the share button
              drops level with this line instead. */}
          <h4 className="text-ink mt-3 pr-12 text-[18px] leading-snug font-extrabold tracking-tight">
            {title}
          </h4>

          {/* When it runs on the left, what it costs on the right. Everything
              else waits until the card is opened. */}
          <div className="mt-2 flex items-center justify-between gap-3">
            <span className="cutout text-ink/75 rounded-lg px-2.5 py-1 text-[12px] font-semibold">
              {when}
            </span>
            {showPrice && (
              <span className="text-accent text-[22px] leading-none font-extrabold">{price}</span>
            )}
          </div>
          {/* Sits above the summary overlay (z-20 vs z-10) so a tap here shares
              rather than opening the card. */}
          <ShareButton
            title={`${title} at ${special.restaurant.name}`}
            text={shareMessage(special)}
            path={`/s/${special.id}`}
          />

          {/* Visual cue only — the overlay button above is the real control. */}
          <span
            aria-hidden="true"
            className="pointer-events-none absolute top-0 right-0 grid h-11 w-11 place-items-center rounded-full"
          >
            <span className="sunset-fill ring-orange-deep/45 grid h-7 w-7 place-items-center rounded-full ring-1 transition-shadow group-hover:ring-2">
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
          </span>
        </div>

        {open && (
          <div id={panelId} className="mt-4">
            <SpecialDetailBody special={special} todayIso={now.date} />
          </div>
        )}
      </article>
    </li>
  );
}
