import CityPage from './CityPage';
import { cityBySlug } from '@/lib/cities';

/**
 * Cape Town, at the site root.
 *
 * It stays at "/" rather than moving to "/cape-town": every share link already
 * sent into WhatsApp points here, and anyone who added the site to their home
 * screen has "/" as their start_url.
 *
 * Re-rendered every five minutes. The client re-checks the South African clock
 * after hydration, so a page served just before midnight still shows the
 * right day.
 */
export const revalidate = 300;

export default function HomePage() {
  return <CityPage city={cityBySlug('')!} />;
}
