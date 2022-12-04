-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_spaces2;

CREATE DATABASE outer_spaces2;

\c outer_spaces2


CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE galaxy 
(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES orbits_around ON DELETE CASCADE,
  galaxy INTEGER REFERENCES galaxy ON DELETE CASCADE
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL,
  orbit_planet INTEGER REFERENCES planets ON DELETE CASCADE
);

INSERT INTO orbits_around (name)
VALUES ('The Sun'), ('Proxima Centauri'), ('Gliese 876');

INSERT INTO galaxy (galaxy_name)
VALUES ('Milky Way');

INSERT INTO planets(name, orbital_period_in_years, orbits_around, galaxy)
VALUES ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

INSERT INTO moons (moon_name, orbit_planet)
VALUES ('The Moon', 1), ('Phobos', 2), ('Despina', 2), ('Thalassa', 4)
--   -- DROP DATABASE lamas_db;
-- -- CREATE DATABASE lamas_db;
-- -- \c lamas_db;

-- -- CREATE TABLE users4 (id SERIAL PRIMARY KEY, username VARCHAR(15) UNIQUE NOT NULL, password VARCHAR(20) NOT NULL);
-- -- INSERT INTO users4 (username, password) VALUES ('graylady', 'dododo'), ('steviechicks', 'lalalal');
-- -- CREATE TABLE comments2 (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users4 ON DELETE CASCADE, comment_text TEXT NOT NULL);
-- -- CREATE TABLE subreddits4 (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users4 ON DELETE SET NULL, name VARCHAR(15) NOT NULL, description TEXT, subscribers INTEGER CHECK (subscribers > 0) DEFAULT 1, is_private BOOLEAN DEFAULT false);


-- CREATE TABLE subreddits (id SERIAL, name VARCHAR(15), description TEXT, subscribers INTEGER, is_private BOOLEAN);


-- -- INSERT INTO subreddits4 (name, user_id ) VALUES ('chickens' , 2), ('waterluvers', 1);