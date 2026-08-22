'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';
import {
  NotConfiguredPanel,
  PendingApprovalPanel,
  SignInPanel,
  useAdminSession,
} from '@/components/admin/AuthGate';

const NAV = [
  { href: '/admin', label: 'Overview' },
  { href: '/admin/capture', label: 'Capture' },
  { href: '/admin/specials', label: 'Specials' },
  { href: '/admin/restaurants', label: 'Restaurants' },
  { href: '/admin/research', label: 'Research queue' },
  { href: '/admin/reports', label: 'Reports' },
  { href: '/admin/import', label: 'CSV import' },
];

export default function AdminLayout({ children }: { children: React.ReactNode }) {
  const state = useAdminSession();
  const pathname = usePathname();

  if (state.kind === 'loading') {
    return <p className="py-10 text-center text-[16px] text-white/60">Loading the dashboard…</p>;
  }
  if (state.kind === 'not_configured') return <NotConfiguredPanel />;
  if (state.kind === 'signed_out') return <SignInPanel supabase={state.supabase} />;
  if (state.kind === 'pending_approval') {
    return <PendingApprovalPanel email={state.email} supabase={state.supabase} />;
  }

  return (
    <div>
      <div className="border-line flex flex-wrap items-center justify-between gap-3 border-b pb-3">
        <p className="text-[15px] text-white/60">
          Signed in as <strong className="text-white">{state.email}</strong>
        </p>
        <button
          type="button"
          onClick={() => state.supabase.auth.signOut()}
          className="border-line min-h-[40px] rounded-xl border px-3 text-[14px] font-semibold"
        >
          Sign out
        </button>
      </div>

      <nav
        aria-label="Admin sections"
        className="no-scrollbar -mx-4 mt-3 flex gap-2 overflow-x-auto px-4"
      >
        {NAV.map((item) => {
          const current = pathname === item.href;
          return (
            <Link
              key={item.href}
              href={item.href}
              aria-current={current ? 'page' : undefined}
              className={`min-h-[40px] shrink-0 rounded-full border px-4 py-2 text-[14px] font-semibold ${
                current ? 'border-orange bg-orange text-ink' : 'border-line bg-surface'
              }`}
            >
              {item.label}
            </Link>
          );
        })}
      </nav>

      <div className="mt-5">{children}</div>
    </div>
  );
}
