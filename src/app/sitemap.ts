import type { MetadataRoute } from 'next';
import { CITIES, cityPath } from '@/lib/cities';

const siteUrl = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://thehappyhours.co.za';

export default function sitemap(): MetadataRoute.Sitemap {
  const now = new Date();
  return [
    ...CITIES.map((city) => ({
      url: `${siteUrl}${cityPath(city)}`,
      lastModified: now,
      changeFrequency: 'daily' as const,
      // Cape Town is the site's front door; the other cities rank just under it.
      priority: city.slug === '' ? 1 : 0.9,
    })),
    { url: `${siteUrl}/privacy`, lastModified: now, changeFrequency: 'yearly', priority: 0.3 },
    { url: `${siteUrl}/terms`, lastModified: now, changeFrequency: 'yearly', priority: 0.3 },
  ];
}
