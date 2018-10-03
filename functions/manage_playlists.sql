CREATE OR REPLACE FUNCTION get_all_playlists(id_user INT)
RETURNS TABLE (id_playlist INT , name VARCHAR(255), id_owner INT)
AS $$
BEGIN
RETURN QUERY SELECT
  playlists.id_playlist, playlists.name, playlists.id_owner
  FROM playlists
  INNER JOIN playlists_listeners ON playlists_listeners.id_playlist = playlists.id_playlist
  WHERE playlists_listeners.id_listener = id_user;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_playlists(id_user INT, playlist_id INT)
RETURNS VOID AS $$
BEGIN
DELETE FROM playlists_listeners
  WHERE playlists_listeners.id_listener = id_user AND playlists_listeners.id_playlist = playlist_id;
IF (SELECT exists (SELECT 1 FROM playlists_listeners WHERE id_playlist = playlist_id LIMIT 1)) THEN RETURN ;
  ELSE
    DELETE FROM playlists
    WHERE playlists.id_playlist = playlist_id;
  END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION create_empty_playlist(playlist_name VARCHAR, owner_id INT)
  RETURNS VOID AS $$
BEGIN
  INSERT INTO playlists(name, id_owner)
  VALUES (playlist_name, owner_id);
END;
$$ LANGUAGE plpgsql;

--ONLY TO READ
CREATE OR REPLACE FUNCTION update_playlists_listeners(id_user INT, playlist_id INT)
RETURNS VOID AS
$$
BEGIN
 INSERT INTO playlists_listeners(id_playlist, id_listener)
 VALUES(playlist_id,id_user);
END;
$$
LANGUAGE plpgsql;


SELECT create_empty_playlist('newconnection2', 1);

SELECT update_playlists_listeners(2, 1006);

SELECT delete_playlists(2,1006);

SELECT * FROM  get_all_playlists(2);