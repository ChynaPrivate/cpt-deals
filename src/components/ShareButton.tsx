'use client';

import { useEffect, useRef, useState } from 'react';

interface Props {
  /** Ready-made message, without the link. */
  text: string;
  /** What to say in the share sheet's title slot. */
  title: string;
  /** Site-relative path the link should open, e.g. "/s/<id>". */
  path: string;
}

type State = 'idle' | 'copied' | 'failed';

/**
 * Share one special to WhatsApp, Messages, or wherever else the phone offers.
 *
 * `navigator.share` is the whole point: on a phone it opens the same sheet the
 * rest of the OS uses, so the offer lands in a WhatsApp thread in two taps. It
 * needs a secure context and a real user gesture, both of which we have.
 *
 * Desktop browsers mostly do not implement it, so the fallback copies the same
 * message to the clipboard and says so. That is a real outcome rather than a
 * dead button — someone on a laptop can still paste it into Slack.
 *
 * Cancelling the sheet throws AbortError. That is a person changing their mind,
 * not a failure, so it is swallowed silently.
 */
export default function ShareButton({ text, title, path }: Props) {
  const [state, setState] = useState<State>('idle');
  const timer = useRef<number | null>(null);

  useEffect(() => () => window.clearTimeout(timer.current ?? undefined), []);

  function flash(next: State) {
    setState(next);
    window.clearTimeout(timer.current ?? undefined);
    timer.current = window.setTimeout(() => setState('idle'), 2000);
  }

  async function share(event: React.MouseEvent) {
    // The whole card summary is a toggle; this must not open it as well.
    event.stopPropagation();

    // Origin is read at click time rather than passed in, so a preview deploy
    // shares its own address instead of pointing people at production.
    const url = `${window.location.origin}${path}`;
    const message = `${text}\n\nFound on The Happy Hours:`;

    if (navigator.share) {
      try {
        await navigator.share({ title, text: message, url });
        return;
      } catch (error) {
        // Someone tapped Cancel. Not a failure, and not worth a message.
        if (error instanceof DOMException && error.name === 'AbortError') return;
        // Anything else falls through to the clipboard.
      }
    }

    try {
      await navigator.clipboard.writeText(`${message}\n${url}`);
      flash('copied');
    } catch {
      flash('failed');
    }
  }

  return (
    <button
      type="button"
      onClick={share}
      // z-20 clears the summary's own tap-to-expand overlay, which sits at z-10.
      className="group/share absolute top-11 right-0 z-20 grid h-11 w-11 place-items-center rounded-full"
    >
      <span
        aria-hidden="true"
        className={`grid h-7 w-7 place-items-center rounded-full transition-colors ${
          state === 'copied'
            ? 'sunset-fill'
            : 'glass-2 text-ink/75 group-hover/share:text-ink group-hover/share:bg-white/80'
        }`}
      >
        {state === 'copied' ? (
          <svg viewBox="0 0 24 24" className="h-4 w-4">
            <path
              d="M5 13l4 4L19 7"
              fill="none"
              stroke="currentColor"
              strokeWidth="2.8"
              strokeLinecap="round"
              strokeLinejoin="round"
            />
          </svg>
        ) : (
          /* Three connected nodes — reads as "share" on both iOS and Android,
             and stays legible at this size in a way the box-and-arrow does not. */
          <svg viewBox="0 0 24 24" className="h-4 w-4">
            <g fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
              <circle cx="18" cy="5" r="2.6" />
              <circle cx="6" cy="12" r="2.6" />
              <circle cx="18" cy="19" r="2.6" />
              <path d="M8.4 10.8 15.7 6.4M8.4 13.2l7.3 4.4" />
            </g>
          </svg>
        )}
      </span>

      {/* aria-live so a screen reader hears the clipboard result, which is
          otherwise a purely visual change. */}
      <span aria-live="polite" className="sr-only">
        {state === 'copied'
          ? 'Link copied'
          : state === 'failed'
            ? 'Could not share'
            : `Share ${title}`}
      </span>
    </button>
  );
}
