CREATE TABLE music_albums (
  id INTEGER PRIMARY KEY,
  published_date DATE,
  on_spotify BOOLEAN
);

CREATE TABLE genres (
  id INTEGER PRIMARY KEY,
  name TEXT
);

CREATE TABLE items (
  id INTEGER PRIMARY KEY,
  published_date DATE,
  archived BOOLEAN,
  genre_id INTEGER,
  FOREIGN KEY (genre_id) REFERENCES genres (id)
);
