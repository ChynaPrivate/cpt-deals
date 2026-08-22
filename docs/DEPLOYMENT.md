# Connecting Supabase and deploying to Netlify

The project runs right now with no credentials at all — it falls back to the verified seed data in `src/lib/data/seed.ts`. Everything below is about moving it onto a real database and a real domain.

Nothing in this document asks you to paste a secret into a source file. Keys go into Supabase's and Netlify's own settings screens, and nowhere else.

---

## 1. Create or select your Supabase project

1. Sign in at [supabase.com](https://supabase.com) and create a project. Choose a region close to Cape Town — **eu-west-1 (Ireland)** or **eu-central-1 (Frankfurt)** are the usual picks.
2. Wait for it to finish provisioning.

**Give this project to CPT Deals alone.** The anon key ships inside the browser bundle of a public website, so anyone can read it. That is by design and row-level security is what makes it safe — but it means the key is a published credential for whatever else lives in the same project. Never point this site at a database holding anything you would not publish.

### The free plan is enough

Comfortably, on every axis that matters here:

| Free plan gives      | CPT Deals needs                                           |
| -------------------- | --------------------------------------------------------- |
| 500 MB database      | Well under 1 MB — a few hundred rows of text              |
| 1 GB file storage    | Photographed boards at ~300 KB each: roughly 3,000 photos |
| 5 GB egress/month    | A small mobile site; nowhere near it                      |
| 50,000 monthly users | One admin, and browsing needs no account at all           |
| 2 active projects    | One                                                       |

The single real catch is that **a free project pauses after a week with no database activity**, which would take the site's data down with it. `netlify/functions/keep-awake.mts` handles that: it runs every other day and makes one trivial read, using the public anon key and no elevated privileges. Nothing to configure — it deploys with the site and, like every scheduled job here, exits quietly until Supabase is set up.

## 2. Run the migration

1. In the Supabase dashboard open **SQL Editor** → **New query**.
2. Paste the whole of `supabase/migrations/20260820120000_init.sql` and run it.

That creates the five tables, the constraints, the indexes, the updated-at triggers, the two admin views and every row-level security policy.

3. New query. Paste and run `supabase/migrations/20260821090000_expand_suburbs.sql`. This widens the suburb rule from Gardens alone to the nine suburbs the site covers, and indexes the column. **Run the migrations in this order.**

4. New query. Paste and run `supabase/migrations/20260821140000_capture_from_photos.sql`. This adds the photo columns and creates the private `special-photos` storage bucket used by `/admin/capture`.

   Its first statement adds a value to an enum type, which Postgres will not let you use in the same transaction that creates it. If the SQL editor complains, run that first line on its own and the rest afterwards.

5. Optional but recommended: paste and run `supabase/seed.sql` to load the 14 verified venues, 38 verified specials and 17 research candidates.

> If you prefer the CLI: `supabase link --project-ref <ref>` then `supabase db push`.

### Check it worked

Run this in the SQL editor. Every row should say `t`:

```sql
select tablename, rowsecurity
from pg_tables
where schemaname = 'public'
  and tablename in ('restaurants','specials','reports','research_queue','admin_profiles');
```

## 3. Create your administrator account

1. **Authentication** → **Users** → **Add user** → **Create new user**.
2. Enter your email address and a strong password. Tick _Auto Confirm User_.
3. Copy the new user's UUID.

## 4. Approve that account as an administrator

Creating the user is not enough — the account also has to be approved. In the SQL editor:

```sql
insert into public.admin_profiles (user_id, email, approved)
values ('PASTE-THE-USER-UUID-HERE', 'you@example.com', true);
```

Until `approved` is true, signing in to `/admin` shows a "waiting for approval" screen and the database refuses every write.

### Turn off public sign-up

**Authentication** → **Providers** → **Email** → switch **Enable sign-ups** off. The website never exposes a registration form, and this makes sure the API cannot be used to create one either.

## 5. Collect the two values you need

**Project Settings** → **API**:

- **Project URL** → `NEXT_PUBLIC_SUPABASE_URL`
- **anon / publishable key** → `NEXT_PUBLIC_SUPABASE_ANON_KEY`

Both are safe in browser code — row-level security is what protects the data.

**Do not copy the `service_role` key.** Nothing in this project uses it. It bypasses row-level security completely, and it must never appear in a `NEXT_PUBLIC_` variable, in client code, or in the repository.

### Running locally

```bash
cp .env.example .env.local     # then fill in the two values
npm install
npm run dev
```

`.env.local` is already git-ignored.

---

## 6. Add the environment variables in Netlify

**Site configuration** → **Environment variables** → **Add a variable**, for each of:

| Key                             | Scope        | Value                                                   |
| ------------------------------- | ------------ | ------------------------------------------------------- |
| `NEXT_PUBLIC_SUPABASE_URL`      | All contexts | Your project URL                                        |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | All contexts | Your anon key                                           |
| `NEXT_PUBLIC_SITE_URL`          | Production   | `https://your-site.netlify.app` (or your custom domain) |

Set `NEXT_PUBLIC_SITE_URL` separately for deploy previews if you want preview builds to advertise their own canonical URL.

## 7. Connect the Git repository

1. Push this project to GitHub, GitLab or Bitbucket.
2. In Netlify: **Add new site** → **Import an existing project** → pick the repository.
3. Netlify detects Next.js and fills in the build settings from `netlify.toml`:
   - Build command: `npm run build`
   - Publish directory: set by the Next.js adapter — leave it blank
4. **Deploy site.**

Netlify builds Next.js with the OpenNext adapter, which it applies automatically. `netlify.toml` deliberately does **not** pin a plugin version, which is Netlify's own recommendation so the adapter keeps pace with Next.js releases.

## 8. Deploy

Every push to the production branch deploys. Every pull request gets its own preview URL, using the same environment variables unless you scope them differently.

### After the first deploy, check

- The home page loads and today is highlighted.
- Refreshing `/privacy` directly returns the page rather than a 404 — Next.js routing is handled by the adapter, so no catch-all rewrite is needed.
- `/manifest.webmanifest` returns JSON.
- `/sw.js` returns JavaScript with `Cache-Control: no-store`-style revalidation.
- On an Android phone, Chrome offers **Install** or **Add to Home screen**.
- On an iPhone, Safari → Share → **Add to Home Screen** produces the green icon and opens without browser chrome.
- `/admin` shows the sign-in form, and your approved account can sign in.

## 9. Connect a custom domain later

1. **Domain management** → **Add a domain** → enter your domain.
2. Either point your registrar's nameservers at Netlify DNS, or add the `CNAME`/`A` records Netlify shows you.
3. Netlify provisions a Let's Encrypt certificate automatically once DNS resolves.
4. Update `NEXT_PUBLIC_SITE_URL` to the new domain and redeploy, so canonical and social-sharing URLs match.
5. In Supabase, add the domain under **Authentication** → **URL Configuration** → _Site URL_ and _Redirect URLs_, or admin sign-in will be rejected from the new origin.

---

## Notes on security

- The Content-Security-Policy in `netlify.toml` allows the browser to reach `https://*.supabase.co` and nothing else off-origin. If you add an image host or a font CDN later, extend `img-src` / `font-src` there.
- `/admin/*` is served with `Cache-Control: no-store` and `X-Robots-Tag: noindex`, and is excluded in `public/robots.txt` and from the service worker.
- Report submissions are rate-limited in the route handler. That limit is held in memory, so it bounds one serverless instance rather than the whole site — enough to stop a naive flood. If reports ever get abused at scale, move the counter to a shared store such as Netlify Blobs or a Supabase table.
