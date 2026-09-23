import type { Metadata } from 'next';
import CityPage from '../CityPage';
import { cityBySlug } from '@/lib/cities';

const plett = cityBySlug('plett')!;

export const revalidate = 300;

export const metadata: Metadata = {
  title: 'Plettenberg Bay specials — The Happy Hours',
  description:
    'Verified restaurant and bar specials in and around Plettenberg Bay, sorted by day of the week. Tap a day to see what is on today.',
  alternates: { canonical: '/plett' },
  openGraph: {
    type: 'website',
    url: '/plett',
    title: 'The Happy Hours — Plettenberg Bay',
    description: "What's on special in Plett today? Verified restaurant and bar deals, by day.",
  },
};

export default function PlettPage() {
  return <CityPage city={plett} />;
}
