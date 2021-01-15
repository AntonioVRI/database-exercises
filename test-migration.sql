use codeup_test_db;

create table if not exists transactions(
    id int,
    date DATE,
    description varchar(255),
    amount decimal(10, 2)
);

create table if not exists items(
    id int,
    price decimal(10, 2),
    description varchar(255),
    name varchar(100),
    category varchar(150)
);

create table if not exists users(
    id int unsigned not null auto_increment,
    is_admin tinyint default 0,
    zipcode char(15) default '77777',
    primary key(id)
);

create table if not exists books(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_first_name VARCHAR(100) NOT NULL,
    author_last_name VARCHAR(100),
    year CHAR(4),
    synopsis TEXT,
    PRIMARY KEY(id)
);

create table if not exists contacts(
    id int unsigned not null auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    phone_number varchar(50) not null,
    address varchar(150),
    email varchar(50),
    zipcode char(20),
    primary key(id)
);