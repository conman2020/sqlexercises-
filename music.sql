-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS musica;

CREATE DATABASE musica;

\c musica
CREATE TABLE artists(
id SERIAL PRIMARY KEY,
artist_name TEXT NOT NULL
);
INSERT INTO artists (artist_name)
VALUES ('Hanson'), ('Queen'), ('Mariah Cary'), ('Boyz II Men');

CREATE TABLE albums(
id SERIAL PRIMARY KEY,
album_name TEXT NOT NULL,
artist INTEGER REFERENCES artists

);
INSERT INTO albums (album_name, artist)
VALUES ('Middle of Nowhere', 1), ('A Night at the Opera', 2), ('Daydream', 3);
CREATE TABLE producers(
id SERIAL PRIMARY KEY,
producers_name TEXT NOT NULL
-- album INTEGER REFERENCES albums ON DELETE CASCADE
);
INSERT INTO producers (producers_name)
VALUES ('Dust Brothers' ), ('Stephen Lironi'), ('Roy Thomas Baker'), ('Walter Afanasieff');
CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist INTEGER REFERENCES artists ON DELETE SET NULL,
  album INTEGER REFERENCES albums ON DELETE SET NULL,
  producers INTEGER REFERENCES producers ON DELETE SET NULL
);


INSERT INTO songs
  (title, duration_in_seconds, release_date, artist, album, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 1, 1),
  ('MMMBop', 238, '04-15-1997', 1, 1, 2),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 2, 3),
  ('One Sweet Day', 282, '11-14-1995', 3, 3, 4),
  ('One Sweet Day', 282, '11-14-1995', 4, 3, 4);