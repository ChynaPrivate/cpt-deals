-- Stop the same Instagram post being filed as a research candidate twice.
--
-- On 26 August 2026 the research queue held 111 rows sourced from Instagram
-- but only 72 distinct post permalinks — 39 duplicates, a third of the queue.
-- Whoever reviews it would have read a third of it twice.
--
-- The application fix is in netlify/functions/instagram-sweep.mts (one sweep
-- per account, and the permalink is claimed before the insert is awaited).
-- This migration cleans up what is already there and adds the guarantee the
-- database should have had from the start.

-- --------------------------------------------------------------------------
-- 1. Remove the existing duplicates, keeping the earliest row for each post.
-- --------------------------------------------------------------------------
-- The oldest row is kept deliberately: if an administrator has already worked
-- on one of these, it is the one that has been sitting in the queue longest.
-- A row that has been reviewed always wins over an untouched copy.
with ranked as (
  select
    id,
    row_number() over (
      partition by source_url
      order by
        (review_status <> 'pending') desc,  -- anything already actioned wins
        created_at asc,
        id asc
    ) as copy_number
  from public.research_queue
  where source_url ~* 'instagram\.com/(p|reel|reels|tv)/'
)
delete from public.research_queue q
using ranked
where q.id = ranked.id
  and ranked.copy_number > 1;

-- --------------------------------------------------------------------------
-- 2. Make it impossible to file the same post twice.
-- --------------------------------------------------------------------------
-- Partial, and deliberately so. A post permalink identifies one offer at one
-- venue, so it is a safe identity. A source_url in general is NOT: six of our
-- seeded candidates cite the same Cape Town happy-hour round-up, one per venue
-- it covers, and that is correct data. Constraining every source_url would
-- reject five of them.
create unique index if not exists research_queue_instagram_permalink_key
  on public.research_queue (source_url)
  where source_url ~* 'instagram\.com/(p|reel|reels|tv)/';

comment on index public.research_queue_instagram_permalink_key is
  'One research candidate per Instagram post. Round-up articles are not covered — several venues may legitimately share one article URL.';
