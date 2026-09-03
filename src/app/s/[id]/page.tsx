import type { Metadata } from 'next';
import Link from 'next/link';
import { notFound } from 'next/navigation';
import VenueAvatar from '@/components/VenueAvatar';
import SpecialDetailBody from '@/components/SpecialDetailBody';
import { getPublicSpecialById } from '@/lib/data/repository';
import { shareMessage } from '@/lib/specials';
import { formatRand, formatTimeRange, zonedNow } from '@/lib/time';
import { splitTitlePrice } from '@/lib/title-price';
import { SUBURB_SHORT, WEEKDAY_NAMES, type SpecialWithRestaurant } from '@/lib/types';

/**
 * One special on its own page, so a link shared into WhatsApp opens the offer
 * rather than the whole site.
 *
 * The metadata below is the real reason this route exists. A share used to
 * carry the site's generic preview card, so every offer anyone sent looked
 * identical in the thread. Now the preview names the venue, the offer and the
 * price — which is the whole message, before anyone taps anything.
 *
 * Rendered on demand and cached for five minutes, matching the home page. An
 * archived or expired special 404s rather than lingering, because a shared
 * message can be opened weeks after it was sent.
 */
export const revalidate = 300;

interface Props {
  params: Promise<{ id: string }>;
}

/** Compact "Wednesdays, 11:00am – 11:59pm" for the preview line. */
function whenLine(special: SpecialWithRestaurant): string {
  const time = formatTimeRange(special.start_time, special.end_time);
  if (special.days_of_week.length === 7) return `Every day, ${time}`;
  const days = special.days_of_week
    .slice()
    .sort((a, b) => a - b)
    .map((day) => WEEKDAY_NAMES[day])
    .join(', ');
  return `${days} — ${time}`;
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { id } = await params;
  const special = await getPublicSpecialById(id).catch(() => null);

  if (!special) {
    return { title: 'Special not found', robots: { index: false, follow: false } };
  }

  const price = formatRand(special.price);
  const title = price
    ? `${special.title} — ${price} at ${special.restaurant.name}`
    : `${special.title} at ${special.restaurant.name}`;
  const description = `${whenLine(special)}. ${special.restaurant.street_address}, ${special.restaurant.suburb}. ${special.description}`;

  return {
    title,
    description,
    alternates: { canonical: `/s/${special.id}` },
    openGraph: {
      type: 'article',
      title,
      description,
      url: `/s/${special.id}`,
      // Falls back to the site card from the root layout. A per-special image
      // would be better still, but it needs a render step per offer — worth
      // doing once the shape of these pages settles.
    },
    twitter: { card: 'summary_large_image', title, description },
  };
}

export default async function SpecialPage({ params }: Props) {
  const { id } = await params;

  let special: SpecialWithRestaurant | null = null;
  try {
    special = await getPublicSpecialById(id);
  } catch {
    special = null;
  }
  if (!special) notFound();

  const now = zonedNow();
  const { title, price: priceFromTitle } = splitTitlePrice(special.title);
  const price = formatRand(special.price) ?? priceFromTitle;
  const showPrice = price !== null && !title.includes(price);
  const suburb =
    (SUBURB_SHORT as Record<string, string>)[special.restaurant.suburb] ??
    special.restaurant.suburb;
  const address = special.restaurant.street_address;
  const where = address.toLowerCase().includes(suburb.toLowerCase())
    ? address
    : `${address}, ${suburb}`;

  return (
    <div className="pb-6">
      <article className="glass rounded-[var(--radius-card)] p-4">
        <div className="flex items-center gap-3">
          <VenueAvatar
            name={special.restaurant.name}
            categories={special.restaurant.categories}
            imageUrl={special.restaurant.image_url}
            size={44}
          />
          <div className="min-w-0 flex-1">
            <h1 className="text-ink text-[16px] leading-tight font-bold">
              {special.restaurant.name}
            </h1>
            <p className="text-ink/70 mt-0.5 text-[13px]">{where}</p>
          </div>
        </div>

        <h2 className="text-ink mt-3 text-[20px] leading-snug font-extrabold tracking-tight">
          {title}
        </h2>

        <div className="mt-2 flex items-center justify-between gap-3">
          <span className="glass-2 text-ink/70 rounded-lg px-2 py-1 text-[12px] font-semibold">
            {formatTimeRange(special.start_time, special.end_time)}
          </span>
          {showPrice && (
            <span className="text-accent text-[22px] leading-none font-extrabold">{price}</span>
          )}
        </div>

        {/* Opened by default — someone arriving from a shared link came for
            exactly this, and should not have to tap again to see it. */}
        <div className="mt-4">
          <SpecialDetailBody special={special} todayIso={now.date} />
        </div>
      </article>

      <Link
        href="/"
        className="bg-orange text-ink mt-4 flex min-h-[52px] w-full items-center justify-center rounded-2xl px-4 text-[16px] font-bold"
      >
        See everything on special today
      </Link>

      {/* The share text, rendered for search engines and for anyone reading
          with JavaScript off. Cheap, and it keeps the page meaningful without
          the client bundle. */}
      <p className="sr-only">{shareMessage(special)}</p>
    </div>
  );
}
