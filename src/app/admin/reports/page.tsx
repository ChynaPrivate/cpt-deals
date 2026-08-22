'use client';

import { useCallback, useState } from 'react';
import { ActionButton, ErrorText, Panel } from '@/components/admin/ui';
import { useAdminClient } from '@/components/admin/useAdminClient';
import { listReports, listSpecials, updateReport } from '@/lib/admin/api';
import { useAsyncData } from '@/lib/hooks/useAsyncData';
import { REPORT_TYPE_LABELS, type Report, type Special } from '@/lib/types';

type Payload = [Report[], Special[]];
const STATUSES: Array<Report['status']> = ['new', 'reviewing', 'resolved', 'dismissed'];

export default function AdminReportsPage() {
  const supabase = useAdminClient();
  const [actionError, setActionError] = useState('');

  const load = useCallback(async (): Promise<Payload> => {
    if (!supabase) throw new Error('Not signed in.');
    return Promise.all([listReports(supabase), listSpecials(supabase)]);
  }, [supabase]);

  const { data, error, loading, reload } = useAsyncData(load, Boolean(supabase));

  if (loading || !data) {
    return error ? (
      <ErrorText message={error} />
    ) : (
      <p className="text-[16px] text-white/60">Loading…</p>
    );
  }

  const [reports, specials] = data;

  return (
    <div className="space-y-4">
      <ErrorText message={error || actionError} />
      <Panel title={`Visitor reports (${reports.length})`}>
        {reports.length === 0 ? (
          <p className="text-[15px] text-white/60">No reports yet.</p>
        ) : (
          <ul className="space-y-3">
            {reports.map((report) => {
              const special = specials.find((s) => s.id === report.special_id);
              return (
                <li key={report.id} className="border-line rounded-xl border p-3">
                  <p className="text-[16px] font-bold">{REPORT_TYPE_LABELS[report.report_type]}</p>
                  <p className="text-[14px] text-white/60">
                    {special ? special.title : 'Special no longer present'} ·{' '}
                    {report.created_at.slice(0, 10)} · {report.status}
                  </p>
                  {report.comment && <p className="mt-1 text-[15px]">“{report.comment}”</p>}
                  <div className="mt-2 flex flex-wrap gap-2">
                    {STATUSES.filter((status) => status !== report.status).map((status) => (
                      <ActionButton
                        key={status}
                        tone="secondary"
                        onClick={async () => {
                          if (!supabase) return;
                          try {
                            await updateReport(supabase, report.id, status);
                            setActionError('');
                            reload();
                          } catch (caught) {
                            setActionError(
                              caught instanceof Error ? caught.message : 'That did not work.',
                            );
                          }
                        }}
                      >
                        Mark {status}
                      </ActionButton>
                    ))}
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
