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
RETURNs VOID AS $$
BEGIN
DELETE FROM playlists_listeners
  WHERE playlists_listeners.id_listener = id_user AND playlists_listeners.id_playlist = playlist_id;
END;
$$ LANGUAGE plpgsql;

INSERT INTO playlists(name, id_owner)
  VALUES ('new Listsds', 1);

SELECT delete_playlists(1,1003);

SELECT * FROM  get_all_playlists(1);