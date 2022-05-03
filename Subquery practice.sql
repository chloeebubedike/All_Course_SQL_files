CREATE DATABASE customers_database;
USE customers_database;

CREATE TABLE customer (
    customer_id INTEGER NOT NULL,
    first_name VARCHAR(55) NOT NULL,
    last_name VARCHAR(55) NULL,
    CONSTRAINT PK_customer PRIMARY KEY (customer_id)
);

CREATE TABLE address (
    address_id INTEGER NOT NULL,
    building_number VARCHAR(55) NOT NULL,
    street VARCHAR(55) NOT NULL,
    city VARCHAR(55),
    post_code VARCHAR(55) NOT NULL,
    country VARCHAR(55),
    CONSTRAINT PK_Address PRIMARY KEY (address_id)
);

CREATE TABLE email_address (
    email_address_id INTEGER NOT NULL,
    customer_id INTEGER,
    email_address VARCHAR(55) NOT NULL,
    CONSTRAINT PK_email_address PRIMARY KEY (email_address_id)
);

CREATE TABLE phone_number (
    phone_number_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    phone_number VARCHAR(55) NOT NULL,
    CONSTRAINT PK_phone_number PRIMARY KEY (phone_number_id)
);

CREATE TABLE orders (
    order_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT PK_order_id PRIMARY KEY (order_id)
);


INSERT INTO address 
(address_id, building_number, street, city, post_code, country) 
VALUES 
(1, '20', 'Birch Alley', 'London', 'SE24 0AB', 'UK'),
(2, '17', 'Oak Street', 'London', 'SE25 0XY', NULL);

INSERT INTO customer 
(customer_id, first_name, last_name) 
VALUES 
(1, 'Jon', 'Flanders'),
(2, 'Sam', 'Smith');

INSERT INTO email_address 
(email_address_id, customer_id, email_address)
VALUES 
(1, 2, 'ssmith@mail.com'),
(2, 1, 'jon@mail.com');
 
 
INSERT INTO phone_number 
(phone_number_id, customer_id, phone_number) 
VALUES 
(1, 1, '555-1212'),
(2, 2, '555-3344');
  
  
INSERT INTO orders 
(order_id, customer_id, order_date) 
VALUES 
(1, 1, '2019-08-20'),
(2, 2, '2019-03-15');

ALTER TABLE email_address  
ADD  CONSTRAINT 
FK_email_address_customer 
FOREIGN KEY(customer_id)
REFERENCES customer (customer_id);

ALTER TABLE phone_number   
ADD  CONSTRAINT FK_phone_number_customer 
FOREIGN KEY(customer_id)
REFERENCES customer (customer_id);

SELECT * FROM customer;
SELECT * FROM email_address;
SELECT * FROM orders;
SELECT * FROM Clothing_Shops;

INSERT INTO customer (customer_id, first_name, last_name)
VALUES 
(4, "Chloe", "Ebubedike");

INSERT email_address (email_address_id, customer_id, email_address)
VALUES (4, 4, "chloeemail@yahoo.com");

INSERT INTO orders (order_id, customer_id, order_date)
VALUES 
(3, 3, "2021-03-15"),
(4, 4, "2021-03-15");

UPDATE customer SET first_name = "Beyonce", last_name = "Knowles"
WHERE customer_id = 4;

-- Subquery 
SELECT * FROM orders 
WHERE customer_id IN 
(SELECT customer_id FROM email_address 
WHERE email_address = "chloeemail@yahoo.com");

-- Subquery 
-- All data from Clothing Shops where orders ids are the same as the orders ids which have customer ids with email from Chloe
SELECT store_name FROM Clothing_Shops 
WHERE order_id IN 
-- All order ids where customer ids have email from Chloe
(SELECT order_id FROM orders 
WHERE customer_id IN
-- All customer ids where email from Chloe
	(SELECT customer_id FROM email_address
	WHERE email_address = "chloeemail@yahoo.com"));

DROP TABLE Clothing_Shops;

CREATE TABLE Clothing_Shops
(store_id INTEGER PRIMARY KEY,
store_name VARCHAR(100),
order_id INTEGER,
CONSTRAINT FOREIGN KEY (order_id) REFERENCES orders(order_id));

INSERT INTO 
Clothing_Shops (store_id, store_name, order_id)
VALUES 
(3, "House of CB", 3),
(4, "Mistress Rocks", 4);

USE Parts;
SELECT * FROM SUPPLY;

-- Find the name and status of each supplier who supplies the project J2 
SELECT SNAME, STATUS FROM SUPPLIER 
WHERE S_ID IN
(SELECT S_ID FROM SUPPLY
WHERE J_ID = "J2");

-- Find the name and city of each project supplied by a London based supplier
SELECT JNAME, CITY FROM PROJECT 
WHERE J_ID IN
(SELECT J_ID FROM SUPPLY
WHERE CITY = "LONDON");
