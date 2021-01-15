USE codeup_test_db;

SHOW TABLES;

SELECT * FROM albums;

DESCRIBE albums;

ALTER TABLE albums
ADD UNIQUE(name, artist);

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Test Artist 3', 'Test Album asdf', 2000, 11, 'Test2 Genre');

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Test Artist 3', 'Test Album asdf', 2000, 11, 'Test2 Genre');