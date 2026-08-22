/**
 * Renders the app icon SVG into the PNG sizes a PWA needs.
 * Run with: npm run icons
 */
import { mkdir, readFile, writeFile } from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const root = process.cwd();
const svgPath = path.join(root, 'public', 'icons', 'icon.svg');
const outDir = path.join(root, 'public', 'icons');

const targets = [
  { file: 'icon-192.png', size: 192 },
  { file: 'icon-512.png', size: 512 },
  { file: 'apple-touch-icon.png', size: 180 },
  { file: 'favicon-32.png', size: 32 },
  { file: 'favicon-16.png', size: 16 },
];

await mkdir(outDir, { recursive: true });
const svg = await readFile(svgPath);

for (const { file, size } of targets) {
  await sharp(svg, { density: 384 })
    .resize(size, size)
    .png({ compressionLevel: 9 })
    .toFile(path.join(outDir, file));
  console.log(`wrote icons/${file}`);
}

// Maskable icon: same artwork inset so it survives Android's circular crop.
const inner = Math.round(512 * 0.78);
const maskable = await sharp(svg, { density: 384 }).resize(inner, inner).png().toBuffer();
await sharp({
  create: {
    width: 512,
    height: 512,
    channels: 4,
    background: { r: 0x17, g: 0x18, b: 0x1a, alpha: 1 },
  },
})
  .composite([{ input: maskable, gravity: 'centre' }])
  .png({ compressionLevel: 9 })
  .toFile(path.join(outDir, 'icon-maskable-512.png'));
console.log('wrote icons/icon-maskable-512.png');

// favicon.ico built from the 32px and 16px renders.
const ico = await sharp(svg, { density: 384 }).resize(48, 48).png().toBuffer();
await writeFile(path.join(root, 'public', 'favicon.ico'), ico);
console.log('wrote favicon.ico');
