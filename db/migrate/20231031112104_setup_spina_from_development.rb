class SetupSpinaFromDevelopment < ActiveRecord::Migration[7.1]
  def change
    return unless Rails.env.production?
    # execute raw SQL in postgres
    execute <<-SQL
      COPY public.spina_users (id, name, email, password_digest, admin, created_at, updated_at, last_logged_in, password_reset_token, password_reset_sent_at) FROM stdin;
      1	admin	test@test.com	$2a$12$tkxYgoYIBaCCun18Oh3WPuHl/UvM81ZSOP/12HAQBWzKFUHsAaWIm	t	2023-10-31 10:23:25.985062	2023-10-31 10:30:19.779301	2023-10-31 10:30:19.779301	unLHbbJ9Bwk74vPHWxaxAqTX	\N
      \.
      COPY public.spina_pages (id, show_in_menu, slug, deletable, created_at, updated_at, name, skip_to_first_child, view_template, layout_template, draft, link_url, ancestry, "position", active, resource_id, json_attributes, ancestry_depth, ancestry_children_count) FROM stdin;
1	t	\N	f	2023-10-31 10:23:36.479757	2023-10-31 10:23:36.485137	homepage	f	homepage	\N	f	\N	\N	1	t	\N	{"en_content": []}	0	\N
2	t	\N	t	2023-10-31 10:30:34.735717	2023-10-31 10:31:01.175707	\N	f	show	\N	f	\N	\N	2	t	\N	{"en_content": [{"name": "text", "type": "Spina::Parts::Text", "content": "<div>The content of <strong>this page</strong>.</div>"}]}	0	\N
\.
COPY public.spina_page_translations (id, spina_page_id, locale, title, menu_title, description, seo_title, materialized_path, created_at, updated_at, url_title) FROM stdin;
1	1	en	Homepage	\N	\N	\N	/	2023-10-31 10:23:36.483558	2023-10-31 10:23:36.483558	\N
2	2	en	Another page	\N	and description	New title	/another-page	2023-10-31 10:30:34.744125	2023-10-31 10:31:01.172838	\N
\.
COPY public.spina_navigations (id, name, label, auto_add_pages, "position", created_at, updated_at) FROM stdin;
1	main	Main navigation	f	0	2023-10-31 10:23:35.694071	2023-10-31 10:23:35.694071
\.
COPY public.spina_accounts (id, name, address, postal_code, city, phone, email, preferences, created_at, updated_at, robots_allowed, json_attributes) FROM stdin;
1	MySite	\N	\N	\N	\N	\N	---\ntheme: default\n	2023-10-31 10:23:10.77127	2023-10-31 10:23:12.348333	f	{"en_content": []}
\.
    SQL
    
  end
end
