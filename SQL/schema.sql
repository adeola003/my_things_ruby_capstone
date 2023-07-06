CREATE TABLE items (
  id INTEGER PRIMARY KEY,
  published_date DATE,
  archived BOOLEAN,
  genre_id INTEGER,
  author_id INTEGER,
  label_id INTEGER
);

CREATE TABLE books (
  id INTEGER PRIMARY KEY,
  publisher TEXT,
  cover_state TEXT,
  item_id INTEGER,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE labels (
  id INTEGER PRIMARY KEY,
  title TEXT,
  color TEXT,
  item_id INTEGER,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE games (
  id INTEGER PRIMARY KEY,
  last_played_at TIMESTAMP,
  item_id INTEGER,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE genres (
  id INTEGER PRIMARY KEY,
  name TEXT
);

CREATE TABLE authors (
  id INTEGER PRIMARY KEY,
  name TEXT
);
