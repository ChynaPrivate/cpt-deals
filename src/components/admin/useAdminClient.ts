'use client';

import { useAdminSession } from './AuthGate';
import type { SupabaseClient } from '@supabase/supabase-js';

/** The Supabase client for an approved administrator, or null while resolving. */
export function useAdminClient(): SupabaseClient | null {
  const state = useAdminSession();
  return state.kind === 'approved' ? state.supabase : null;
}
