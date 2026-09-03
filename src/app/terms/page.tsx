import type { Metadata } from 'next';
import { DISCLAIMER } from '@/lib/types';

export const metadata: Metadata = {
  title: 'Terms',
  description: 'Terms of use for The Happy Hours.',
};

export default function TermsPage() {
  return (
    <article>
      <h1 className="text-accent text-[24px] font-extrabold">Terms</h1>

      <p className="bg-orange-dim mt-4 rounded-xl px-4 py-3 text-[16px] font-semibold">
        {DISCLAIMER}
      </p>

      <h2 className="mt-5 text-[18px] font-bold">What this site is</h2>
      <p className="mt-2 text-[16px]">
        The Happy Hours is an independent guide to restaurant and bar offers at venues physically located
        in the Cape Town City Bowl and the near Atlantic Seaboard — Gardens, Tamboerskloof,
        Oranjezicht, Vredehoek, the City Centre, Sea Point, Green Point, Mouille Point and Camps
        Bay. It is not affiliated with, endorsed by or operated on behalf of any restaurant listed.
      </p>

      <h2 className="mt-5 text-[18px] font-bold">Accuracy</h2>
      <p className="mt-2 text-[16px]">
        Every published special is checked against a source, and the date it was last checked is
        shown on the listing. Restaurants change their offers without telling anyone, so treat what
        you see here as a starting point and confirm with the venue before you go. We do not accept
        liability for a wasted trip.
      </p>

      <h2 className="mt-5 text-[18px] font-bold">Sources</h2>
      <p className="mt-2 text-[16px]">
        Offer descriptions are written in our own words and each listing links to the original
        source. Restaurant names and marks belong to their owners.
      </p>

      <h2 className="mt-5 text-[18px] font-bold">Reports and corrections</h2>
      <p className="mt-2 text-[16px]">
        Anyone can report an outdated listing. Reports are reviewed by a person before anything on
        the site changes.
      </p>
    </article>
  );
}
