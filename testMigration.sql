use codeup_test_db;

creat table if not exists transactions(
    id int,
    date DATE,
    description varchar(255),
    amount decimal(10, 2)
);

creat table if not exists items(
    id int,
    price decimal(10, 2),
    description varchar(255),
    name varchar(100),
    category varchar(150)
);