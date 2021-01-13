USE codeup_test_db;

# Deleting albums released after 1991
DELETE FROM albums WHERE release_date > 1991;

# Deleting all Disco albums
DELETE FROM albums WHERE genre = 'Disco';

# Deleting Whitney Houston's albums
DELETE FROM albums WHERE artist = 'Whitney Houston / Various artists';
