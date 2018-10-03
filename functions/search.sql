CREATE OR REPLACE FUNCTION search_by_phrase(phrase VARCHAR(255))
  RETURNS TABLE (
  id INT,
  name VARCHAR(255),
  table_name VARCHAR(255)
  )
  AS $$
DECLARE pattern VARCHAR(255) := phrase || '%';
BEGIN
  RETURN QUERY
  (SELECT id_album, albums.name, 'album'::varchar(255)
    FROM albums
    WHERE albums.name LIKE pattern
    LIMIT 2)

    UNION ALL

  (SELECT id_artist, artists.name, 'artist'::varchar(255)
    FROM artists
    WHERE artists.name LIKE pattern
    LIMIT 2)

    UNION ALL

  (SELECT id_song, songs.name, 'song'::varchar(255)
    FROM songs
    WHERE songs.name LIKE pattern
    LIMIT 10);
end;
$$ LANGUAGE plpgsql;


SELECT * FROM search_by_phrase('H');

