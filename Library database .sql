CREATE DATABASE Library;
USE Library;

-- Create book table 
CREATE TABLE Books (
book_name INT PRIMARY KEY AUTO_INCREMENT,
author_first_name VARCHAR(50),
author_last_name VARCHAR(50),
genre_code INT,
FOREIGN KEY (genre_code) REFERENCES Genre(id),
stock_id INT,
FOREIGN KEY (stock_id) REFERENCES Stock(id)
);

-- Create genre table 
CREATE TABLE Genre (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50)
);

-- Create user table 
CREATE TABLE User(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
address_id INT AUTO_INCREMENT,
FOREIGN KEY (address_id) REFERENCES Address(id),
staff_id VARCHAR(2)
);

-- Create staff table
CREATE TABLE Staff(
id INT PRIMARY KEY,
department_id INT
);

CREATE TABLE Address(
id INT PRIMARY KEY, 
first_line VARCHAR(50),
second_line VARCHAR(50),
third_line VARCHAR(50),
post_code VARCHAR(50)
);

CREATE TABLE Stock(
id INT PRIMARY KEY, 
book_total INT
);

CREATE TABLE Department(
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE Fines (
id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
FOREIGN KEY (user_id) REFERENCES User(id),
total INT
);

INSERT INTO Genre
(id, name)
VALUES 
(1, 'Comedy'),
(2, 'Education'),
(3, 'History'),
(4, 'Cooking'),
(5, 'Business');

INSERT INTO User
(first_name, last_name)
VALUES
('Jen', 'Yi'),
('Boris', 'Wedden'),
('Clarissa', 'Benjamin'),
('Yvonne', 'Dunn'),
('Fiona', 'Joy');

INSERT INTO Address
(first_line, second_line, third_line, post_code)
VALUES
('24', 'Avenue drive', 'London', 'UB4 8EK'),
('64', 'Costons road', 'Bristol', 'W2 5JR'),
('24a', 'Oxford road', 'Leeds', 'E2 RJG'),
('35b', 'Picadilly drive', 'Yorkshire', 'T5 R90'),
('25', 'Bank town', 'Essex', 'F3 IUJ');

SELECT * FROM Genre;
SELECT * FROM User;

-- ALTER TABLE User
-- ADD FOREIGN CONSTRAINT (

CREATE VIEW vw_user_info AS
SELECT id, last_name 
FROM User;

CREATE VIEW vw_user_info_1 AS
SELECT id, last_name 
FROM User
WHERE last_name = 'Beaker';


CREATE VIEW vw_user_info_2 AS
SELECT id, last_name 
FROM User
WHERE last_name = 'Beaker'
WITH CHECK OPTION;

SELECT * FROM vw_user_info_2;

INSERT INTO vw_user_info_2
(last_name)
VALUES
('Ceaker');
