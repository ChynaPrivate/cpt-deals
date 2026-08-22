'use client';

import { useState } from 'react';
import { ActionButton, ErrorText, Field, inputClass } from './ui';
import { zonedNow } from '@/lib/time';
import {
  SPECIAL_CATEGORIES,
  CATEGORY_LABELS,
  WEEKDAYS,
  WEEKDAY_NAMES,
  type DietaryTag,
  type Restaurant,
  type Special,
  type Weekday,
} from '@/lib/types';

const SOURCE_TYPES = [
  'official_website',
  'official_menu',
  'booking_page',
  'google_business',
  'publication',
  'social',
] as const;

const DIETARY: DietaryTag[] = ['vegetarian', 'vegan', 'halaal'];

export type SpecialDraft = Partial<Special>;

export default function SpecialForm({
  initial,
  restaurants,
  onSave,
  onCancel,
}: {
  initial: SpecialDraft;
  restaurants: Restaurant[];
  onSave: (draft: SpecialDraft) => Promise<void>;
  onCancel: () => void;
}) {
  const [draft, setDraft] = useState<SpecialDraft>({
    category: 'food',
    days_of_week: [],
    dietary_tags: [],
    source_type: 'official_website',
    verification_status: 'unverified',
    public_holiday_status: 'unknown',
    booking_required: false,
    featured: false,
    active: true,
    last_verified_at: zonedNow().date,
    ...initial,
  });
  const [error, setError] = useState('');
  const [busy, setBusy] = useState(false);

  function set<K extends keyof Special>(key: K, value: Special[K] | null) {
    setDraft((current) => ({ ...current, [key]: value }));
  }

  function toggleDay(day: Weekday) {
    const days = draft.days_of_week ?? [];
    set(
      'days_of_week',
      (days.includes(day) ? days.filter((d) => d !== day) : [...days, day]).sort() as Weekday[],
    );
  }

  function toggleDiet(tag: DietaryTag) {
    const tags = draft.dietary_tags ?? [];
    set('dietary_tags', tags.includes(tag) ? tags.filter((t) => t !== tag) : [...tags, tag]);
  }

  async function submit(event: React.FormEvent) {
    event.preventDefault();
    if (!draft.restaurant_id) return setError('Choose a restaurant.');
    if (!draft.title?.trim()) return setError('Give the special a short title.');
    if (!draft.description?.trim()) return setError('Describe the offer.');
    if (!draft.days_of_week?.length) return setError('Select at least one day.');
    if (!draft.source_url?.trim()) return setError('A source URL is required for every special.');
    if (Boolean(draft.start_time) !== Boolean(draft.end_time)) {
      return setError('Enter both a start and an end time, or neither.');
    }
    setBusy(true);
    setError('');
    try {
      await onSave(draft);
    } catch (caught) {
      setError(caught instanceof Error ? caught.message : 'Could not save.');
    } finally {
      setBusy(false);
    }
  }

  return (
    <form onSubmit={submit} className="border-line bg-surface rounded-2xl border p-4">
      <h2 className="text-orange text-[17px] font-bold">
        {draft.id ? 'Edit special' : 'Add a special'}
      </h2>

      <Field label="Restaurant" htmlFor="sp-restaurant">
        <select
          id="sp-restaurant"
          className={inputClass}
          value={draft.restaurant_id ?? ''}
          onChange={(e) => set('restaurant_id', e.target.value)}
        >
          <option value="">Choose…</option>
          {restaurants.map((r) => (
            <option key={r.id} value={r.id}>
              {r.name}
            </option>
          ))}
        </select>
      </Field>

      <Field label="Short title" htmlFor="sp-title">
        <input
          id="sp-title"
          className={inputClass}
          value={draft.title ?? ''}
          onChange={(e) => set('title', e.target.value)}
        />
      </Field>

      <Field
        label="Offer description"
        htmlFor="sp-description"
        hint="Write it in your own words rather than copying the restaurant's post."
      >
        <textarea
          id="sp-description"
          rows={3}
          className={`${inputClass} py-2`}
          value={draft.description ?? ''}
          onChange={(e) => set('description', e.target.value)}
        />
      </Field>

      <div className="grid gap-3 sm:grid-cols-2">
        <Field label="Price (R)" htmlFor="sp-price" hint="Leave empty for a discount offer.">
          <input
            id="sp-price"
            type="number"
            min={0}
            step="0.01"
            className={inputClass}
            value={draft.price ?? ''}
            onChange={(e) => set('price', e.target.value === '' ? null : Number(e.target.value))}
          />
        </Field>
        <Field label="Usual price (R)" htmlFor="sp-original">
          <input
            id="sp-original"
            type="number"
            min={0}
            step="0.01"
            className={inputClass}
            value={draft.original_price ?? ''}
            onChange={(e) =>
              set('original_price', e.target.value === '' ? null : Number(e.target.value))
            }
          />
        </Field>
      </div>

      <Field label="Category" htmlFor="sp-category">
        <select
          id="sp-category"
          className={inputClass}
          value={draft.category}
          onChange={(e) => set('category', e.target.value as Special['category'])}
        >
          {SPECIAL_CATEGORIES.map((c) => (
            <option key={c} value={c}>
              {CATEGORY_LABELS[c]}
            </option>
          ))}
        </select>
      </Field>

      <fieldset className="mt-3">
        <legend className="text-[15px] font-semibold">Days it runs</legend>
        <div className="mt-1 flex flex-wrap gap-2">
          {WEEKDAYS.map((day) => {
            const on = (draft.days_of_week ?? []).includes(day);
            return (
              <label
                key={day}
                className={`min-h-[44px] cursor-pointer rounded-xl border px-3 py-2 text-[15px] font-semibold ${
                  on ? 'border-orange bg-orange text-ink' : 'border-line bg-bg'
                }`}
              >
                <input
                  type="checkbox"
                  className="sr-only"
                  checked={on}
                  onChange={() => toggleDay(day)}
                />
                {WEEKDAY_NAMES[day]}
              </label>
            );
          })}
        </div>
      </fieldset>

      <fieldset className="mt-3">
        <legend className="text-[15px] font-semibold">Dietary tags</legend>
        <div className="mt-1 flex flex-wrap gap-2">
          {DIETARY.map((tag) => {
            const on = (draft.dietary_tags ?? []).includes(tag);
            return (
              <label
                key={tag}
                className={`min-h-[44px] cursor-pointer rounded-xl border px-3 py-2 text-[15px] font-semibold ${
                  on ? 'border-orange bg-orange text-ink' : 'border-line bg-bg'
                }`}
              >
                <input
                  type="checkbox"
                  className="sr-only"
                  checked={on}
                  onChange={() => toggleDiet(tag)}
                />
                {tag}
              </label>
            );
          })}
        </div>
      </fieldset>

      <div className="grid gap-3 sm:grid-cols-2">
        <Field label="Starts at" htmlFor="sp-start" hint="Leave both blank for all day.">
          <input
            id="sp-start"
            type="time"
            className={inputClass}
            value={draft.start_time ?? ''}
            onChange={(e) => set('start_time', e.target.value || null)}
          />
        </Field>
        <Field label="Ends at" htmlFor="sp-end">
          <input
            id="sp-end"
            type="time"
            className={inputClass}
            value={draft.end_time ?? ''}
            onChange={(e) => set('end_time', e.target.value || null)}
          />
        </Field>
        <Field label="Valid from" htmlFor="sp-from">
          <input
            id="sp-from"
            type="date"
            className={inputClass}
            value={draft.valid_from ?? ''}
            onChange={(e) => set('valid_from', e.target.value || null)}
          />
        </Field>
        <Field label="Valid until" htmlFor="sp-until" hint="Blank means no published end date.">
          <input
            id="sp-until"
            type="date"
            className={inputClass}
            value={draft.valid_until ?? ''}
            onChange={(e) => set('valid_until', e.target.value || null)}
          />
        </Field>
      </div>

      <Field label="Terms and exclusions" htmlFor="sp-terms">
        <textarea
          id="sp-terms"
          rows={2}
          className={`${inputClass} py-2`}
          value={draft.terms ?? ''}
          onChange={(e) => set('terms', e.target.value || null)}
        />
      </Field>

      <div className="mt-3 flex flex-wrap gap-4">
        <label className="flex min-h-[44px] items-center gap-2 text-[15px]">
          <input
            type="checkbox"
            className="h-5 w-5 accent-[#FF7A1A]"
            checked={draft.booking_required ?? false}
            onChange={(e) => set('booking_required', e.target.checked)}
          />
          Booking required
        </label>
        <label className="flex min-h-[44px] items-center gap-2 text-[15px]">
          <input
            type="checkbox"
            className="h-5 w-5 accent-[#FF7A1A]"
            checked={draft.featured ?? false}
            onChange={(e) => set('featured', e.target.checked)}
          />
          Feature this special
        </label>
        <label className="flex min-h-[44px] items-center gap-2 text-[15px]">
          <input
            type="checkbox"
            className="h-5 w-5 accent-[#FF7A1A]"
            checked={draft.active ?? true}
            onChange={(e) => set('active', e.target.checked)}
          />
          Active (uncheck to pause or archive)
        </label>
      </div>

      <Field label="Public holidays" htmlFor="sp-holiday">
        <select
          id="sp-holiday"
          className={inputClass}
          value={draft.public_holiday_status}
          onChange={(e) =>
            set('public_holiday_status', e.target.value as Special['public_holiday_status'])
          }
        >
          <option value="unknown">Not stated by the restaurant</option>
          <option value="valid">Also runs on public holidays</option>
          <option value="not_valid">Does not run on public holidays</option>
        </select>
      </Field>

      <Field label="Original source URL" htmlFor="sp-source">
        <input
          id="sp-source"
          type="url"
          className={inputClass}
          value={draft.source_url ?? ''}
          onChange={(e) => set('source_url', e.target.value)}
        />
      </Field>

      <div className="grid gap-3 sm:grid-cols-3">
        <Field label="Source type" htmlFor="sp-source-type">
          <select
            id="sp-source-type"
            className={inputClass}
            value={draft.source_type}
            onChange={(e) => set('source_type', e.target.value as Special['source_type'])}
          >
            {SOURCE_TYPES.map((t) => (
              <option key={t} value={t}>
                {t.replace(/_/g, ' ')}
              </option>
            ))}
          </select>
        </Field>
        <Field label="Source published" htmlFor="sp-source-date">
          <input
            id="sp-source-date"
            type="date"
            className={inputClass}
            value={draft.source_published_at ?? ''}
            onChange={(e) => set('source_published_at', e.target.value || null)}
          />
        </Field>
        <Field label="Last verified" htmlFor="sp-verified-date">
          <input
            id="sp-verified-date"
            type="date"
            className={inputClass}
            value={draft.last_verified_at ?? ''}
            onChange={(e) => set('last_verified_at', e.target.value)}
          />
        </Field>
      </div>

      <Field
        label="Verification status"
        htmlFor="sp-status"
        hint="Only “verified” specials are shown to the public."
      >
        <select
          id="sp-status"
          className={inputClass}
          value={draft.verification_status}
          onChange={(e) =>
            set('verification_status', e.target.value as Special['verification_status'])
          }
        >
          <option value="unverified">Unverified</option>
          <option value="verified">Verified — publish</option>
          <option value="needs_recheck">Needs re-checking</option>
          <option value="rejected">Rejected</option>
        </select>
      </Field>

      <ErrorText message={error} />

      <div className="mt-4 flex gap-2">
        <ActionButton type="submit" disabled={busy}>
          {busy ? 'Saving…' : 'Save special'}
        </ActionButton>
        <ActionButton tone="secondary" onClick={onCancel}>
          Cancel
        </ActionButton>
      </div>
    </form>
  );
}
