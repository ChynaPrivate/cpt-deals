-- Table grants Supabase applies automatically for the anon/authenticated roles.
grant select on public.restaurants, public.specials to anon, authenticated;
grant insert on public.reports to anon, authenticated;
grant select, insert, update, delete on
  public.restaurants, public.specials, public.reports,
  public.research_queue, public.admin_profiles
  to authenticated;
grant execute on function public.current_cpt_date() to anon, authenticated;
