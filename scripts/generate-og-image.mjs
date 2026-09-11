/**
 * Builds the social sharing card at public/og-image.jpg.
 *
 * This is the picture WhatsApp, Facebook, X, LinkedIn and Slack show when
 * somebody pastes a link — and since every listing has its own /s/<id> page
 * with a share button, it is the first thing most people will ever see of the
 * site.
 *
 * It is the brand pink with the logo on it, matching the top of the site
 * exactly, so tapping through from a group chat lands on the same picture. The
 * artwork is lifted out of public/logo-3.svg rather than redrawn, which means a
 * new logo drop reaches the share card by re-running this script.
 *
 * 1200x630 is the size every one of those services wants. Anything squarer
 * gets letterboxed or centre-cropped, and the site used to hand them a square
 * app icon, which they blew up into a bordered tile that read like an app store
 * listing.
 *
 * Run with: npm run og
 */
import { Resvg } from '@resvg/resvg-js';
import sharp from 'sharp';
import { readFileSync, writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { PINK, fullLogo, styleBlock, fit } from './brand.mjs';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');

const WIDTH = 1200;
const HEIGHT = 630;

const poppinsBold = readFileSync('/usr/share/fonts/truetype/google-fonts/Poppins-Bold.ttf');

const logo = fullLogo();

// The same brown the site paints "CAPE TOWN" in: ink at 85% over the pink.
// Computed rather than eyeballed so the card and the header agree.
const INK_ON_PINK = '#5B3624';

// The logo is 1580x1128 (1.40 wide); the card is 1.90. So height is the
// constraint — 430px of logo leaves roughly 70px of clear pink above it and
// room for the CAPE TOWN line beneath.
const LOGO_HEIGHT = 430;
const LOGO_CENTRE_Y = 285;

const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="${WIDTH}" height="${HEIGHT}" viewBox="0 0 ${WIDTH} ${HEIGHT}">
  <defs>
    ${styleBlock()}
  </defs>

  <rect width="${WIDTH}" height="${HEIGHT}" fill="${PINK}"/>

  <g transform="${fit(logo.box, LOGO_HEIGHT, WIDTH / 2, LOGO_CENTRE_Y)}">
${logo.markup}
  </g>

  <!-- Letter-spacing set on the element rather than baked into the string, so
       the tracking matches the site's 0.32em without hand-kerning. -->
  <text x="${WIDTH / 2}" y="562" text-anchor="middle"
        font-family="Poppins" font-weight="700" font-size="30"
        letter-spacing="9.6" fill="${INK_ON_PINK}">CAPE TOWN</text>
</svg>`;

const png = new Resvg(svg, {
  fitTo: { mode: 'width', value: WIDTH },
  font: { fontBuffers: [poppinsBold], defaultFontFamily: 'Poppins' },
})
  .render()
  .asPng();

// JPEG rather than PNG: the services above re-encode anyway, and a flat colour
// field compresses to a fraction of the size. mozjpeg at 88 is visually clean
// on the script's thin pink strokes, which are the first thing to show ringing.
const out = await sharp(png).jpeg({ quality: 88, mozjpeg: true }).toBuffer();
writeFileSync(join(root, 'public', 'og-image.jpg'), out);
console.log(`wrote public/og-image.jpg (${(out.length / 1024).toFixed(0)} kB)`);
