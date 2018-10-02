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

CREATE TABLE artists (
  id_artist SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id_album SERIAL PRIMARY KEY,
  name VARCHAR(255),
  creation_date TIMESTAMP
);

CREATE TABLE albums_artists (
  id_album INT REFERENCES albums(id_album),
  id_artist INT REFERENCES artists(id_artist),
  PRIMARY KEY (id_album, id_artist)
);

CREATE TABLE songs_artists (
  id_song INT REFERENCES songs(id_song),
  id_artist INT REFERENCES artists(id_artist),
  PRIMARY KEY (id_song, id_artist)
);

CREATE TABLE albums_songs (
  id_album INT REFERENCES albums(id_album),
  id_song INT REFERENCES songs(id_song),
  PRIMARY KEY (id_album, id_song)
);

