CREATE OR REPLACE FUNCTION find_favourite_category(user_id INT)
RETURNS INT AS
$$
BEGIN
SELECT id_category, count(id_category) FROM songs
  INNER JOIN playlists_songs ps on songs.id_song = ps.id_song
  INNER JOIN playlists_listeners ON ps.id_playlist = songs.id_song
  WHERE playlists_listeners.id_listener = 500
  GROUP BY id_category;
END;
$$
LANGUAGE plpgsql;

SELECT find_favourite_category(1);