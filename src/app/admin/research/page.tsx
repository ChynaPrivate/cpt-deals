'use client';

import { useCallback, useEffect, useState } from 'react';
import { ActionButton, ErrorText, Panel, inputClass } from '@/components/admin/ui';
import { useAdminClient } from '@/components/admin/useAdminClient';
import { listResearchQueue, updateResearchItem } from '@/lib/admin/api';
import { pathFromPhotoUrl, signedPhotoUrl } from '@/lib/admin/photos';
import { useAsyncData } from '@/lib/hooks/useAsyncData';
import type { ResearchQueueItem } from '@/lib/types';

export default function AdminResearchPage() {
  const supabase = useAdminClient();
  const [notes, setNotes] = useState<Record<string, string>>({});
  const [actionError, setActionError] = useState('');
  // Photos live in a private bucket, so each needs a short-lived signed URL.
  const [photos, setPhotos] = useState<Record<string, string>>({});

  const load = useCallback(async (): Promise<ResearchQueueItem[]> => {
    if (!supabase) throw new Error('Not signed in.');
    return listResearchQueue(supabase);
  }, [supabase]);

  const { data: items, error, loading, reload } = useAsyncData(load, Boolean(supabase));

  useEffect(() => {
    if (!supabase || !items) return;
    let cancelled = false;
    const withPhotos = items.filter((item) => item.photo_url);
    if (withPhotos.length === 0) return;

    Promise.all(
      withPhotos.map(async (item) => {
        const path = pathFromPhotoUrl(item.photo_url);
        if (!path) return null;
        const url = await signedPhotoUrl(supabase, path);
        return url ? ([item.id, url] as const) : null;
      }),
    ).then((pairs) => {
      if (cancelled) return;
      setPhotos(Object.fromEntries(pairs.filter((pair) => pair !== null)));
    });

    return () => {
      cancelled = true;
    };
  }, [supabase, items]);

  async function setStatus(
    item: ResearchQueueItem,
    review_status: ResearchQueueItem['review_status'],
  ) {
    if (!supabase) return;
    try {
      await updateResearchItem(supabase, item.id, {
        review_status,
        reviewer_notes: notes[item.id] ?? item.reviewer_notes,
      });
      setActionError('');
      reload();
    } catch (caught) {
      setActionError(caught instanceof Error ? caught.message : 'That did not work.');
    }
  }

  if (loading || !items) {
    return error ? (
      <ErrorText message={error} />
    ) : (
      <p className="text-[16px] text-white/60">Loading…</p>
    );
  }

  return (
    <div className="space-y-4">
      <ErrorText message={error || actionError} />
      <p className="bg-orange-dim rounded-xl px-4 py-3 text-[14px]">
        Nothing here is public. Approving a candidate only records your decision — create the
        special on the Specials page once you have confirmed it with the restaurant or an official
        source.
      </p>

      <Panel title={`Research candidates (${items.length})`}>
        {items.length === 0 ? (
          <p className="text-[15px] text-white/60">The queue is empty.</p>
        ) : (
          <ul className="space-y-3">
            {items.map((item) => {
              const proposed = item.proposed_special_data;
              return (
                <li key={item.id} className="border-line rounded-xl border p-3">
                  <p className="text-[16px] font-bold">
                    {String(proposed.restaurant ?? 'Unknown venue')} —{' '}
                    {String(proposed.title ?? '')}
                  </p>
                  <p className="text-[14px] text-white/60">
                    {String(proposed.street_address ?? '')} · confidence {item.confidence} ·{' '}
                    {item.review_status} · found {item.detected_at}
                  </p>
                  {typeof proposed.note === 'string' && proposed.note && (
                    <p className="mt-1 text-[15px]">{proposed.note}</p>
                  )}

                  {photos[item.id] && (
                    <a
                      href={photos[item.id]}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="border-line mt-2 block overflow-hidden rounded-xl border"
                    >
                      {/* eslint-disable-next-line @next/next/no-img-element -- signed URL from private storage */}
                      <img
                        src={photos[item.id]}
                        alt={`Specials board photographed at ${String(proposed.restaurant ?? 'this venue')}`}
                        className="bg-bg max-h-[420px] w-full object-contain"
                      />
                      <span className="block px-3 py-2 text-[13px] text-white/55">
                        Tap to open full size
                      </span>
                    </a>
                  )}
                  <p className="mt-1 text-[14px]">
                    <a
                      className="text-orange font-semibold underline"
                      href={item.source_url}
                      target="_blank"
                      rel="noopener noreferrer"
                    >
                      Open the source
                    </a>
                  </p>

                  <label
                    htmlFor={`note-${item.id}`}
                    className="mt-2 block text-[15px] font-semibold"
                  >
                    Reviewer notes
                  </label>
                  <textarea
                    id={`note-${item.id}`}
                    rows={2}
                    className={`${inputClass} py-2`}
                    value={notes[item.id] ?? item.reviewer_notes ?? ''}
                    onChange={(e) => setNotes({ ...notes, [item.id]: e.target.value })}
                  />

                  <div className="mt-2 flex flex-wrap gap-2">
                    <ActionButton onClick={() => setStatus(item, 'approved')}>
                      Confirmed — ready to publish
                    </ActionButton>
                    <ActionButton
                      tone="secondary"
                      onClick={() => setStatus(item, 'needs_more_evidence')}
                    >
                      Needs more evidence
                    </ActionButton>
                    <ActionButton tone="danger" onClick={() => setStatus(item, 'rejected')}>
                      Reject
                    </ActionButton>
                  </div>
                </li>
              );
            })}
          </ul>
        )}
      </Panel>
    </div>
  );
}
