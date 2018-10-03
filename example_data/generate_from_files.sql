COPY listeners(name, login, password, register_date)
  FROM 'C:\Users\Eliza\codecool\Spotify\example_data\listeners.csv' DELIMITER ',' CSV HEADER;

COPY categories(name)
  FROM '/Users/elzbietakrzych/Documents/codecool/ADVANCED/2018_10_01_TW/Spotify/example_data/categories.csv' DELIMITER ',' CSV HEADER;

COPY artists(name)
  FROM '/Users/elzbietakrzych/Documents/codecool/ADVANCED/2018_10_01_TW/Spotify/example_data/artists.csv' DELIMITER ',' CSV HEADER;

COPY albums(name)
  FROM '/Users/elzbietakrzych/Documents/codecool/ADVANCED/2018_10_01_TW/Spotify/example_data/albums.csv' DELIMITER ',' CSV HEADER;

COPY premium_accounts(id_listener, open_date, termination_date)
  FROM 'C:\Users\Eliza\codecool\Spotify\example_data\premium_accounts.csv' DELIMITER ',' CSV HEADER;

COPY playlists(name, id_owner)
  FROM 'C:\Users\Eliza\codecool\Spotify\example_data\playlists.csv' DELIMITER ',' CSV HEADER;
