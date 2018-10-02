INSERT INTO categories(name) VALUES ('jazz');

INSERT INTO listeners(name, login, password, register_date)
  VALUES ('Eliza', 'eliza', 'password', now());

INSERT INTO playlists(name, id_owner)
  VALUES ('name', 1);

INSERT INTO playlists_listeners VALUES (1,1);

INSERT INTO premium_accounts(id_listener, open_date, termination_date)
  VALUES (1, now(), now() + interval '1 month');

INSERT INTO playlists_songs VALUES (1, 1);
