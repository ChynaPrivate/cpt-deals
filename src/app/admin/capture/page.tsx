'use client';

import { useCallback, useRef, useState } from 'react';
import Link from 'next/link';
import { ActionButton, ErrorText, Field, Panel, inputClass } from '@/components/admin/ui';
import { useAdminClient } from '@/components/admin/useAdminClient';
import { useAsyncData } from '@/lib/hooks/useAsyncData';
import { listRestaurants } from '@/lib/admin/api';
import { uploadPhoto } from '@/lib/admin/photos';
import { zonedNow } from '@/lib/time';
import { SUBURBS, type Restaurant, type Suburb } from '@/lib/types';

type State = 'idle' | 'saving' | 'saved';

/**
 * Capture a specials board where you are standing.
 *
 * The point is speed: photograph the board, name the place, and go. Typing the
 * offer up properly happens later at a desk, on the Research queue page, with
 * the photo alongside. Nothing captured here is ever public.
 */
export default function CapturePage() {
  const supabase = useAdminClient();
  const fileRef = useRef<HTMLInputElement>(null);

  const [file, setFile] = useState<File | null>(null);
  const [previewUrl, setPreviewUrl] = useState<string | null>(null);
  const [venue, setVenue] = useState('');
  const [suburb, setSuburb] = useState<Suburb | ''>('');
  const [note, setNote] = useState('');
  const [state, setState] = useState<State>('idle');
  const [error, setError] = useState('');

  const load = useCallback(async (): Promise<Restaurant[]> => {
    if (!supabase) throw new Error('Not signed in.');
    return listRestaurants(supabase);
  }, [supabase]);
  const { data: restaurants } = useAsyncData(load, Boolean(supabase));

  function choosePhoto(event: React.ChangeEvent<HTMLInputElement>) {
    const chosen = event.target.files?.[0] ?? null;
    setFile(chosen);
    if (previewUrl) URL.revokeObjectURL(previewUrl);
    setPreviewUrl(chosen ? URL.createObjectURL(chosen) : null);
  }

  function reset() {
    if (previewUrl) URL.revokeObjectURL(previewUrl);
    setFile(null);
    setPreviewUrl(null);
    setVenue('');
    setSuburb('');
    setNote('');
    setState('idle');
    setError('');
    if (fileRef.current) fileRef.current.value = '';
  }

  async function save(event: React.FormEvent) {
    event.preventDefault();
    if (!supabase) return;
    if (!file) return setError('Take or choose a photo of the board first.');
    if (!venue.trim()) return setError('Which restaurant is this?');

    setState('saving');
    setError('');
    try {
      const photo = await uploadPhoto(supabase, file, venue);

      // Match an existing venue by name so the reviewer does not have to.
      const match = (restaurants ?? []).find(
        (r) => r.name.toLowerCase().trim() === venue.toLowerCase().trim(),
      );

      const { error: insertError } = await supabase.from('research_queue').insert({
        restaurant_id: match?.id ?? null,
        proposed_special_data: {
          restaurant: venue.trim(),
          suburb: suburb || match?.suburb || null,
          note: note.trim() || null,
          photo_path: photo.path,
          captured_by: 'in person',
        },
        source_url: match?.website_url ?? 'https://thehappyhours.co.za/admin/capture',
        photo_url: photo.url,
        detected_at: zonedNow().date,
        confidence: 'high',
        review_status: 'pending',
        reviewer_notes: 'Photographed in the venue. Type the offers up from the photo.',
      });
      if (insertError) throw new Error(insertError.message);

      setState('saved');
    } catch (caught) {
      setError(caught instanceof Error ? caught.message : 'That did not save.');
      setState('idle');
    }
  }

  if (state === 'saved') {
    return (
      <Panel title="Saved to the research queue">
        <p className="text-[16px]">
          The photo and your note are stored. Nothing is public — it waits in the{' '}
          <Link className="text-orange font-semibold underline" href="/admin/research">
            research queue
          </Link>{' '}
          until you type the offers up and mark them verified.
        </p>
        <div className="mt-4 flex flex-wrap gap-2">
          <ActionButton onClick={reset}>Capture another</ActionButton>
          <Link
            href="/admin/research"
            className="border-line flex min-h-[44px] items-center rounded-xl border px-4 text-[15px] font-semibold"
          >
            Go to the queue
          </Link>
        </div>
      </Panel>
    );
  }

  return (
    <form onSubmit={save}>
      <Panel title="Photograph a specials board">
        <p className="text-[15px] text-white/70">
          Snap the board, say where you are, and go. You can type the offers up properly later — the
          photo will be waiting.
        </p>

        <div className="mt-4">
          <label
            htmlFor="photo"
            className="border-line bg-bg hover:border-orange/60 flex min-h-[120px] cursor-pointer flex-col items-center justify-center gap-2 rounded-2xl border-2 border-dashed px-4 py-6 text-center transition-colors"
          >
            <span aria-hidden="true" className="text-[32px] leading-none">
              📷
            </span>
            <span className="text-orange text-[16px] font-bold">
              {file ? 'Take a different photo' : 'Take a photo of the board'}
            </span>
            <span className="text-[13px] text-white/55">
              Opens the camera on a phone. Resized on your device before it uploads.
            </span>
          </label>
          <input
            ref={fileRef}
            id="photo"
            type="file"
            accept="image/*"
            capture="environment"
            onChange={choosePhoto}
            className="sr-only"
          />
        </div>

        {previewUrl && (
          <div className="border-line mt-3 overflow-hidden rounded-2xl border">
            {/* eslint-disable-next-line @next/next/no-img-element -- a local blob: preview, never optimised */}
            <img
              src={previewUrl}
              alt="The photo you just took"
              className="bg-bg max-h-[320px] w-full object-contain"
            />
          </div>
        )}

        <Field label="Restaurant" htmlFor="venue" hint="Type it as it appears on the board.">
          <input
            id="venue"
            list="known-venues"
            className={inputClass}
            value={venue}
            onChange={(e) => setVenue(e.target.value)}
            placeholder="e.g. The Woodlands Eatery"
            autoComplete="off"
          />
          <datalist id="known-venues">
            {(restaurants ?? []).map((r) => (
              <option key={r.id} value={r.name} />
            ))}
          </datalist>
        </Field>

        <Field label="Suburb" htmlFor="suburb" hint="Optional — helpful if the venue is new.">
          <select
            id="suburb"
            className={inputClass}
            value={suburb}
            onChange={(e) => setSuburb(e.target.value as Suburb)}
          >
            <option value="">Not sure</option>
            {SUBURBS.map((name) => (
              <option key={name} value={name}>
                {name}
              </option>
            ))}
          </select>
        </Field>

        <Field
          label="Anything the photo will not show"
          htmlFor="note"
          hint="Optional. A price the waiter mentioned, an end date, whether it is dine-in only."
        >
          <textarea
            id="note"
            rows={3}
            className={`${inputClass} py-2`}
            value={note}
            onChange={(e) => setNote(e.target.value)}
            placeholder="e.g. Waiter said this runs until the end of September"
          />
        </Field>

        <ErrorText message={error} />

        <div className="mt-4 flex flex-wrap gap-2">
          <ActionButton type="submit" disabled={state === 'saving'}>
            {state === 'saving' ? 'Saving…' : 'Save to the queue'}
          </ActionButton>
          {file && (
            <ActionButton tone="secondary" onClick={reset}>
              Start over
            </ActionButton>
          )}
        </div>
      </Panel>
    </form>
  );
}
