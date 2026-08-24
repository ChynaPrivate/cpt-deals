/**
 * Builds the social sharing card at public/og-image.png.
 *
 * WhatsApp, Facebook, X, LinkedIn and Slack all want a wide image. The site
 * used to hand them the 512-square app icon, which those services shrink into
 * a postage stamp beside the text — the cocktail glass was there but too small
 * to read. This draws the same glass at 1200x630 so it is the first thing
 * anyone sees when the link lands in a group chat.
 *
 * The glass is drawn rather than traced from icons/icon.svg, because the two
 * have different jobs: the icon must survive being scaled to 32px on a home
 * screen, this one has room to breathe. Both use the same geometry and the
 * same orange, so they read as the same mark.
 *
 * Run with: npm run og
 */
import { Resvg } from '@resvg/resvg-js';
import { readFileSync, writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');

const BG = '#17181A';
const ORANGE = '#FF7A1A';
const WIDTH = 1200;
const HEIGHT = 630;

const poppinsBold = readFileSync('/usr/share/fonts/truetype/google-fonts/Poppins-Bold.ttf');
const poppinsMedium = readFileSync('/usr/share/fonts/truetype/google-fonts/Poppins-Medium.ttf');

const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="${WIDTH}" height="${HEIGHT}" viewBox="0 0 ${WIDTH} ${HEIGHT}">
  <rect width="${WIDTH}" height="${HEIGHT}" fill="${BG}"/>

  <!-- Stacked and centred rather than side by side. WhatsApp crops this card
       towards the middle when it shows the small preview, so anything that
       matters has to live near the centre or it simply disappears. -->
  <g transform="translate(478, 92) scale(0.6)">
    <g fill="none" stroke="${ORANGE}" stroke-width="30"
       stroke-linecap="round" stroke-linejoin="round">
      <path d="M136 156 L256 288 L376 156 Z"/>
      <path d="M256 288 L256 380"/>
      <path d="M186 380 L326 380"/>
    </g>
    <g stroke="${ORANGE}" stroke-width="18" stroke-linecap="round">
      <path d="M318 130 L266 210"/>
    </g>
    <circle cx="262" cy="218" r="24" fill="${ORANGE}"/>
  </g>

  <text x="600" y="428" text-anchor="middle" font-family="Poppins" font-weight="700" font-size="66" fill="#FFFFFF">The <tspan fill="${ORANGE}">Happy Hours</tspan></text>
  <text x="600" y="482" text-anchor="middle" font-family="Poppins" font-weight="500" font-size="30" fill="#FFFFFF" opacity="0.72">What&#8217;s on special in Cape Town today?</text>

  <rect x="510" y="516" width="180" height="2" fill="#35383D"/>

  <text x="600" y="566" text-anchor="middle" font-family="Poppins" font-weight="500" font-size="25" fill="${ORANGE}">Verified restaurant &amp; bar deals, by day</text>
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
const out = join(root, 'public', 'og-image.png');
writeFileSync(out, png);
console.log(`Wrote ${out} — ${WIDTH}x${HEIGHT}, ${(png.length / 1024).toFixed(0)} KB`);
