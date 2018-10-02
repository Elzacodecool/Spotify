COPY listeners(name, login, password, register_date)
  FROM 'C:\Users\Eliza\codecool\Spotify\example_data\listeners.csv' DELIMITER ',' CSV HEADER;

COPY premium_accounts(id_listener, open_date, termination_date)
  FROM 'C:\Users\Eliza\codecool\Spotify\example_data\premium_accounts.csv' DELIMITER ',' CSV HEADER;

