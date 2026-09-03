import type { Metadata, Viewport } from 'next';
import Link from 'next/link';
import ServiceWorkerRegistrar from '@/components/ServiceWorkerRegistrar';
import './globals.css';

const siteUrl = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://thehappyhours.co.za';

export const metadata: Metadata = {
  metadataBase: new URL(siteUrl),
  title: {
    default: 'The Happy Hours — restaurant and bar specials in Cape Town',
    template: '%s · The Happy Hours',
  },
  description:
    'Verified restaurant and bar specials across the Cape Town City Bowl and Atlantic Seaboard — sorted by day of the week. Tap a day to see what is on today.',
  applicationName: 'The Happy Hours',
  manifest: '/manifest.webmanifest',
  appleWebApp: {
    capable: true,
    title: 'The Happy Hours',
    statusBarStyle: 'default',
  },
  icons: {
    icon: [
      { url: '/favicon.ico', sizes: '48x48' },
      { url: '/icons/favicon-32.png', type: 'image/png', sizes: '32x32' },
      { url: '/icons/icon.svg', type: 'image/svg+xml' },
    ],
    apple: [{ url: '/icons/apple-touch-icon.png', sizes: '180x180' }],
  },
  openGraph: {
    type: 'website',
    locale: 'en_ZA',
    url: siteUrl,
    siteName: 'The Happy Hours',
    title: 'The Happy Hours',
    description: "What's on special in Cape Town today? Verified restaurant and bar deals, by day.",
    // The site's own header at 1200x630, not the square app icon — a square
    // gets blown up into a white-bordered block that reads like an app store
    // listing. JPEG because the card is mostly photograph and the PNG was
    // 1.2 MB, past the size where WhatsApp stops showing a preview at all.
    // Built by scripts/generate-og-image.mjs (npm run og).
    images: [
      {
        url: '/og-image.jpg',
        width: 1200,
        height: 630,
        type: 'image/jpeg',
        alt: 'The Happy Hours — verified restaurant and bar specials in Cape Town',
      },
    ],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'The Happy Hours',
    description: "What's on special in Cape Town today?",
    images: ['/og-image.jpg'],
  },
  robots: { index: true, follow: true },
};

export const viewport: Viewport = {
  themeColor: '#17181A',
  colorScheme: 'dark',
  width: 'device-width',
  initialScale: 1,
  viewportFit: 'cover',
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en-ZA">
      {/* No background utility here. body does not create a stacking context,
          so the fixed gradient layer in globals.css joins the root one and
          paints BEHIND body's own background — a colour here hides the sunset
          entirely. The fallback lives on <html>. */}
      <body className="min-h-dvh">
        <a className="skip-link" href="#main">
          Skip to the specials
        </a>

        {/* Hero banner. The photograph is decoration, so it carries an empty
            alt and the name stays real text on top of it — readable to screen
            readers and to search engines, and legible over the picture thanks
            to the half-black wash. */}
        {/* The logo carries the name now, so the photograph and the typed-out
            title are both gone. It sits straight on the pink end of the
            gradient — no wash, no panel, nothing behind it. */}
        <header className="flex justify-center px-4 pt-7 pb-5 sm:pt-9 sm:pb-6">
          <Link href="/" aria-label="The Happy Hours — home" className="block">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src="/logo.svg"
              alt="The Happy Hours"
              width={333}
              height={150}
              fetchPriority="high"
              className="h-[92px] w-auto drop-shadow-[0_2px_10px_rgba(150,60,30,0.28)] sm:h-[112px]"
            />
          </Link>
        </header>

        <main id="main" className="mx-auto max-w-[720px] px-4 pt-3 pb-16">
          {children}
        </main>

        <footer className="border-line bg-surface border-t px-4 py-8">
          <div className="text-ink/70 mx-auto flex max-w-[720px] flex-wrap gap-x-5 gap-y-2 text-[14px]">
            <Link className="text-accent font-semibold underline" href="/">
              Today&rsquo;s specials
            </Link>
            <Link className="text-accent font-semibold underline" href="/privacy">
              Privacy
            </Link>
            <Link className="text-accent font-semibold underline" href="/terms">
              Terms
            </Link>
            <span className="w-full pt-2">
              The Happy Hours lists offers at venues in the Cape Town City Bowl and the near
              Atlantic Seaboard. Every listing links to the source it was checked against.
            </span>
          </div>
        </footer>

        <ServiceWorkerRegistrar />
      </body>
    </html>
  );
}
