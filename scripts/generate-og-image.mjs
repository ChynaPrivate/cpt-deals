/**
 * Builds the social sharing card at public/og-image.jpg.
 *
 * WhatsApp, Facebook, X, LinkedIn and Slack all want a wide image. The site
 * used to hand them the 512-square app icon, which those services blow up into
 * a big white-bordered square — accurate, but it reads like an app store
 * listing rather than a place to find a drink.
 *
 * This is the site's own header at 1200x630: the Cape Town photograph under a
 * dark wash, the cocktail glass beside the name. Someone who taps through from
 * a group chat lands on the same picture they just saw, which is most of the
 * point of a share card.
 *
 * The glass is the same geometry as icons/icon.svg, drawn here rather than
 * imported so it can carry a heavier stroke — this one has room to breathe,
 * the icon has to survive being scaled to 32px on a home screen.
 *
 * Run with: npm run og
 */
import { Resvg } from '@resvg/resvg-js';
import sharp from 'sharp';
import { readFileSync, writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');

const ORANGE = '#FF7A1A';
const WIDTH = 1200;
const HEIGHT = 630;

const poppinsBold = readFileSync('/usr/share/fonts/truetype/google-fonts/Poppins-Bold.ttf');
const poppinsMedium = readFileSync('/usr/share/fonts/truetype/google-fonts/Poppins-Medium.ttf');

// Pre-cropped to 1200x630 so the script never has to guess a crop. Kept out of
// public/ because it is a build input, not something the site serves.
const photo = readFileSync(join(root, 'scripts', 'assets', 'hero-og-source.jpg'));
const photoUri = `data:image/jpeg;base64,${photo.toString('base64')}`;

const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="${WIDTH}" height="${HEIGHT}" viewBox="0 0 ${WIDTH} ${HEIGHT}">
  <defs>
    <linearGradient id="foot" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0.4" stop-color="#000000" stop-opacity="0"/>
      <stop offset="1" stop-color="#000000" stop-opacity="0.45"/>
    </linearGradient>
  </defs>

  <image href="${photoUri}" x="0" y="0" width="${WIDTH}" height="${HEIGHT}" preserveAspectRatio="xMidYMid slice"/>

  <!-- The same half-black wash the site header uses, plus a little extra weight
       at the foot so the tagline never sits on sunlit buildings. -->
  <rect width="${WIDTH}" height="${HEIGHT}" fill="#000000" fill-opacity="0.58"/>
  <rect width="${WIDTH}" height="${HEIGHT}" fill="url(#foot)"/>

  <!-- Glass and words as one left-aligned lockup, the way the header reads. -->
  <g transform="translate(66, 178) scale(0.62)">
    <g fill="none" stroke="${ORANGE}" stroke-width="34"
       stroke-linecap="round" stroke-linejoin="round">
      <path d="M136 156 L256 288 L376 156 Z"/>
      <path d="M256 288 L256 380"/>
      <path d="M186 380 L326 380"/>
    </g>
    <g stroke="${ORANGE}" stroke-width="20" stroke-linecap="round">
      <path d="M318 130 L266 210"/>
    </g>
    <circle cx="262" cy="218" r="26" fill="${ORANGE}"/>
  </g>

  <!-- Two lines only. WhatsApp prints the title and description underneath the
       picture anyway, so a third line here would just be said twice. -->
  <text x="328" y="336" font-family="Poppins" font-weight="700" font-size="76" fill="#FFFFFF">The <tspan fill="${ORANGE}">Happy Hours</tspan></text>
  <text x="332" y="394" font-family="Poppins" font-weight="500" font-size="33" fill="#FFFFFF" fill-opacity="0.9">What&#8217;s on special in Cape Town today?</text>
</svg>`;

const resvg = new Resvg(svg, {
  fitTo: { mode: 'width', value: WIDTH },
  font: {
    fontBuffers: [poppinsBold, poppinsMedium],
    defaultFontFamily: 'Poppins',
    loadSystemFonts: false,
  },
});

const png = resvg.render().asPng();

// JPEG, not PNG. The card is mostly photograph, so PNG lands around 1.2 MB —
// well past the point where WhatsApp gives up and shows no preview at all.
// The same picture as JPEG is under 150 KB with no visible difference at the
// size a chat bubble renders it.
const out = join(root, 'public', 'og-image.jpg');
const jpeg = await sharp(png).jpeg({ quality: 82, progressive: true, mozjpeg: true }).toBuffer();
writeFileSync(out, jpeg);
console.log(`Wrote ${out} — ${WIDTH}x${HEIGHT}, ${(jpeg.length / 1024).toFixed(0)} KB`);
