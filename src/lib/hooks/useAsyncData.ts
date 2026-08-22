'use client';

import { useCallback, useEffect, useState } from 'react';

export interface AsyncData<T> {
  data: T | null;
  error: string;
  loading: boolean;
  /** Re-run the loader, e.g. after saving a record. */
  reload: () => void;
}

/**
 * Loads data once the Supabase client is ready, and again on demand.
 *
 * Keeping the fetch here means every admin page shares one loading, error and
 * refresh path, and no page writes state directly from an effect body.
 */
export function useAsyncData<T>(load: () => Promise<T>, enabled = true): AsyncData<T> {
  const [data, setData] = useState<T | null>(null);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(true);
  const [nonce, setNonce] = useState(0);

  const reload = useCallback(() => setNonce((value) => value + 1), []);

  useEffect(() => {
    if (!enabled) return;
    let cancelled = false;

    load()
      .then((result) => {
        if (cancelled) return;
        setData(result);
        setError('');
      })
      .catch((caught: unknown) => {
        if (cancelled) return;
        setError(caught instanceof Error ? caught.message : 'Something went wrong.');
      })
      .finally(() => {
        if (!cancelled) setLoading(false);
      });

    return () => {
      cancelled = true;
    };
    // `load` is rebuilt by each page with useCallback; `nonce` forces a refresh.
  }, [load, enabled, nonce]);

  return { data, error, loading, reload };
}
