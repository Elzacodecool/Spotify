CREATE TABLE categories (
  id_category SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE songs (
  id_song SERIAL PRIMARY KEY,
  name VARCHAR(255),
  id_category INTEGER REFERENCES categories(id_category)
);