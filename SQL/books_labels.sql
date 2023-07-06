CREATE TABLE items (
  id INTEGER PRIMARY KEY,
  published_date DATE,
  archived BOOLEAN
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
