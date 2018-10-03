INSERT INTO categories(name) VALUES ('jnnnnjnjnjnazz');

INSERT INTO songs(name, id_category) VALUES ('Happy Birthday', 1);

INSERT INTO artists(name) VALUES ('Sheila Sue');

INSERT INTO albums(name) VALUES ('Hello');

INSERT INTO albums_artists VALUES(1,1);

INSERT INTO albums_songs VALUES(1,1);

INSERT INTO songs_artists VALUES(1,1);



INSERT INTO listeners(name, login, password, register_date)
  VALUES ('Ela', 'elka', 'password', now());

INSERT INTO playlists(name, id_owner)
  VALUES ('testttssvhgvgssss', 1);

INSERT INTO playlists_listeners VALUES (1,1);

INSERT INTO premium_accounts(id_listener, open_date, termination_date)
  VALUES (1, now(), now() + interval '1 month');

INSERT INTO playlists_songs VALUES (1, 1);
