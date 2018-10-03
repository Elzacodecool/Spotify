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


CREATE OR REPLACE FUNCTION get_songs_from_album(id_displayed_album INT)
  RETURNS TABLE (
  id_song INT,
  name VARCHAR(255),
  id_category INT
  ) AS $$
BEGIN
  RETURN QUERY SELECT
  songs.id_song,
  songs.name,
  songs.id_category
  FROM
       albums_songs
  JOIN
      songs
      ON albums_songs.id_song = songs.id_song
  WHERE albums_songs.id_album = id_displayed_album;

end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_artists_from_album(id_displayed_album INT)
  RETURNS TABLE (
  id_artist INT,
  name VARCHAR(255)
  ) AS $$
BEGIN
  RETURN QUERY SELECT
  artists.id_artist,
  artists.name
  FROM
       albums_artists
  JOIN
      artists
        ON albums_artists.id_artist = artists.id_artist
  WHERE albums_artists.id_album = id_displayed_album;

end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_songs_by_artist(id_displayed_artist INT)
  RETURNS TABLE (
  id_song INT,
  name VARCHAR(255),
  id_category INT
  ) AS $$
BEGIN
  RETURN QUERY SELECT
  songs.id_song,
  songs.name,
  songs.id_category
  FROM
       songs_artists
  JOIN
      songs
      ON songs_artists.id_song = songs.id_song
  WHERE songs_artists.id_artist = id_displayed_artist;

end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_albums_by_artist(id_displayed_artist INT)
  RETURNS TABLE (
  id_album INT,
  name VARCHAR(255)
  ) AS $$
BEGIN
  RETURN QUERY SELECT
  albums.id_album,
  albums.name
  FROM
       albums_artists
  JOIN
      albums
        ON albums_artists.id_album = albums.id_album
  WHERE albums_artists.id_artist = id_displayed_artist;

end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_artists_by_song(id_displayed_song INT)
  RETURNS TABLE (
  id_artist INT,
  name VARCHAR(255)
  ) AS $$
BEGIN
  RETURN QUERY SELECT
  artists.id_artist,
  artists.name
  FROM
      songs_artists
  JOIN
      artists
      ON songs_artists.id_artist = artists.id_artist
  WHERE songs_artists.id_song = id_displayed_song;

end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_albums_by_song(id_displayed_song INT)
  RETURNS TABLE (
  id_album INT,
  name VARCHAR(255)
  ) AS $$
BEGIN
  RETURN QUERY SELECT
  albums.id_album,
  albums.name
  FROM
       albums_songs
  JOIN
      albums
      ON albums_songs.id_album = albums.id_album
  WHERE albums_songs.id_song = id_displayed_song;

end;
$$ LANGUAGE plpgsql;





SELECT * FROM search_by_phrase('H');
SELECT * FROM get_songs_from_album(1);
SELECT * FROM get_artists_from_album(1);
SELECT * FROM get_songs_by_artist(1);
SELECT * FROM get_albums_by_artist(1);
SELECT * FROM get_artists_by_song(1);
SELECT * FROM get_albums_by_song(1);


