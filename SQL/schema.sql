CREATE TABLE items (
  id INT PRIMARY KEY,
  published_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  genre_id INT,
  author_id INT,
  label_id INT,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE books (
  id INT PRIMARY KEY,
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(255) NOT NULL,
  item_id INT UNIQUE,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE labels (
  id INT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL,
  item_id INT UNIQUE,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE music_albums (
  id INT PRIMARY KEY,
  on_spotify BOOLEAN NOT NULL,
  item_id INT UNIQUE,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE genres (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE games (
  id INT PRIMARY KEY,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  item_id INT UNIQUE,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE authors (
  id INT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
);
