'use client';

import { useRef, useState } from 'react';
import type { SpecialKind } from '@/lib/types';

interface Props {
  value: SpecialKind;
  counts: Record<'food' | 'drinks', number>;
  onChange: (kind: SpecialKind) => void;
}

/** Left to right: food only, both, drinks only. */
const ORDER: SpecialKind[] = ['food', 'all', 'drinks'];

/**
 * A three-position slider: food, both, drinks.
 *
 * The old pair of buttons had a hidden rule — press the lit one again to get
 * back to everything — which nothing on screen explained. "Both" is now a
 * position you can see and move to.
 *
 * It is a real slider, not a segmented control wearing the costume. The thumb
 * follows your finger continuously while you drag and snaps when you let go,
 * and a plain tap on any of the three still works. Arrow keys move it too.
 *
 * `touch-pan-y` is the important bit on a phone: a horizontal drag belongs to
 * the slider, but a vertical swipe that happens to start here must still
 * scroll the page, or the control becomes a trap in the middle of the screen.
 */
export default function KindToggle({ value, counts, onChange }: Props) {
  const index = Math.max(0, ORDER.indexOf(value));
  const trackRef = useRef<HTMLDivElement>(null);
  const pointerId = useRef<number | null>(null);
  /** Continuous 0–2 while a finger is down; null the rest of the time. */
  const [dragPos, setDragPos] = useState<number | null>(null);

  /** Where the thumb would sit, 0–2, if its centre followed this x. */
  function positionFromX(clientX: number): number {
    const track = trackRef.current;
    if (!track) return index;
    const rect = track.getBoundingClientRect();
    const padding = 4; // matches p-1 on the track
    const inner = rect.width - padding * 2;
    if (inner <= 0) return index;
    const x = clientX - rect.left - padding;
    // Thumb is a third of the inner width, so its centre for stop i sits at
    // (i + 0.5) thirds. Invert that to get a continuous stop from a position.
    return Math.min(2, Math.max(0, (x / inner) * 3 - 0.5));
  }

  function commit(position: number) {
    const next = ORDER[Math.round(position)];
    if (next !== value) onChange(next);
  }

  function handlePointerDown(event: React.PointerEvent<HTMLDivElement>) {
    // Ignore right-clicks and anything that is not a primary press.
    if (!event.isPrimary || (event.pointerType === 'mouse' && event.button !== 0)) return;
    pointerId.current = event.pointerId;
    trackRef.current?.setPointerCapture(event.pointerId);
    const position = positionFromX(event.clientX);
    setDragPos(position);
    commit(position);
  }

  function handlePointerMove(event: React.PointerEvent<HTMLDivElement>) {
    if (pointerId.current !== event.pointerId) return;
    const position = positionFromX(event.clientX);
    setDragPos(position);
    commit(position);
  }

  function endDrag(event: React.PointerEvent<HTMLDivElement>) {
    if (pointerId.current !== event.pointerId) return;
    pointerId.current = null;
    trackRef.current?.releasePointerCapture?.(event.pointerId);
    // Dropping dragPos lets the thumb animate to whichever stop it landed on.
    setDragPos(null);
  }

  function handleKeyDown(event: React.KeyboardEvent) {
    if (event.key === 'ArrowRight') {
      event.preventDefault();
      onChange(ORDER[Math.min(index + 1, ORDER.length - 1)]);
    } else if (event.key === 'ArrowLeft') {
      event.preventDefault();
      onChange(ORDER[Math.max(index - 1, 0)]);
    }
  }

  const dragging = dragPos !== null;
  const position = dragPos ?? index;

  const options: Array<{ kind: SpecialKind; label: string; count: number }> = [
    { kind: 'food', label: 'Food', count: counts.food },
    { kind: 'all', label: 'Both', count: counts.food + counts.drinks },
    { kind: 'drinks', label: 'Drinks', count: counts.drinks },
  ];

  return (
    <div
      ref={trackRef}
      role="radiogroup"
      aria-label="Show food, both, or drinks"
      onKeyDown={handleKeyDown}
      onPointerDown={handlePointerDown}
      onPointerMove={handlePointerMove}
      onPointerUp={endDrag}
      onPointerCancel={endDrag}
      className="glass-btn relative grid touch-pan-y grid-cols-3 rounded-2xl p-1 select-none"
    >
      {/* The thumb. A third of the inner width, moved by whole multiples of
          itself — so it lands exactly on each stop at any screen size. */}
      <span
        aria-hidden="true"
        className={`sunset-selected absolute inset-y-1 left-1 w-[calc((100%-0.5rem)/3)] rounded-xl ${
          dragging ? '' : 'transition-transform duration-200 ease-out motion-reduce:transition-none'
        }`}
        style={{ transform: `translateX(${position * 100}%)` }}
      />

      {options.map(({ kind, label, count }) => {
        const on = value === kind;
        return (
          <button
            key={kind}
            type="button"
            role="radio"
            aria-checked={on}
            tabIndex={on ? 0 : -1}
            onClick={() => onChange(kind)}
            className={`relative z-10 flex min-h-[44px] items-center justify-center gap-1.5 rounded-xl text-[16px] font-bold transition-colors ${
              on ? 'text-ink' : 'text-ink/75'
            }`}
          >
            {label}
            <span className={`tabular-nums ${on ? 'text-ink/70' : 'text-ink/60'}`}>{count}</span>
          </button>
        );
      })}
    </div>
  );
}
