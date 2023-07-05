CREATE TABLE books (
  id INTEGER PRIMARY KEY,
  published_date DATE,
  archived BOOLEAN,
  genre_id INTEGER,
  author_id INTEGER,
  label_id INTEGER,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE labels (
  id INTEGER PRIMARY KEY,
  title TEXT,
  color TEXT
);

