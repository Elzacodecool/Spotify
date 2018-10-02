COPY listeners(name, login, password, register_date)
  FROM 'listeners.csv' DELIMITER ',' CSV HEADER;