import Image from 'next/image';
import { venueIcon, type VenueIcon } from '@/lib/venue-icon';

interface Props {
  name: string;
  categories: string[];
  imageUrl: string | null;
  size?: number;
}

/**
 * Drawn at a 24-unit grid, stroked rather than filled — the same treatment as
 * the app icon, and it holds up at 52px where a filled shape turns to mush.
 */
const PATHS: Record<VenueIcon, React.ReactNode> = {
  cocktail: (
    <>
      <path d="M5 6h14l-7 7z" />
      <path d="M12 13v6" />
      <path d="M8.5 19h7" />
    </>
  ),
  wine: (
    <>
      <path d="M8 4h8v4a4 4 0 0 1-8 0z" />
      <path d="M12 12v6" />
      <path d="M9 18h6" />
    </>
  ),
  beer: (
    <>
      <path d="M6 8h9v11H6z" />
      <path d="M15 10h2a2 2 0 0 1 0 4h-2" />
      <path d="M6 8c0-2 1.5-3 3-3s1.5 1 3 1 1.5-1 3 0" />
    </>
  ),
  burger: (
    <>
      <path d="M4 9c0-2.5 3.6-4.5 8-4.5S20 6.5 20 9z" />
      <path d="M4 12.5h16" />
      <path d="M4.5 16h15a3 3 0 0 1-3 3h-9a3 3 0 0 1-3-3z" />
    </>
  ),
  pasta: (
    <>
      <path d="M6 10h12a6 6 0 0 1-12 0z" />
      <path d="M8 10c0-3 1-5 2-6" />
      <path d="M12 10c0-3.5.5-5.5 1.5-7" />
      <path d="M16 10c0-2.5-.5-4-1.5-5" />
      <path d="M5 19h14" />
    </>
  ),
  pizza: (
    <>
      <path d="M12 4 20.5 19a22 22 0 0 1-17 0z" />
      <path d="M10.5 11h.01" />
      <path d="M14 14.5h.01" />
    </>
  ),
  sushi: (
    <>
      <path d="M4 19 20 5" />
      <path d="M7.5 15.5 11 19" />
      <circle cx="8" cy="8" r="3.5" />
    </>
  ),
  taco: (
    <>
      <path d="M3 17a9 9 0 0 1 18 0z" />
      <path d="M7 14.5c1.5-1 3-1.2 4-.5" />
    </>
  ),
  steak: (
    <>
      <path d="M4.5 12a7.5 5.5 0 1 1 15 0 7.5 5.5 0 0 1-15 0z" />
      <path d="M9 11.5a3 2.5 0 1 1 6 0 3 2.5 0 0 1-6 0z" />
      <path d="M6 18h12" />
    </>
  ),
  seafood: (
    <>
      <path d="M3 12c3-4 8-5 12-3 2 1 4 2 6 3-2 1-4 2-6 3-4 2-9 1-12-3z" />
      <path d="M8 12h.01" />
    </>
  ),
  coffee: (
    <>
      <path d="M5 8h11v6a4 4 0 0 1-4 4H9a4 4 0 0 1-4-4z" />
      <path d="M16 10h1.5a2.5 2.5 0 0 1 0 5H16" />
      <path d="M8 3.5v2M12 3.5v2" />
    </>
  ),
  plate: (
    <>
      <circle cx="12" cy="13" r="7" />
      <path d="M4 13a8 8 0 0 1 16 0" />
      <path d="M12 4.5v1.5" />
    </>
  ),
};

export default function VenueAvatar({ name, categories, imageUrl, size = 52 }: Props) {
  if (imageUrl) {
    return (
      <Image
        src={imageUrl}
        alt=""
        width={size}
        height={size}
        loading="lazy"
        className="shrink-0 rounded-xl object-cover"
        style={{ width: size, height: size }}
      />
    );
  }

  const icon = venueIcon(categories);

  return (
    <div
      aria-hidden="true"
      title={name}
      className="text-accent flex shrink-0 items-center justify-center rounded-xl bg-[#FBF6EC] shadow-[inset_0_0_0_1px_rgba(255,255,255,0.8)]"
      style={{ width: size, height: size }}
    >
      <svg
        viewBox="0 0 24 24"
        width={Math.round(size * 0.56)}
        height={Math.round(size * 0.56)}
        fill="none"
        stroke="currentColor"
        strokeWidth="1.6"
        strokeLinecap="round"
        strokeLinejoin="round"
      >
        {PATHS[icon]}
      </svg>
    </div>
  );
}
