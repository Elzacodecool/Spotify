CREATE OR REPLACE FUNCTION add_song_to_playlist(id_song INT, id_playlist INT)
  RETURNS VOID AS $$
BEGIN
  INSERT INTO playlists_songs VALUES (id_playlist, id_song);
end;

$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION remove_song_from_playlist(id_removed_song INT, id_removed_playlist INT)
  RETURNS VOID AS $$
BEGIN
  DELETE FROM playlists_songs
    WHERE id_playlist = id_removed_playlist AND id_song = id_removed_song;
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_all_songs_from_user_playlist(id_user INT, id_displayed_playlist INT)
  RETURNS TABLE(
  id_song INT,
  name VARCHAR(255),
  id_category INT
  )
  AS $$
BEGIN
  RETURN QUERY SELECT
    songs.id_song,
    songs.name,
    songs.id_category
  FROM
    playlists_listeners
  JOIN
    playlists_songs
        ON playlists_listeners.id_playlist = playlists_songs.id_playlist
  JOIN
    songs
        ON playlists_songs.id_song = songs.id_song
  WHERE
      playlists_songs.id_playlist = id_displayed_playlist
    AND
      id_listener = id_user;

end;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_songs_from_playlist(id_displayed_playlist INT)
  RETURNS TABLE(
  id_song INT,
  name VARCHAR(255),
  id_category INT
  )
  AS $$
BEGIN
  RETURN QUERY SELECT
    songs.id_song,
    songs.name,
    songs.id_category
  FROM
    playlists_songs
  JOIN
    songs
        ON playlists_songs.id_song = songs.id_song
  WHERE
      playlists_songs.id_playlist = id_displayed_playlist;
end;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION display_songs_from_user_playlist(id_user INT, id_displayed_playlist INT)
  RETURNS VOID AS $$
BEGIN
  SELECT * FROM get_all_songs_from_user_playlist(id_user, id_displayed_playlist);
end;
$$ LANGUAGE plpgsql;


DO $$
  BEGIN
    PERFORM remove_song_from_playlist(1, 1);
  end;
$$;

DO $$
BEGIN
  PERFORM add_song_to_playlist(1, 1);
end;
$$;

SELECT * FROM  get_all_songs_from_user_playlist(1, 1);

