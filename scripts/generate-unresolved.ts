/**
 * Regenerates docs/UNRESOLVED-SPECIALS.md from the research queue in
 * src/lib/data/seed.ts.
 *
 *   npm run docs:unresolved
 *
 * The list used to be maintained by hand and drifted almost immediately — it
 * still said "these nine candidates" when there were forty-two. Generating it
 * means the deliverable cannot disagree with the data it describes.
 */
import { writeFileSync } from 'node:fs';
import path from 'node:path';

import { RESEARCH_QUEUE_SEED } from '../src/lib/data/seed';
import type { ResearchQueueItem } from '../src/lib/types';

/** Pipe characters would break the table; newlines would break the row. */
const cell = (value: unknown): string =>
  String(value ?? '—')
    .replace(/\|/g, '\\|')
    .replace(/\s*\n\s*/g, ' ')
    .trim();

const STATUS_LABEL: Record<ResearchQueueItem['review_status'], string> = {
  pending: 'Pending',
  approved: 'Approved — published',
  rejected: 'Rejected',
  needs_more_evidence: 'Needs more evidence',
};

const field = (item: ResearchQueueItem, key: string): string =>
  cell((item.proposed_special_data as Record<string, unknown>)[key]);

const open = RESEARCH_QUEUE_SEED.filter((i) => i.review_status !== 'approved');
const done = RESEARCH_QUEUE_SEED.filter((i) => i.review_status === 'approved');

const byConfidence = (a: ResearchQueueItem, b: ResearchQueueItem) => {
  const rank = { high: 0, medium: 1, low: 2 } as const;
  return rank[a.confidence] - rank[b.confidence];
};

const lines: string[] = [
  '# Specials awaiting manual confirmation',
  '',
  'GENERATED FILE. Edit the research queue in `src/lib/data/seed.ts` and run',
  '`npm run docs:unresolved`.',
  '',
  `These **${open.length} candidates are not published.** They live in the \`research_queue\``,
  'table, which the public can never read, and appear in the admin dashboard under',
  '**Research queue**.',
  '',
  'Each needs a person to confirm it against a current official source — usually a',
  'phone call — before it can be created as a special and marked verified. They are',
  'ordered by confidence, so the ones most likely to survive a phone call come first.',
  '',
  '| # | Venue | Where | Candidate offer | Confidence | Status | Why it is not published |',
  '| --- | --- | --- | --- | --- | --- | --- |',
];

open.sort(byConfidence).forEach((item, index) => {
  lines.push(
    `| ${index + 1} | ${field(item, 'restaurant')} | ${field(item, 'street_address')} | ` +
      `${field(item, 'title')} | ${item.confidence} | ${STATUS_LABEL[item.review_status]} | ` +
      `${cell(item.reviewer_notes)} |`,
  );
});

lines.push('', '## Detail and sources', '');
open.forEach((item, index) => {
  lines.push(
    `**${index + 1}. ${field(item, 'restaurant')}** — detected ${item.detected_at}`,
    '',
    `- Offer: ${field(item, 'title')}`,
  );
  const note = (item.proposed_special_data as Record<string, unknown>).note;
  if (note) lines.push(`- Note: ${cell(note)}`);
  lines.push(`- Source: <${item.source_url}>`, '');
});

if (done.length) {
  lines.push(
    '---',
    '',
    '## Resolved',
    '',
    'Candidates that have since been confirmed and published. Kept here so the',
    'record shows what the queue caught, not only what it still holds.',
    '',
    '| Venue | Offer | How it was resolved |',
    '| --- | --- | --- |',
  );
  for (const item of done) {
    lines.push(
      `| ${field(item, 'restaurant')} | ${field(item, 'title')} | ${cell(item.reviewer_notes)} |`,
    );
  }
  lines.push('');
}

lines.push(
  '---',
  '',
  '## Standing limitation',
  '',
  'Instagram is readable only through the Business Discovery API, which needs an',
  'exact username. Handles found by guessing have a hit rate around one in three,',
  'and several guesses turned out to be entirely different businesses abroad — so',
  'only handles confirmed against a search result or a venue page were used. Any',
  'Cape Town bar whose handle was not found is absent from the research, not ruled',
  'out.',
  '',
  'Several venue sites could not be read at all because their `robots.txt` would',
  'not resolve. Those were left alone rather than worked around, which is why a',
  'few candidates below cite a third-party page instead of the venue itself.',
  '',
);

const out = path.join(process.cwd(), 'docs', 'UNRESOLVED-SPECIALS.md');
writeFileSync(out, lines.join('\n'), 'utf8');
console.log(`Wrote ${out} — ${open.length} open candidates, ${done.length} resolved.`);
