USE codeup_test_db;

drop table if exists albums;

create table if not exists albums(
    id int unsigned not null auto_increment,
    artist varchar(50) not null default 'Unknown',
    name varchar(50) not null default 'Untitled',
    release_date int unsigned,
    sales float unsigned,
    genre char(50),
    primary key(id)
);