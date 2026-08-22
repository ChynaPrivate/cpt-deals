'use client';

import { useEffect, useState } from 'react';
import type { Session, SupabaseClient } from '@supabase/supabase-js';
import { createClient } from '@/lib/supabase/client';
import { isSupabaseConfigured } from '@/lib/supabase/config';

export type AdminState =
  | { kind: 'loading' }
  | { kind: 'not_configured' }
  | { kind: 'signed_out'; supabase: SupabaseClient }
  | { kind: 'pending_approval'; supabase: SupabaseClient; email: string }
  | { kind: 'approved'; supabase: SupabaseClient; email: string };

/**
 * Resolves who is looking at the admin area.
 *
 * Authorisation is not decided here — row-level security in Supabase is the
 * real gate. This only decides what to render, so a stale client cannot grant
 * itself access to anything.
 */
export function useAdminSession(): AdminState {
  // Whether Supabase is connected is known from build-time environment
  // variables, so it can be decided during render rather than in an effect.
  const configured = isSupabaseConfigured();
  const [state, setState] = useState<AdminState>(
    configured ? { kind: 'loading' } : { kind: 'not_configured' },
  );

  useEffect(() => {
    if (!configured) return;
    const supabase = createClient();
    if (!supabase) return;

    let cancelled = false;

    async function resolve(session: Session | null) {
      if (!session?.user) {
        if (!cancelled) setState({ kind: 'signed_out', supabase: supabase! });
        return;
      }
      const { data } = await supabase!
        .from('admin_profiles')
        .select('approved')
        .eq('user_id', session.user.id)
        .maybeSingle();

      if (cancelled) return;
      const email = session.user.email ?? '';
      setState(
        data?.approved
          ? { kind: 'approved', supabase: supabase!, email }
          : { kind: 'pending_approval', supabase: supabase!, email },
      );
    }

    supabase.auth.getSession().then(({ data }) => resolve(data.session));
    const { data: listener } = supabase.auth.onAuthStateChange((_event, session) => {
      resolve(session);
    });

    return () => {
      cancelled = true;
      listener.subscription.unsubscribe();
    };
  }, [configured]);

  return state;
}

export function SignInPanel({ supabase }: { supabase: SupabaseClient }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [busy, setBusy] = useState(false);

  async function submit(event: React.FormEvent) {
    event.preventDefault();
    setBusy(true);
    setError('');
    const { error: signInError } = await supabase.auth.signInWithPassword({ email, password });
    if (signInError) setError(signInError.message);
    setBusy(false);
  }

  return (
    <form
      onSubmit={submit}
      className="border-line bg-surface mx-auto max-w-[380px] rounded-2xl border p-5"
    >
      <h1 className="text-orange text-[20px] font-extrabold">Administrator sign in</h1>
      <p className="mt-1 text-[14px] text-white/60">
        This area is for approved administrators. Public accounts are not offered.
      </p>

      <label htmlFor="admin-email" className="mt-4 block text-[15px] font-semibold">
        Email address
      </label>
      <input
        id="admin-email"
        type="email"
        autoComplete="username"
        required
        value={email}
        onChange={(event) => setEmail(event.target.value)}
        className="border-line bg-bg mt-1 min-h-[48px] w-full rounded-xl border px-3 text-[16px]"
      />

      <label htmlFor="admin-password" className="mt-3 block text-[15px] font-semibold">
        Password
      </label>
      <input
        id="admin-password"
        type="password"
        autoComplete="current-password"
        required
        value={password}
        onChange={(event) => setPassword(event.target.value)}
        className="border-line bg-bg mt-1 min-h-[48px] w-full rounded-xl border px-3 text-[16px]"
      />

      {error && (
        <p role="alert" className="text-orange mt-3 text-[15px] font-semibold">
          {error}
        </p>
      )}

      <button
        type="submit"
        disabled={busy}
        className="bg-orange text-ink mt-4 min-h-[48px] w-full rounded-xl text-[16px] font-bold disabled:opacity-60"
      >
        {busy ? 'Signing in…' : 'Sign in'}
      </button>
    </form>
  );
}

export function NotConfiguredPanel() {
  return (
    <div className="border-line bg-surface mx-auto max-w-[520px] rounded-2xl border p-5">
      <h1 className="text-orange text-[20px] font-extrabold">Supabase is not connected yet</h1>
      <p className="mt-2 text-[15px]">
        The public site is running on the verified seed data bundled with the project. To use the
        admin dashboard, add <code className="font-mono">NEXT_PUBLIC_SUPABASE_URL</code> and{' '}
        <code className="font-mono">NEXT_PUBLIC_SUPABASE_ANON_KEY</code> to your environment, run
        the migration in <code className="font-mono">supabase/migrations</code>, then reload.
      </p>
      <p className="mt-2 text-[15px] text-white/60">
        Full steps are in <code className="font-mono">docs/DEPLOYMENT.md</code>.
      </p>
    </div>
  );
}

export function PendingApprovalPanel({
  email,
  supabase,
}: {
  email: string;
  supabase: SupabaseClient;
}) {
  return (
    <div className="border-line bg-surface mx-auto max-w-[520px] rounded-2xl border p-5">
      <h1 className="text-orange text-[20px] font-extrabold">Waiting for approval</h1>
      <p className="mt-2 text-[15px]">
        You are signed in as <strong>{email}</strong>, but this account has not been approved as an
        administrator yet. An existing administrator needs to set{' '}
        <code className="font-mono">approved = true</code> on your row in{' '}
        <code className="font-mono">admin_profiles</code>.
      </p>
      <button
        type="button"
        onClick={() => supabase.auth.signOut()}
        className="border-line mt-4 min-h-[44px] rounded-xl border px-4 text-[15px] font-semibold"
      >
        Sign out
      </button>
    </div>
  );
}
