'use client';

import { useState, useSyncExternalStore } from 'react';

const STORAGE_KEY = 'gs-install-help-dismissed';

/** These read the browser, not React state, so they never change while mounted. */
const noSubscribe = () => () => {};

function isEligible(): boolean {
  try {
    if (localStorage.getItem(STORAGE_KEY) === '1') return false;
  } catch {
    // Storage blocked — show the panel this once rather than failing.
  }
  const standalone =
    window.matchMedia('(display-mode: standalone)').matches ||
    (window.navigator as Navigator & { standalone?: boolean }).standalone === true;
  return !standalone;
}

function detectPlatform(): 'ios' | 'android' | 'other' {
  const ua = window.navigator.userAgent;
  if (/iPhone|iPad|iPod/.test(ua)) return 'ios';
  if (/Android/.test(ua)) return 'android';
  return 'other';
}

/**
 * A small, dismissible panel explaining how to add the site to a phone's home
 * screen. Once dismissed it stays dismissed, and it never appears when the site
 * is already running as an installed app.
 */
export default function InstallHelp() {
  // Rendered as nothing on the server, then resolved on the client.
  const eligible = useSyncExternalStore(noSubscribe, isEligible, () => false);
  const platform = useSyncExternalStore(noSubscribe, detectPlatform, () => 'other' as const);
  const [dismissed, setDismissed] = useState(false);

  if (!eligible || dismissed) return null;

  function dismiss() {
    setDismissed(true);
    try {
      localStorage.setItem(STORAGE_KEY, '1');
    } catch {
      // Nothing to do — the panel simply reappears next visit.
    }
  }

  return (
    <aside
      aria-labelledby="install-help-title"
      className="glass mt-6 rounded-[var(--radius-card)] p-4"
    >
      <div className="flex items-start justify-between gap-3">
        <h2 id="install-help-title" className="text-accent text-[16px] font-bold">
          Add this website to your home screen
        </h2>
        <button
          type="button"
          onClick={dismiss}
          className="btn min-h-[40px] min-w-[40px] shrink-0 rounded-full text-[18px] font-bold"
        >
          <span aria-hidden="true">×</span>
          <span className="sr-only">Dismiss the home-screen help</span>
        </button>
      </div>

      <div className="text-ink/85 mt-2 space-y-2 text-[15px]">
        {platform !== 'android' && (
          <p>
            <strong>iPhone:</strong> open this page in Safari, tap the Share button, scroll down and
            tap <strong>Add to Home Screen</strong>.
          </p>
        )}
        {platform !== 'ios' && (
          <p>
            <strong>Android:</strong> tap the browser menu (⋮), then{' '}
            <strong>Add to Home screen</strong> or <strong>Install</strong>.
          </p>
        )}
      </div>

      <button
        type="button"
        onClick={dismiss}
        className="border-line mt-3 min-h-[44px] rounded-xl border px-4 text-[15px] font-semibold"
      >
        Got it
      </button>
    </aside>
  );
}
