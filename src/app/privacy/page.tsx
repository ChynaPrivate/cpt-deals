import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Privacy',
  description: 'What CPT Deals does and does not collect.',
};

export default function PrivacyPage() {
  return (
    <article className="prose-gs">
      <h1 className="text-orange text-[24px] font-extrabold">Privacy</h1>

      <h2 className="mt-5 text-[18px] font-bold">No account, no tracking profile</h2>
      <p className="mt-2 text-[16px]">
        You do not need an account to browse specials. CPT Deals does not set advertising cookies
        and does not build a profile of you.
      </p>

      <h2 className="mt-5 text-[18px] font-bold">Location</h2>
      <p className="mt-2 text-[16px]">
        Your location is only requested if you choose to sort specials by “Nearest”. It is used in
        your browser to work out distances and is never sent to us or stored. If you decline, the
        rest of the site works exactly as before.
      </p>

      <h2 className="mt-5 text-[18px] font-bold">Reports</h2>
      <p className="mt-2 text-[16px]">
        When you report outdated information we store which special you reported, the reason you
        chose and any comment you typed. We do not store your name, email address or IP address
        alongside the report. Please don’t include personal details in the comment box.
      </p>

      <h2 className="mt-5 text-[18px] font-bold">Data we hold about restaurants</h2>
      <p className="mt-2 text-[16px]">
        Listings are compiled from publicly available sources such as restaurant websites, official
        menus and booking pages. Every listing links to the source it came from. If you run a venue
        and would like a listing corrected or removed, use the report button on the listing.
      </p>

      <h2 className="mt-5 text-[18px] font-bold">Hosting</h2>
      <p className="mt-2 text-[16px]">
        The site is hosted on Netlify and its data is stored with Supabase. Both keep standard
        server logs for security and reliability purposes.
      </p>
    </article>
  );
}
