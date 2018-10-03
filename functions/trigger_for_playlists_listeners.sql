
CREATE OR REPLACE FUNCTION update_playlists_listeners()
  RETURNS trigger AS
$$
BEGIN
 INSERT INTO playlists_listeners(id_playlist, id_listener)
 VALUES(NEW.id_playlist,NEW.id_owner);
 RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER play_list_update
  AFTER INSERT
  ON playlists
  FOR EACH ROW
  EXECUTE PROCEDURE update_playlists_listeners();
