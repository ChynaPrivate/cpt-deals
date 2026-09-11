/**
 * Pulls pieces out of the brand logo so the icons and the share card are cut
 * from the same file the site header uses.
 *
 * Everything here reads public/logo-3.svg at build time rather than keeping a
 * traced copy of the artwork. The previous icon was a hand-drawn martini glass
 * that only approximated the real one, and when the logo changed it silently
 * stopped matching. Extracting means a new logo drop propagates to the app
 * icon and the WhatsApp preview by re-running the two scripts.
 *
 * The logo's own structure, confirmed by measuring each group's bounding box:
 *   group 0 — the cocktail glass          (541,477) 419 x 652
 *   group 1 — "THE HAPPY" in white
 *   group 2 — "Hours" in the pink script
 */
import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const source = readFileSync(join(root, 'public', 'logo-3.svg'), 'utf8');

/** The brand ground, straight from the artwork. Matches --ground in globals.css. */
export const PINK = '#F89F99';

/** The `<style>` block carrying every cls-N fill, reused verbatim. */
export function styleBlock() {
  const match = source.match(/<style>[\s\S]*?<\/style>/);
  if (!match) throw new Error('logo-3.svg: no <style> block found');
  return match[0];
}

/**
 * Returns the nth top-level group inside the artwork layer, with the bounding
 * box measured from the rendered file.
 */
const GROUPS = [
  { index: 0, box: { x: 541, y: 477, width: 419, height: 652 } }, // cocktail
  { index: 1, box: { x: 0, y: 0, width: 1580, height: 420 } }, // THE HAPPY
  { index: 2, box: { x: 304, y: 230, width: 972, height: 484 } }, // Hours
];

function innerLayer() {
  // <g id="Layer_1-2"> wraps a single <g> which holds the three groups.
  const start = source.indexOf('<g id="Layer_1-2"');
  const open = source.indexOf('<g>', start);
  if (start === -1 || open === -1) throw new Error('logo-3.svg: unexpected structure');
  // Walk to the matching close of that inner <g>, counting nesting.
  let depth = 0;
  const re = /<g\b[^>]*>|<\/g>/g;
  re.lastIndex = open;
  let m;
  while ((m = re.exec(source))) {
    depth += m[0] === '</g>' ? -1 : 1;
    if (depth === 0) return source.slice(open + 3, m.index);
  }
  throw new Error('logo-3.svg: unbalanced groups');
}

/** Splits the artwork layer into its three top-level groups. */
function topLevelGroups() {
  const inner = innerLayer();
  const out = [];
  let depth = 0;
  let startIdx = -1;
  const re = /<g\b[^>]*>|<\/g>/g;
  let m;
  while ((m = re.exec(inner))) {
    if (m[0] !== '</g>') {
      if (depth === 0) startIdx = m.index;
      depth += 1;
    } else {
      depth -= 1;
      if (depth === 0) out.push(inner.slice(startIdx, m.index + 4));
    }
  }
  return out;
}

/**
 * The cocktail glass on its own, plus the box it occupies in logo coordinates.
 * Used for the app icon, where the wordmark would be illegible anyway.
 */
export function cocktail() {
  const groups = topLevelGroups();
  return { markup: groups[GROUPS[0].index], box: GROUPS[0].box };
}

/** The whole lockup — glass and both words — for the share card. */
export function fullLogo() {
  return {
    markup: topLevelGroups().join('\n'),
    box: { x: 0, y: 0, width: 1580, height: 1128 },
  };
}

/**
 * Transform that scales a source box to `height` px and places its centre at
 * (cx, cy) in the destination canvas.
 */
export function fit(box, height, cx, cy) {
  const scale = height / box.height;
  const tx = cx - (box.x + box.width / 2) * scale;
  const ty = cy - (box.y + box.height / 2) * scale;
  return `translate(${tx.toFixed(2)}, ${ty.toFixed(2)}) scale(${scale.toFixed(5)})`;
}
