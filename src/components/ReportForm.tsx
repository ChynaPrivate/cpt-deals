'use client';

import { useId, useState } from 'react';
import { REPORT_TYPE_LABELS, type ReportType } from '@/lib/types';

const TYPES = Object.keys(REPORT_TYPE_LABELS) as ReportType[];
const MAX_COMMENT = 500;

export default function ReportForm({
  specialId,
  onDone,
}: {
  specialId: string;
  onDone: () => void;
}) {
  const groupId = useId();
  const [type, setType] = useState<ReportType>('special_ended');
  const [comment, setComment] = useState('');
  const [website, setWebsite] = useState(''); // honeypot
  const [state, setState] = useState<'idle' | 'sending' | 'sent' | 'error'>('idle');
  const [error, setError] = useState('');

  async function submit(event: React.FormEvent) {
    event.preventDefault();
    if (comment.length > MAX_COMMENT) {
      setError(`Please keep the comment under ${MAX_COMMENT} characters.`);
      setState('error');
      return;
    }
    setState('sending');
    setError('');
    try {
      const response = await fetch('/api/report', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ special_id: specialId, report_type: type, comment, website }),
      });
      const body = (await response.json()) as { error?: string };
      if (!response.ok) throw new Error(body.error || 'Something went wrong.');
      setState('sent');
    } catch (caught) {
      setError(caught instanceof Error ? caught.message : 'Something went wrong.');
      setState('error');
    }
  }

  if (state === 'sent') {
    return (
      <div role="status" className="mt-4 rounded-xl border border-white/60 bg-white/45 px-4 py-4">
        <p className="text-accent text-[15px] font-semibold">
          Thank you — the report has been sent for review.
        </p>
        <button
          type="button"
          onClick={onDone}
          className="text-accent mt-2 text-[15px] font-semibold underline"
        >
          Close
        </button>
      </div>
    );
  }

  return (
    <form onSubmit={submit} className="glass-2 mt-4 rounded-xl p-4">
      <fieldset>
        <legend className="text-[16px] font-bold">What is wrong with this listing?</legend>
        <div className="mt-2 space-y-1">
          {TYPES.map((value) => (
            <label key={value} className="flex min-h-[40px] items-center gap-2 text-[15px]">
              <input
                type="radio"
                name={groupId}
                value={value}
                checked={type === value}
                onChange={() => setType(value)}
                className="h-5 w-5 accent-[#FF7A1A]"
              />
              {REPORT_TYPE_LABELS[value]}
            </label>
          ))}
        </div>
      </fieldset>

      <label htmlFor={`${groupId}-comment`} className="mt-3 block text-[15px] font-semibold">
        Anything to add? <span className="text-ink/70 font-normal">(optional)</span>
      </label>
      <textarea
        id={`${groupId}-comment`}
        value={comment}
        maxLength={MAX_COMMENT}
        rows={3}
        onChange={(event) => setComment(event.target.value)}
        className="border-line bg-bg mt-1 w-full rounded-xl border px-3 py-2 text-[15px]"
        placeholder="For example: the price went up to R210 last week."
      />
      <p className="text-ink/70 mt-1 text-[13px]">
        {comment.length}/{MAX_COMMENT} characters. Please don’t include personal details — reports
        are stored without any information about who sent them.
      </p>

      {/* Honeypot: real people never see or fill this. */}
      <div aria-hidden="true" className="absolute left-[-9999px] h-0 w-0 overflow-hidden">
        <label htmlFor={`${groupId}-website`}>Leave this field empty</label>
        <input
          id={`${groupId}-website`}
          name="website"
          tabIndex={-1}
          autoComplete="off"
          value={website}
          onChange={(event) => setWebsite(event.target.value)}
        />
      </div>

      {state === 'error' && (
        <p role="alert" className="text-accent mt-2 text-[15px] font-semibold">
          {error}
        </p>
      )}

      <div className="mt-3 flex gap-2">
        <button
          type="submit"
          disabled={state === 'sending'}
          className="sunset-fill min-h-[48px] flex-1 rounded-xl px-4 text-[16px] font-bold shadow-[inset_0_1px_0_rgba(255,255,255,0.6)] disabled:opacity-60"
        >
          {state === 'sending' ? 'Sending…' : 'Send report'}
        </button>
        <button
          type="button"
          onClick={onDone}
          className="border-line min-h-[48px] rounded-xl border px-4 text-[16px] font-semibold"
        >
          Cancel
        </button>
      </div>
    </form>
  );
}
