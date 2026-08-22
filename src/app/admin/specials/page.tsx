'use client';

import { useCallback, useState } from 'react';
import SpecialForm, { type SpecialDraft } from '@/components/admin/SpecialForm';
import { ActionButton, ErrorText, Panel } from '@/components/admin/ui';
import { useAdminClient } from '@/components/admin/useAdminClient';
import {
  listRestaurants,
  listSpecials,
  saveSpecial,
  setSpecialFlags,
  verifySpecial,
} from '@/lib/admin/api';
import { useAsyncData } from '@/lib/hooks/useAsyncData';
import { formatIsoDate, zonedNow } from '@/lib/time';
import { WEEKDAY_SHORT, type Restaurant, type Special } from '@/lib/types';

type Payload = [Special[], Restaurant[]];

export default function AdminSpecialsPage() {
  const supabase = useAdminClient();
  const [editing, setEditing] = useState<SpecialDraft | null>(null);
  const [actionError, setActionError] = useState('');
  const today = zonedNow().date;

  const load = useCallback(async (): Promise<Payload> => {
    if (!supabase) throw new Error('Not signed in.');
    return Promise.all([listSpecials(supabase), listRestaurants(supabase)]);
  }, [supabase]);

  const { data, error, loading, reload } = useAsyncData(load, Boolean(supabase));

  async function run(action: () => Promise<void>) {
    try {
      await action();
      setActionError('');
      reload();
    } catch (caught) {
      setActionError(caught instanceof Error ? caught.message : 'That did not work.');
    }
  }

  if (loading || !data) {
    return error ? (
      <ErrorText message={error} />
    ) : (
      <p className="text-[16px] text-white/60">Loading…</p>
    );
  }

  const [specials, restaurants] = data;

  return (
    <div className="space-y-4">
      <ErrorText message={error || actionError} />

      {editing ? (
        <SpecialForm
          initial={editing}
          restaurants={restaurants}
          onCancel={() => setEditing(null)}
          onSave={async (draft) => {
            if (!supabase) return;
            await saveSpecial(supabase, draft);
            setEditing(null);
            reload();
          }}
        />
      ) : (
        <ActionButton onClick={() => setEditing({})}>Add a special</ActionButton>
      )}

      <Panel title={`All specials (${specials.length})`}>
        <ul className="space-y-3">
          {specials.map((special) => {
            const venue = restaurants.find((r) => r.id === special.restaurant_id);
            return (
              <li key={special.id} className="border-line rounded-xl border p-3">
                <p className="text-[13px] font-semibold tracking-wide text-white/60 uppercase">
                  {venue?.name ?? 'Unknown venue'}
                </p>
                <p className="text-[16px] font-bold">{special.title}</p>
                <p className="text-[14px] text-white/60">
                  {special.days_of_week.map((d) => WEEKDAY_SHORT[d]).join(', ')} ·{' '}
                  {special.verification_status}
                  {special.active ? '' : ' · paused'}
                  {special.featured ? ' · featured' : ''} · verified{' '}
                  {formatIsoDate(special.last_verified_at)}
                  {special.valid_until ? ` · ends ${formatIsoDate(special.valid_until)}` : ''}
                </p>
                <div className="mt-2 flex flex-wrap gap-2">
                  <ActionButton tone="secondary" onClick={() => setEditing(special)}>
                    Edit
                  </ActionButton>
                  <ActionButton
                    onClick={() => run(() => verifySpecial(supabase!, special.id, today))}
                  >
                    Mark verified today
                  </ActionButton>
                  <ActionButton
                    tone="secondary"
                    onClick={() =>
                      run(() =>
                        setSpecialFlags(supabase!, special.id, { featured: !special.featured }),
                      )
                    }
                  >
                    {special.featured ? 'Unfeature' : 'Feature'}
                  </ActionButton>
                  <ActionButton
                    tone="danger"
                    onClick={() =>
                      run(() => setSpecialFlags(supabase!, special.id, { active: !special.active }))
                    }
                  >
                    {special.active ? 'Pause / archive' : 'Restore'}
                  </ActionButton>
                </div>
              </li>
            );
          })}
        </ul>
      </Panel>
    </div>
  );
}
