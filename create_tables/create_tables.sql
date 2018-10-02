CREATE TABLE categories (
  id_category SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE songs (
  id_song SERIAL PRIMARY KEY,
  name VARCHAR(255),
  id_category INTEGER REFERENCES categories(id_category)
);


CREATE TABLE listeners (
  id_listener SERIAL PRIMARY KEY,
  name VARCHAR(255),
  login VARCHAR(255) UNIQUE,
  password VARCHAR(255),
  register_date TIMESTAMP
);

CREATE TABLE premium_accounts (
  id_premium SERIAL PRIMARY KEY,
  id_listener INT REFERENCES listeners(id_listener),
  open_date TIMESTAMP,
  termination_date TIMESTAMP
);

CREATE TABLE playlists (
  id_playlist SERIAL PRIMARY KEY,
  name VARCHAR(255),
  id_owner INT REFERENCES listeners(id_listener)
);

CREATE TABLE playlists_listeners (
  id_playlist INT REFERENCES playlists(id_playlist),
  id_listener INT REFERENCES listeners(id_listener),
  PRIMARY KEY (id_playlist, id_listener)
);

CREATE TABLE playlists_songs (
  id_playlist INT REFERENCES playlists(id_playlist),
  id_song INT REFERENCES songs(id_song),
  PRIMARY KEY (id_playlist, id_song)
);

