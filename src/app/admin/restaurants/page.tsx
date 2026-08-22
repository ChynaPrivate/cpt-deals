'use client';

import { useCallback, useState } from 'react';
import { ActionButton, ErrorText, Field, Panel, inputClass } from '@/components/admin/ui';
import { useAdminClient } from '@/components/admin/useAdminClient';
import { listRestaurants, saveRestaurant } from '@/lib/admin/api';
import { useAsyncData } from '@/lib/hooks/useAsyncData';
import type { Restaurant } from '@/lib/types';

type Draft = Partial<Restaurant>;

const TEXT_FIELDS: Array<[keyof Restaurant, string, string?]> = [
  ['name', 'Name'],
  ['slug', 'Slug', 'Lower case, words separated by hyphens.'],
  ['street_address', 'Street address'],
  ['phone', 'Phone', 'International format, e.g. +27214241100.'],
  ['website_url', 'Website URL'],
  ['booking_url', 'Booking URL'],
  ['instagram_url', 'Instagram URL'],
  ['facebook_url', 'Facebook URL'],
  ['google_maps_url', 'Google Maps URL'],
  ['image_url', 'Image or logo URL'],
];

export default function AdminRestaurantsPage() {
  const supabase = useAdminClient();
  const [draft, setDraft] = useState<Draft | null>(null);
  const [actionError, setActionError] = useState('');

  const load = useCallback(async (): Promise<Restaurant[]> => {
    if (!supabase) throw new Error('Not signed in.');
    return listRestaurants(supabase);
  }, [supabase]);

  const { data: restaurants, error, loading, reload } = useAsyncData(load, Boolean(supabase));

  async function submit(event: React.FormEvent) {
    event.preventDefault();
    if (!supabase || !draft) return;
    try {
      await saveRestaurant(supabase, { suburb: 'Gardens', active: true, ...draft });
      setDraft(null);
      setActionError('');
      reload();
    } catch (caught) {
      setActionError(caught instanceof Error ? caught.message : 'Could not save.');
    }
  }

  if (loading || !restaurants) {
    return error ? (
      <ErrorText message={error} />
    ) : (
      <p className="text-[16px] text-white/60">Loading…</p>
    );
  }

  return (
    <div className="space-y-4">
      <ErrorText message={error || actionError} />

      {draft ? (
        <form onSubmit={submit} className="border-line bg-surface rounded-2xl border p-4">
          <h2 className="text-orange text-[17px] font-bold">
            {draft.id ? 'Edit restaurant' : 'Add a restaurant'}
          </h2>
          <p className="mt-1 text-[14px] text-white/60">
            Only venues physically inside Gardens may be added — the database rejects any other
            suburb.
          </p>

          {TEXT_FIELDS.map(([key, label, hint]) => (
            <Field key={key} label={label} htmlFor={`r-${key}`} hint={hint}>
              <input
                id={`r-${key}`}
                className={inputClass}
                value={(draft[key] as string) ?? ''}
                onChange={(e) => setDraft({ ...draft, [key]: e.target.value || null })}
              />
            </Field>
          ))}

          <Field label="Description" htmlFor="r-description">
            <textarea
              id="r-description"
              rows={3}
              className={`${inputClass} py-2`}
              value={draft.description ?? ''}
              onChange={(e) => setDraft({ ...draft, description: e.target.value || null })}
            />
          </Field>

          <div className="grid gap-3 sm:grid-cols-2">
            <Field label="Latitude" htmlFor="r-lat" hint="Optional — enables distance sorting.">
              <input
                id="r-lat"
                type="number"
                step="0.000001"
                className={inputClass}
                value={draft.latitude ?? ''}
                onChange={(e) =>
                  setDraft({
                    ...draft,
                    latitude: e.target.value === '' ? null : Number(e.target.value),
                  })
                }
              />
            </Field>
            <Field label="Longitude" htmlFor="r-lng">
              <input
                id="r-lng"
                type="number"
                step="0.000001"
                className={inputClass}
                value={draft.longitude ?? ''}
                onChange={(e) =>
                  setDraft({
                    ...draft,
                    longitude: e.target.value === '' ? null : Number(e.target.value),
                  })
                }
              />
            </Field>
          </div>

          <label className="mt-3 flex min-h-[44px] items-center gap-2 text-[15px]">
            <input
              type="checkbox"
              className="h-5 w-5 accent-[#FF7A1A]"
              checked={draft.active ?? true}
              onChange={(e) => setDraft({ ...draft, active: e.target.checked })}
            />
            Active
          </label>

          <div className="mt-4 flex gap-2">
            <ActionButton type="submit">Save restaurant</ActionButton>
            <ActionButton tone="secondary" onClick={() => setDraft(null)}>
              Cancel
            </ActionButton>
          </div>
        </form>
      ) : (
        <ActionButton onClick={() => setDraft({})}>Add a restaurant</ActionButton>
      )}

      <Panel title={`Restaurants (${restaurants.length})`}>
        <ul className="space-y-2">
          {restaurants.map((r) => (
            <li
              key={r.id}
              className="border-line flex flex-wrap items-center justify-between gap-2 rounded-xl border p-3"
            >
              <div>
                <p className="text-[16px] font-bold">{r.name}</p>
                <p className="text-[14px] text-white/60">
                  {r.street_address}, {r.suburb}
                  {r.active ? '' : ' · inactive'}
                  {r.latitude === null ? ' · no coordinates' : ''}
                </p>
              </div>
              <ActionButton tone="secondary" onClick={() => setDraft(r)}>
                Edit
              </ActionButton>
            </li>
          ))}
        </ul>
      </Panel>
    </div>
  );
}
