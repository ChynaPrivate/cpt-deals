import SpecialsBrowser from '@/components/SpecialsBrowser';
import { getPublicSpecials } from '@/lib/data/repository';
import { zonedNow } from '@/lib/time';
import type { City } from '@/lib/cities';
import type { SpecialWithRestaurant } from '@/lib/types';

/**
 * One city's page of specials.
 *
 * Both routes render this — "/" for Cape Town and "/plett" for Plettenberg
 * Bay — so the two pages cannot drift apart in behaviour, only in data and
 * copy. The city is passed in rather than read from the URL so the difference
 * is explicit at the call site.
 */
export default async function CityPage({ city }: { city: City }) {
  const serverNow = zonedNow();

  let specials: SpecialWithRestaurant[] = [];
  let loadError: string | null = null;
  try {
    specials = await getPublicSpecials(city.name);
  } catch (error) {
    loadError = error instanceof Error ? error.message : 'Unknown error';
  }

  if (loadError) {
    return (
      <div role="alert" className="glass rounded-[var(--radius-card)] p-6">
        <h2 className="text-[18px] font-bold">The specials could not be loaded</h2>
        <p className="text-ink/90 mt-2 text-[15px]">
          Something went wrong reaching the database. Please try again in a moment.
        </p>
      </div>
    );
  }

  return <SpecialsBrowser specials={specials} serverNow={serverNow} city={city} />;
}
