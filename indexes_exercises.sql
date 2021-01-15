USE employees;

SHOW TABLES;

# TODO: DESCRIBE each table and inspect the keys and see which columns have indexes and keys.
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE departments;
DESCRIBE dept_manager;
DESCRIBE employees;
DESCRIBE salaries;
DESCRIBE titles;

# TODO: USE your codeup_test_db database.
USE codeup_test_db;

# TODO: Add an index to make sure all album names combined with the
#  artist are unique. Try to add duplicates to test the constraint.
SHOW TABLES;

SELECT * FROM albums;

DESCRIBE albums;

ALTER TABLE albums
    ADD UNIQUE(name, artist);

INSERT INTO albums(artist, name, release_date, sales, genre)
VALUES('Test Artist 3', 'Test Album asdf', 2000, 11, 'Test2 Genre');

INSERT INTO albums(artist, name, release_date, sales, genre)
VALUES ('Test Artist 3', 'Test Album asdf', 2000, 11, 'Test2 Genre');