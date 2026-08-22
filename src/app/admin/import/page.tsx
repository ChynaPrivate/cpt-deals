'use client';

import { useCallback, useState } from 'react';
import { ActionButton, ErrorText, Panel, inputClass } from '@/components/admin/ui';
import { useAdminClient } from '@/components/admin/useAdminClient';
import { listRestaurants, saveSpecial } from '@/lib/admin/api';
import { CSV_TEMPLATE, csvToSpecials } from '@/lib/admin/csv';
import { useAsyncData } from '@/lib/hooks/useAsyncData';
import { zonedNow } from '@/lib/time';
import type { Restaurant } from '@/lib/types';

export default function AdminImportPage() {
  const supabase = useAdminClient();
  const [text, setText] = useState('');
  const [errors, setErrors] = useState<string[]>([]);
  const [message, setMessage] = useState('');
  const [busy, setBusy] = useState(false);
  const today = zonedNow().date;

  const load = useCallback(async (): Promise<Restaurant[]> => {
    if (!supabase) throw new Error('Not signed in.');
    return listRestaurants(supabase);
  }, [supabase]);
  const { data: restaurants } = useAsyncData(load, Boolean(supabase));

  async function importRows() {
    if (!supabase) return;
    setBusy(true);
    setMessage('');
    const { rows, errors: parseErrors } = csvToSpecials(text, today);
    const bySlug = new Map((restaurants ?? []).map((r) => [r.slug, r.id]));

    const unknown = rows
      .filter((row) => !bySlug.has(row.restaurant_slug))
      .map((row) => `Unknown restaurant_slug: ${row.restaurant_slug}`);

    const allErrors = [...parseErrors, ...new Set(unknown)];
    setErrors(allErrors);

    if (allErrors.length > 0 || rows.length === 0) {
      setBusy(false);
      return;
    }

    let saved = 0;
    try {
      for (const row of rows) {
        const { restaurant_slug, ...special } = row;
        await saveSpecial(supabase, {
          ...special,
          restaurant_id: bySlug.get(restaurant_slug)!,
        });
        saved += 1;
      }
      setMessage(
        `Imported ${saved} record${saved === 1 ? '' : 's'} as unverified. Review each one on the Specials page and mark it verified before it goes live.`,
      );
      setText('');
    } catch (caught) {
      setErrors([caught instanceof Error ? caught.message : 'Import failed.']);
    } finally {
      setBusy(false);
    }
  }

  return (
    <div className="space-y-4">
      <Panel title="Import reviewed records from CSV">
        <p className="text-[15px]">
          Paste CSV below. Every imported row lands as <strong>unverified</strong>, so nothing
          reaches the public site until you check it and mark it verified.
        </p>
        <p className="mt-2 text-[14px] text-white/60">
          Days use 1 for Monday through 7 for Sunday, separated by <code>|</code>. Lists such as
          dietary tags use the same separator.
        </p>

        <label htmlFor="csv" className="mt-3 block text-[15px] font-semibold">
          CSV content
        </label>
        <textarea
          id="csv"
          rows={10}
          className={`${inputClass} py-2 font-mono text-[13px]`}
          value={text}
          onChange={(e) => setText(e.target.value)}
          placeholder={CSV_TEMPLATE}
        />

        <div className="mt-3 flex flex-wrap gap-2">
          <ActionButton onClick={importRows} disabled={busy || text.trim() === ''}>
            {busy ? 'Importing…' : 'Validate and import'}
          </ActionButton>
          <ActionButton tone="secondary" onClick={() => setText(CSV_TEMPLATE)}>
            Load the template
          </ActionButton>
        </div>

        {message && (
          <p
            role="status"
            className="bg-orange-dim text-orange mt-3 rounded-xl px-4 py-3 text-[15px] font-semibold"
          >
            {message}
          </p>
        )}

        {errors.length > 0 && (
          <div role="alert" className="bg-orange-dim mt-3 rounded-xl px-4 py-3">
            <p className="text-[15px] font-bold">Nothing was imported. Fix these first:</p>
            <ul className="mt-2 list-disc space-y-1 pl-5 text-[14px]">
              {errors.map((error) => (
                <li key={error}>{error}</li>
              ))}
            </ul>
          </div>
        )}

        <ErrorText message="" />
      </Panel>
    </div>
  );
}
