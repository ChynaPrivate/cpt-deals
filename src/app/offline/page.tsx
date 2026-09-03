import type { Metadata } from 'next';

export const metadata: Metadata = { title: 'Offline', robots: { index: false } };

export default function OfflinePage() {
  return (
    <div className="border-line bg-surface rounded-[var(--radius-card)] border p-6">
      <h1 className="text-accent text-[20px] font-extrabold">You are offline</h1>
      <p className="mt-2 text-[16px] text-ink/80">
        The Happy Hours needs a connection to show today’s verified offers. The app will load again as
        soon as you are back online.
      </p>
      <p className="mt-4 text-[15px] text-ink/70">
        Specials can change without notice. Please confirm with the restaurant before visiting.
      </p>
    </div>
  );
}
