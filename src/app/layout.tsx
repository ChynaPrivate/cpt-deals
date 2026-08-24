import type { Metadata, Viewport } from 'next';
import Link from 'next/link';
import ServiceWorkerRegistrar from '@/components/ServiceWorkerRegistrar';
import './globals.css';

const siteUrl = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://cpt-deals.netlify.app';

export const metadata: Metadata = {
  metadataBase: new URL(siteUrl),
  title: {
    default: 'CPT Happy Hours — restaurant and bar specials in Cape Town',
    template: '%s · CPT Happy Hours',
  },
  description:
    'Verified restaurant and bar specials across the Cape Town City Bowl and Atlantic Seaboard — sorted by day of the week. Tap a day to see what is on today.',
  applicationName: 'CPT Happy Hours',
  manifest: '/manifest.webmanifest',
  appleWebApp: {
    capable: true,
    title: 'CPT Happy Hours',
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
    siteName: 'CPT Happy Hours',
    title: 'CPT Happy Hours',
    description: "What's on special in Cape Town today? Verified restaurant and bar deals, by day.",
    images: [{ url: '/icons/icon-512.png', width: 512, height: 512, alt: 'CPT Happy Hours' }],
  },
  twitter: {
    card: 'summary',
    title: 'CPT Happy Hours',
    description: "What's on special in Cape Town today?",
    images: ['/icons/icon-512.png'],
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
      <body className="bg-bg min-h-dvh">
        <a className="skip-link" href="#main">
          Skip to the specials
        </a>

        <header className="border-line bg-surface border-b px-4 pt-6 pb-5">
          <div className="mx-auto max-w-[720px]">
            <p className="text-[27px] leading-tight font-extrabold tracking-tight text-white">
              <Link href="/">
                CPT <span className="text-orange">Happy Hours</span>
              </Link>
            </p>
            <p className="mt-1 text-[16px] text-white/60">
              What&rsquo;s on special in Cape Town today?
            </p>
          </div>
        </header>

        <main id="main" className="mx-auto max-w-[720px] px-4 pt-5 pb-16">
          {children}
        </main>

        <footer className="border-line bg-surface border-t px-4 py-8">
          <div className="mx-auto flex max-w-[720px] flex-wrap gap-x-5 gap-y-2 text-[14px] text-white/60">
            <Link className="text-orange font-semibold underline" href="/">
              Today&rsquo;s specials
            </Link>
            <Link className="text-orange font-semibold underline" href="/privacy">
              Privacy
            </Link>
            <Link className="text-orange font-semibold underline" href="/terms">
              Terms
            </Link>
            <span className="w-full pt-2">
              CPT Happy Hours lists offers at venues in the Cape Town City Bowl and the near
              Atlantic Seaboard. Every listing links to the source it was checked against.
            </span>
          </div>
        </footer>

        <ServiceWorkerRegistrar />
      </body>
    </html>
  );
}
