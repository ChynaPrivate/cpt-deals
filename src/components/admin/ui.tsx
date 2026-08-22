'use client';

import type { ReactNode } from 'react';

export function Panel({ title, children }: { title: string; children: ReactNode }) {
  return (
    <section className="border-line bg-surface rounded-2xl border p-4">
      <h2 className="text-orange text-[17px] font-bold">{title}</h2>
      <div className="mt-3">{children}</div>
    </section>
  );
}

export function Stat({ label, value }: { label: string; value: number | string }) {
  return (
    <div className="border-line bg-surface rounded-2xl border px-4 py-3">
      <p className="text-[13px] font-semibold tracking-wide text-white/60 uppercase">{label}</p>
      <p className="text-orange mt-1 text-[26px] font-extrabold">{value}</p>
    </div>
  );
}

export function Field({
  label,
  htmlFor,
  hint,
  children,
}: {
  label: string;
  htmlFor: string;
  hint?: string;
  children: ReactNode;
}) {
  return (
    <div className="mt-3">
      <label htmlFor={htmlFor} className="block text-[15px] font-semibold">
        {label}
      </label>
      {hint && <p className="text-[13px] text-white/60">{hint}</p>}
      <div className="mt-1">{children}</div>
    </div>
  );
}

export const inputClass =
  'min-h-[44px] w-full rounded-xl border border-line bg-bg px-3 text-[16px]';

export function ActionButton({
  children,
  onClick,
  tone = 'primary',
  type = 'button',
  disabled,
}: {
  children: ReactNode;
  onClick?: () => void;
  tone?: 'primary' | 'secondary' | 'danger';
  type?: 'button' | 'submit';
  disabled?: boolean;
}) {
  const tones = {
    primary: 'bg-orange text-ink hover:bg-orange-dark',
    secondary: 'border border-line bg-surface text-white hover:border-orange/50',
    danger: 'border border-orange bg-transparent text-orange hover:bg-orange-dim',
  };
  return (
    <button
      type={type}
      onClick={onClick}
      disabled={disabled}
      className={`min-h-[44px] rounded-xl px-4 text-[15px] font-bold disabled:opacity-60 ${tones[tone]}`}
    >
      {children}
    </button>
  );
}

export function ErrorText({ message }: { message: string }) {
  if (!message) return null;
  return (
    <p role="alert" className="text-orange mt-2 text-[15px] font-semibold">
      {message}
    </p>
  );
}
