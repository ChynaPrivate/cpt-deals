import type { ReactNode } from 'react';

export type PillTone = 'neutral' | 'solid' | 'accent' | 'outline';

const TONES: Record<PillTone, string> = {
  // Quiet chip on the card surface.
  neutral: 'cutout text-ink',
  // Filled orange — reserved for the verification badge.
  solid: 'sunset-fill shadow-[inset_0_1px_0_rgba(255,255,255,0.6)]',
  // Orange copy on a dim orange ground, for the urgent state.
  accent: 'text-accent border border-white/60 bg-white/45',
  outline: 'border border-line text-ink/70',
};

export function Pill({ children, tone = 'neutral' }: { children: ReactNode; tone?: PillTone }) {
  return (
    <span
      className={`inline-flex items-center gap-1 rounded-full px-2.5 py-1 text-[13px] font-semibold ${TONES[tone]}`}
    >
      {children}
    </span>
  );
}

/** Tick mark used by the verification badge. */
export function CheckIcon() {
  return (
    <svg viewBox="0 0 20 20" aria-hidden="true" className="h-3.5 w-3.5" fill="currentColor">
      <path d="M8.1 14.6 4 10.5l1.5-1.5 2.6 2.6L14.5 5l1.5 1.6z" />
    </svg>
  );
}

export function VerificationBadge({
  state,
  lastVerified,
}: {
  state: 'verified' | 'expiring_soon' | 'needs_recheck';
  lastVerified: string;
}) {
  if (state === 'expiring_soon') {
    return <Pill tone="solid">Expiring soon</Pill>;
  }
  if (state === 'needs_recheck') {
    return (
      <Pill tone="outline">
        <span aria-hidden="true">•</span> Needs re-checking
      </Pill>
    );
  }
  return (
    <Pill tone="accent">
      <CheckIcon />
      <span className="sr-only">Verified. </span>Verified {lastVerified}
    </Pill>
  );
}
