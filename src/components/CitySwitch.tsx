'use client';

import { useCallback, useEffect, useRef } from 'react';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { CITIES, cityPath, type City } from '@/lib/cities';

/**
 * The city strip under the logo — a horizontal scroller, one slot a city.
 *
 * The current city sits in the middle, full size and dark. The next one shows
 * small and faded at the edge, which is the whole point: a flat row of names
 * reads as decoration, whereas something half off the edge reads as "there is
 * more over here" and invites the swipe.
 *
 * Settling on a city navigates to it. That is the behaviour people expect from
 * a strip like this — a camera app's mode switcher works the same way — and it
 * is why the slots are fixed width and snap to centre rather than laid out
 * naturally: "which city is centred" has to be unambiguous if it decides where
 * you end up.
 *
 * Every slot is still a real link, so this works with JavaScript off, with a
 * keyboard, and for a screen reader, none of which involve scrolling at all.
 */

/** Slot width in px. Fixed so the centre of each is trivially computable. */
const SLOT = 160;

export function cityForPath(pathname: string): City {
  // "/plett" and "/plett/anything" are Plett; everything else is Cape Town,
  // including /s/<id>, /privacy and /terms, which are not city pages.
  const match = CITIES.find(
    (city) =>
      city.slug !== '' && (pathname === `/${city.slug}` || pathname.startsWith(`/${city.slug}/`)),
  );
  return match ?? CITIES[0];
}

export default function CitySwitch() {
  const pathname = usePathname() ?? '/';
  const router = useRouter();
  const current = cityForPath(pathname);
  const currentIndex = CITIES.findIndex((city) => city.name === current.name);

  const scroller = useRef<HTMLDivElement | null>(null);
  const settleTimer = useRef<number | null>(null);
  /*
    Centring the current city on mount fires a scroll event, which would look
    exactly like the reader swiping and bounce them straight back. This flag
    swallows scroll handling until the programmatic scroll has finished.
  */
  const ignoreScroll = useRef(true);

  /*
    Put a slot in the middle of the strip.

    The leading spacer is exactly (clientWidth/2 - SLOT/2) wide, which is what
    lets the first slot reach the centre at all. Substitute that in and the
    whole thing collapses: slot i is centred when scrollLeft is i * SLOT. An
    earlier version left the spacer out of the arithmetic and quietly centred
    the wrong thing — the strip stayed on Cape Town after navigating to Plett.
  */
  const centreOn = useCallback((index: number, smooth: boolean) => {
    const el = scroller.current;
    if (!el) return;
    el.scrollTo({ left: index * SLOT, behavior: smooth ? 'smooth' : 'auto' });
  }, []);

  // Centre the current city whenever the route changes, without animating —
  // the page has just replaced itself, so a slide would be describing motion
  // that did not happen.
  useEffect(() => {
    ignoreScroll.current = true;
    centreOn(currentIndex, false);
    const released = window.setTimeout(() => {
      ignoreScroll.current = false;
    }, 120);
    return () => window.clearTimeout(released);
  }, [centreOn, currentIndex]);

  function onScroll() {
    if (ignoreScroll.current) return;
    window.clearTimeout(settleTimer.current ?? undefined);
    // Wait for the scroll to stop before deciding anything. Reading the
    // position mid-flick would navigate on a city the reader is scrolling past.
    settleTimer.current = window.setTimeout(() => {
      const el = scroller.current;
      if (!el) return;
      // The inverse of centreOn: slot i is centred at scrollLeft i * SLOT.
      const index = Math.round(el.scrollLeft / SLOT);
      const landed = CITIES[Math.min(CITIES.length - 1, Math.max(0, index))];
      if (landed && landed.name !== current.name) {
        ignoreScroll.current = true;
        router.push(cityPath(landed));
      }
    }, 160);
  }

  useEffect(() => () => window.clearTimeout(settleTimer.current ?? undefined), []);

  return (
    <nav aria-label="Choose a city" className="mt-1.5">
      <div
        ref={scroller}
        onScroll={onScroll}
        className="no-scrollbar flex snap-x snap-mandatory overflow-x-auto overscroll-x-contain"
      >
        {/* Spacers let the first and last slot reach the middle of the strip. */}
        <div
          aria-hidden="true"
          className="shrink-0"
          style={{ width: `calc(50% - ${SLOT / 2}px)` }}
        />

        {CITIES.map((city) => {
          const isCurrent = city.name === current.name;
          return (
            <Link
              key={city.name}
              href={cityPath(city)}
              aria-current={isCurrent ? 'page' : undefined}
              onClick={() => {
                // A tap is unambiguous, so skip the settle logic entirely.
                ignoreScroll.current = true;
              }}
              style={{ width: SLOT }}
              className={[
                'flex shrink-0 snap-center items-center justify-center',
                // Tall enough to be a real target even though the text is tiny.
                'min-h-[32px] px-1 text-center font-bold whitespace-nowrap uppercase',
                'transition-[color,font-size,opacity] duration-200',
                isCurrent
                  ? 'text-ink/85 text-[12px] tracking-[0.28em]'
                  : 'text-ink/35 text-[10px] tracking-[0.2em]',
              ].join(' ')}
            >
              {city.label}
            </Link>
          );
        })}

        <div
          aria-hidden="true"
          className="shrink-0"
          style={{ width: `calc(50% - ${SLOT / 2}px)` }}
        />
      </div>
    </nav>
  );
}

/** The footer's one-line description of what the current city's page covers. */
export function CityBlurb() {
  const pathname = usePathname() ?? '/';
  return <>{cityForPath(pathname).blurb}</>;
}
