'use client';

import { useCallback, useSyncExternalStore } from 'react';

/**
 * Tracks a CSS media query. Uses useSyncExternalStore so the value is read
 * during render rather than written from an effect, and so rotating a phone
 * updates it immediately.
 *
 * Returns false during server rendering, which is the safe default for the
 * "is there room for this?" questions it answers here.
 */
export function useMediaQuery(query: string): boolean {
  const subscribe = useCallback(
    (onChange: () => void) => {
      const list = window.matchMedia(query);
      list.addEventListener('change', onChange);
      return () => list.removeEventListener('change', onChange);
    },
    [query],
  );

  const getSnapshot = useCallback(() => window.matchMedia(query).matches, [query]);

  return useSyncExternalStore(subscribe, getSnapshot, () => false);
}
