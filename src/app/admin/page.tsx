'use client';

import { useCallback } from 'react';
import Link from 'next/link';
import { Panel, Stat } from '@/components/admin/ui';
import { useAdminClient } from '@/components/admin/useAdminClient';
import { findDuplicates, listReports, listResearchQueue, listSpecials } from '@/lib/admin/api';
import { useAsyncData } from '@/lib/hooks/useAsyncData';
import { formatIsoDate, isExpiringSoon, needsRecheck, zonedNow } from '@/lib/time';
import type { Report, ResearchQueueItem, Special } from '@/lib/types';

type Overview = [Special[], Report[], ResearchQueueItem[]];

export default function AdminOverview() {
  const supabase = useAdminClient();
  const today = zonedNow().date;

  const load = useCallback(async (): Promise<Overview> => {
    if (!supabase) throw new Error('Not signed in.');
    return Promise.all([
      listSpecials(supabase),
      listReports(supabase),
      listResearchQueue(supabase),
    ]);
  }, [supabase]);

  const { data, error, loading } = useAsyncData(load, Boolean(supabase));

  if (loading || !data) {
    return error ? (
      <p role="alert" className="text-orange text-[16px]">
        {error}
      </p>
    ) : (
      <p className="text-[16px] text-white/60">Loading…</p>
    );
  }

  const [specials, reports, queue] = data;
  const live = specials.filter((s) => s.active && s.verification_status === 'verified');
  const expiring = live.filter((s) => isExpiringSoon(s, today));
  const stale = live.filter((s) => needsRecheck(s, today));
  const duplicates = findDuplicates(specials);
  const newReports = reports.filter((r) => r.status === 'new');
  const pendingQueue = queue.filter((q) => q.review_status === 'pending');

  return (
    <div className="space-y-4">
      <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
        <Stat label="Live specials" value={live.length} />
        <Stat label="Expiring soon" value={expiring.length} />
        <Stat label="Need re-checking" value={stale.length} />
        <Stat label="New reports" value={newReports.length} />
      </div>

      <Panel title="Expiring within seven days">
        {expiring.length === 0 ? (
          <p className="text-[15px] text-white/60">Nothing ends in the next week.</p>
        ) : (
          <ul className="space-y-2">
            {expiring.map((s) => (
              <li key={s.id} className="text-[15px]">
                <strong>{s.title}</strong> — ends {formatIsoDate(s.valid_until)}
              </li>
            ))}
          </ul>
        )}
      </Panel>

      <Panel title="Not checked in the last 30 days">
        {stale.length === 0 ? (
          <p className="text-[15px] text-white/60">Everything live has been checked recently.</p>
        ) : (
          <ul className="space-y-2">
            {stale.map((s) => (
              <li key={s.id} className="text-[15px]">
                <strong>{s.title}</strong> — last checked {formatIsoDate(s.last_verified_at)}
              </li>
            ))}
          </ul>
        )}
        <p className="mt-3 text-[14px] text-white/60">
          Re-check these on the{' '}
          <Link className="font-semibold underline" href="/admin/specials">
            Specials
          </Link>{' '}
          page.
        </p>
      </Panel>

      <Panel title="Possible duplicates">
        {duplicates.length === 0 ? (
          <p className="text-[15px] text-white/60">No likely duplicates found.</p>
        ) : (
          <ul className="space-y-2">
            {duplicates.map(([a, b]) => (
              <li key={`${a.id}-${b.id}`} className="text-[15px]">
                “{a.title}” looks like “{b.title}” at the same venue.
              </li>
            ))}
          </ul>
        )}
      </Panel>

      <Panel title="Research candidates awaiting review">
        <p className="text-[15px]">
          {pendingQueue.length} candidate{pendingQueue.length === 1 ? '' : 's'} waiting.{' '}
          <Link className="font-semibold underline" href="/admin/research">
            Open the queue
          </Link>
          .
        </p>
        <p className="mt-2 text-[14px] text-white/60">
          Nothing found by research is ever published automatically — it lands here first.
        </p>
      </Panel>
    </div>
  );
}
