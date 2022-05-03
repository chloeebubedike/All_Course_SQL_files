CREATE DATABASE Pizza_Delivery;
Use Pizza_Delivery;

SELECT * FROM customer;

CREATE TABLE customer(
	id  INTEGER PRIMARY KEY,
    customer_first_name VARCHAR(50),
    customer_last_name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone_number INTEGER NOT NULL,
    email_address VARCHAR(50)
);

SELECT * FROM orders; 
DROP TABLE orders;

CREATE TABLE orders(
	order_id INTEGER PRIMARY KEY,
    pizza_id INTEGER,
    customer_id INTEGER,
    FOREIGN KEY (pizza_id) REFERENCES Pizza(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
    );

DROP TABLE Pizza; 
SELECT * FROM Pizza;

CREATE TABLE Pizza(
id INTEGER PRIMARY KEY,
name VARCHAR(50) NOT NULL,
ingredients VARCHAR(500)
);

INSERT INTO Pizza_Delivery.Pizza(id, name, ingredients)
VALUES 
(1, "tomato and cheese", "cheese, tomato, basil, dough");

INSERT INTO Pizza_Delivery.Customer(id, customer_first_name, customer_last_name, address, phone_number, email_address)
VALUES 
(1, "Chloe", "Louise", "Madrid", "777", "chloelouise@email.com");

INSERT INTO Pizza_Delivery.orders(order_id, pizza_id, customer_id)
VALUES
(1, 1, 1);

INSERT INTO Pizza(id, name, ingredients)
VALUES
(2, "spicy", "peppers, meat, cheese and tomato");

UPDATE Pizza SET ingredients = "lots of peppery peppers"
WHERE id = 2;

UPDATE Pizza SET name = "fishy", ingredients = "lots of fishy";

DELETE FROM Pizza WHERE id = 2;