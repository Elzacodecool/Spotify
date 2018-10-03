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

