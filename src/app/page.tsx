import SpecialsBrowser from '@/components/SpecialsBrowser';
import { getPublicSpecials } from '@/lib/data/repository';
import { zonedNow } from '@/lib/time';
import type { SpecialWithRestaurant } from '@/lib/types';

/**
 * Re-rendered every five minutes. The client re-checks the Cape Town clock
 * after hydration, so a page served just before midnight still shows the
 * right day.
 */
export const revalidate = 300;

export default async function HomePage() {
  const serverNow = zonedNow();

  let specials: SpecialWithRestaurant[] = [];
  let loadError: string | null = null;
  try {
    specials = await getPublicSpecials();
  } catch (error) {
    loadError = error instanceof Error ? error.message : 'Unknown error';
  }

  if (loadError) {
    return (
      <div role="alert" className="glass rounded-[var(--radius-card)] p-6">
        <h2 className="text-[18px] font-bold">The specials could not be loaded</h2>
        <p className="text-ink/70 mt-2 text-[15px]">
          Something went wrong reaching the database. Please try again in a moment.
        </p>
      </div>
    );
  }

  return <SpecialsBrowser specials={specials} serverNow={serverNow} />;
}
