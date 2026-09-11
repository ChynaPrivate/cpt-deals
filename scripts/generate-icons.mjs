/**
 * Builds the app icon — the thing that ends up on a phone's home screen — and
 * every PNG size the PWA manifest asks for.
 *
 * The icon is the brand pink with the cocktail glass on it and no words. A
 * home-screen tile is about 60px on a real handset, so the wordmark would be an
 * unreadable smudge; the glass is the one element that still reads at that
 * size, and it is the same glass as the logo because it is lifted straight out
 * of logo-3.svg rather than redrawn.
 *
 * Two versions of the artwork are written:
 *
 *   icon.svg           a rounded square, for anywhere the icon is shown as-is
 *   icon-maskable.svg  full-bleed pink, glass smaller
 *
 * The maskable one matters on Android, which crops the icon to whatever shape
 * the launcher uses — circle, squircle, teardrop. Only the middle 80% is
 * guaranteed to survive, so that version keeps the glass well inside it and
 * lets the pink run to the edges to be cropped instead.
 *
 * Run with: npm run icons
 */
import { mkdir, writeFile } from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';
import { PINK, cocktail, styleBlock, fit } from './brand.mjs';

const root = process.cwd();
const outDir = path.join(root, 'public', 'icons');
await mkdir(outDir, { recursive: true });

const glass = cocktail();

/**
 * @param {object} opts
 * @param {number} opts.glassHeight  height of the glass within a 512 canvas
 * @param {number|null} opts.radius   corner radius, or null for full bleed
 */
function iconSvg({ glassHeight, radius }) {
  const bg =
    radius === null
      ? `<rect width="512" height="512" fill="${PINK}"/>`
      : `<rect width="512" height="512" rx="${radius}" ry="${radius}" fill="${PINK}"/>`;
  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="512" height="512" role="img" aria-label="The Happy Hours">
  <defs>
    ${styleBlock()}
  </defs>
  ${bg}
  <g transform="${fit(glass.box, glassHeight, 256, 256)}">
${glass.markup}
  </g>
</svg>
`;
}

// 330 of 512 leaves a 91px margin top and bottom — enough that the glass does
// not crowd the rounded corners, and large enough to stay legible small.
const standard = iconSvg({ glassHeight: 330, radius: 112 });
// 300 keeps the whole glass inside the middle 80% (410px) that every launcher
// shape is guaranteed to show, with room to spare at the stem and the rim.
const maskable = iconSvg({ glassHeight: 300, radius: null });
// A browser tab favicon is 16px. At the home-screen proportions the glass comes
// out about ten pixels tall there and turns to mush, so the small sizes get a
// version with the margin cut right back — it fills the tile instead.
const tight = iconSvg({ glassHeight: 430, radius: 96 });

await writeFile(path.join(outDir, 'icon.svg'), standard);
await writeFile(path.join(outDir, 'icon-maskable.svg'), maskable);
console.log('wrote icons/icon.svg and icons/icon-maskable.svg');

const targets = [
  { file: 'icon-192.png', size: 192, svg: standard },
  { file: 'icon-512.png', size: 512, svg: standard },
  // iOS applies its own rounding to the touch icon and does not honour
  // transparency, so it gets the full-bleed artwork rather than the rounded
  // square — otherwise the corners are rounded twice and show a pink halo.
  { file: 'apple-touch-icon.png', size: 180, svg: maskable },
  { file: 'favicon-32.png', size: 32, svg: tight },
  { file: 'favicon-16.png', size: 16, svg: tight },
  { file: 'icon-maskable-512.png', size: 512, svg: maskable },
];

for (const { file, size, svg } of targets) {
  await sharp(Buffer.from(svg), { density: 384 })
    .resize(size, size)
    .png({ compressionLevel: 9 })
    .toFile(path.join(outDir, file));
  console.log(`wrote icons/${file}`);
}

// favicon.ico — a 48px render, which browsers downscale as they need.
const ico = await sharp(Buffer.from(tight), { density: 384 }).resize(48, 48).png().toBuffer();
await writeFile(path.join(root, 'public', 'favicon.ico'), ico);
console.log('wrote favicon.ico');
