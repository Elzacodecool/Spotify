CREATE VIEW favourite_category AS
SELECT id_listener, id_category, count(id_category) as count FROM songs
  INNER JOIN playlists_songs ps on songs.id_song = ps.id_song
  INNER JOIN playlists_listeners ON ps.id_playlist = playlists_listeners.id_playlist
  GROUP BY id_listener, id_category;

CREATE OR REPLACE FUNCTION find_favourite_category(user_id INT)
RETURNS INT AS
  $$
DECLARE
  maxCATegory INT;

BEGIN
SELECT id_category FROM favourite_category WHERE count = (SELECT max(count) FROM favourite_category WHERE id_listener = user_id INTO maxCATegory);
  RETURN maxCATegory;
END;
$$
LANGUAGE plpgsql;

SELECT find_favourite_category(12);