CREATE OR REPLACE FUNCTION delete_listener(id_user INT)
RETURNS VOID AS $$
BEGIN
DELETE FROM listeners
  WHERE listeners.id_listener = id_user;
END;
$$ LANGUAGE plpgsql;

INSERT INTO listeners(name, login, password, register_date)
  VALUES ('WWWW', 'ewer', 'password', now());

SELECT delete_listener(2004);