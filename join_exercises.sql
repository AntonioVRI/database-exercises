USE join_test_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles(
   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL,
   PRIMARY KEY (id)
);

CREATE TABLE users(
   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL,
   email VARCHAR(100) NOT NULL,
   role_id INT UNSIGNED DEFAULT NULL,
   PRIMARY KEY (id),
   FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

select * from roles;
select * from users;

# Insert 4 new users into the database. One should have a NULL role. The other three should be authors.
INSERT INTO users (name, email, role_id) VALUES
('eric', 'eric@example.com', 2),
('anthony', 'anthony@example.com', 2),
('sarah', 'sarah@example.com', null),
('tim', 'tim@example.com', 2);

select * from users;

# Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
# INNER
SELECT users.name AS user_name, roles.name AS role_name
FROM users
         JOIN roles ON users.role_id = roles.id;

# LEFT
SELECT users.name AS user_name, roles.name AS role_name
FROM users
         LEFT JOIN roles ON users.role_id = roles.id;

# RIGHT
SELECT users.name AS  user_name, roles.name AS role_name
FROM users
         RIGHT JOIN roles ON users.role_id = roles.id;

# Using the example in the Associative Table Joins section as a guide, write a query that shows each department along
# with the name of the current manager for that department.
SELECT r.name, COUNT(*) as Users
FROM users as u
         JOIN roles as r
              ON u.role_id = r.id
GROUP BY r.id;

# Find the name of all departments currently managed by women.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM employees AS e
         JOIN dept_manager AS m
              ON m.emp_no = e.emp_no
         JOIN departments AS d
              ON d.dept_no = m.dept_no
WHERE m.to_date > NOW()
  AND e.gender = 'F'
ORDER BY d.dept_name;

# Find the current titles of employees currently working in the Customer Service department.
SELECT t.title AS "Title", COUNT(*) AS "Count"
FROM departments AS d
         JOIN dept_emp AS de
              ON de.dept_no = d.dept_no
         JOIN titles AS t
              ON t.emp_no = de.emp_no
WHERE de.to_date > NOW()
  AND t.to_date > NOW()
  AND d.dept_name = 'Customer Service'
GROUP BY t.title;

# Find the current salary of all current managers.
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS 'Manager', s.salary
FROM salaries AS s
         JOIN dept_manager AS m
              ON m.emp_no = s.emp_no
         JOIN employees AS e
              ON e.emp_no = m.emp_no
         JOIN departments AS d
              ON d.dept_no = m.dept_no
WHERE m.to_date > NOW()
  AND s.to_date > NOW()
ORDER BY d.dept_name;

# BONUS Find the names of all current employees, their department name, and their current manager's name.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', d.dept_name AS 'Department Name', CONCAT(managers.first_name, ' ', managers.last_name) AS 'Manager Name'
FROM employees AS e
         JOIN dept_emp AS de
              ON de.emp_no = e.emp_no
         JOIN departments AS d
              ON d.dept_no = de.dept_no
         JOIN dept_manager AS m
              ON m.dept_no = d.dept_no
         JOIN employees AS managers
              ON m.emp_no = managers.emp_no
WHERE de.to_date > NOW()
  AND m.to_date > NOW();