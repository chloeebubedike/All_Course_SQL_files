-- Joins revision 

CREATE DATABASE revision;

USE revision;

CREATE TABLE customers (
ID INT primary key auto_increment,
FirstName varchar(50) not null,
LastName varchar(50) not null
);

CREATE TABLE booking (
Booking_ID INT primary key auto_increment,
customerID INT,
FOREIGN KEY (customerID) REFERENCES customers(ID),
lashType varchar(50) not null
);

INSERT INTO customers (FirstName, LastName)
VALUES 
('Claire', 'Smith'),
('Kristina', 'John'),
('Alisha', 'Marie');

SELECT * FROM booking;

INSERT INTO booking (customerID, lashType)
VALUES 
(1, 'Classic'),
(2, 'Volume'),
(3, 'Extra Volume');

CREATE TABLE infill (
Booking_ID INT,
FOREIGN KEY (Booking_ID) REFERENCES booking(Booking_ID),
customerID INT,
FOREIGN KEY (customerID) REFERENCES customers(ID),
infill_needed varchar(50) null
);

INSERT INTO infill (Booking_ID, customerID, infill_needed)
VALUES 
(1, 1, 'Y'),
(2, 2, 'N');

INSERT INTO infill (Booking_ID, customerID)
VALUES 
(3, 3);

SELECT * FROM infill;

-- Table inner join

SELECT COUNT(c.FirstName), b.lashType
FROM customers c
INNER JOIN booking b
ON c.ID = b.customerID
GROUP BY lashType
HAVING lashType = 'extra volume';

-- Table left join
SELECT c.FirstName, i.infill_needed
FROM customers c
LEFT JOIN infill i
ON c.ID = i.customerID;

-- Table right join

SELECT i.infill_needed, c.FirstName
FROM infill i
LEFT JOIN customers c
ON i.customerID = c.ID ;

-- Cross joins 

