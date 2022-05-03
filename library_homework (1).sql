CREATE database library;

Use library;
CREATE TABLE library_user (
borrower_id int not null primary key auto_increment,
surname varchar(50) not null, 
first_name varchar(50) not null,
address varchar(150) not null,
post_code varchar(10) not null,
dob date not null,
telephone int null,
email varchar(50) null
);

SELECT * FROM book_details;

CREATE TABLE book_details (
library_barcode int not null primary key auto_increment,
ISBN int not null,
title varchar(250) not null,
author varchar(50) not null,
publication_date date not null
);

CREATE TABLE loans (
loan_id int not null primary key auto_increment,
borrower_id int not null,
foreign key (borrower_id) references library_user(borrower_id),
library_barcode int not null,
foreign key (library_barcode) references book_details(library_barcode),
due_date date not null,
fines real null
);

CREATE TABLE book_stock (
ISBN int not null primary key,
total_quantity int not null,
quantity_available int not null,
quantity_on_loan int not null,
quantity_overdue int not null
);

DROP TABLE book_genre;

CREATE TABLE book_genre(
library_barcode int not null auto_increment,
foreign key (library_barcode) references book_details(library_barcode)
ON UPDATE CASCADE
ON DELETE CASCADE,
genre varchar(50) unique not null,
shelf_id VARCHAR(50) not null
);

ALTER TABLE book_genre 
ADD FOREIGN KEY (library_barcode)
REFERENCES book_details(library_barcode);

CREATE TABLE staff (
staff_id int not null primary key auto_increment,
surname varchar(50) not null, 
first_name varchar(50) not null,
address varchar(150) not null,
post_code varchar(10) not null,
dob date not null,
telephone int not null,
email varchar(50),
NINO varchar(20) not null,
borrower_id int null,
foreign key (borrower_id) references library_user(borrower_id)
);

CREATE TABLE staff_details(
staff_id int not null,
foreign key (staff_id) references staff(staff_id),
job_title varchar(50) not null,
dept_no int not null,
contract_type varchar(20) not null,
CONSTRAINT CHK_contract_type CHECK (contract_type = 'Perm' OR contract_type = 'Temp' OR contract_type = 'Fixed_term'),
annual_salary real not null
);

CREATE TABLE staff_dept(
dept_no  int not null,
dept_name varchar(50) not null,
CONSTRAINT CHK_dept_name CHECK (dept_name = 'Security' OR dept_name = 'Shelvers' OR dept_name = 'Counter staff' OR dept_name = 'Mangement')
);

SELECT * FROM book_genre;

INSERT INTO book_genre
(genre, shelf_id)
VALUES
('Test2', '1'),
('Test3', '100');

INSERT INTO Staff (staff_id, surname, first_name, address, post_code, dob, telephone, email, NINO, borrower_id)
VALUES
('Smith', 'Charlie', '92 Courts Road, London', 'BR2 6JD', 01/04/1994, 0168456372, 'CM@hotmail.com', GX130067E, 20084712),
('Moore', 'Ruth', '1b Archer Close, New Cross', 'SE14 8CD',06/12/1989, 092846522, 'Ruth_M@gmail.com', PX070019D, 20467829 ),
('Bond', 'Jane', '14 Dundle Crescent, London', 'EC16 6GH', 23/10/2000, 293876598, 'JB_x@yahoo.com', QT934069R, 21474982),
('Jones', 'Carolyne', '22 Clinton Drive, Romford', ' 4GH' , 19551111, 147258369, 'd.daniels@swimming.co.uk',GB23146E, 21108746),
('Jones', 'Caroline', '3b Devon House, New Cross', 'SE14 1RJ', 19771225, 963258741, 'e.edwards@yahoo.com', FT23146E, 20001041);


INSERT INTO library_user (surname, first_name, address, post_code, dob, telephone, email)
VALUES
('Adams', 'Alison', 'Flat 1 Privet Drive, London', 'E15 5AB', 19451001, 0123456789, 'alisonadams@hotmail.com'),
('Brown', 'Barbara', '2 Hollywood Crescent, Seven Sisters', 'N12 2CD', 19800215, 345678915, 'bb@hotmail.com'),
('Coleman', 'Coleen', '3 Wellington Drive, London', 'E14 6EF', 19860525, 456789126, 'c.coleman@yahoo.com'),
('Daniels', 'Danny', '4 Coleman House, Victoria Street', 'SW17 4GH' , 19551111, 147258369, 'd.daniels@swimming.co.uk'),
('Edwards', 'Ellie', '5 Devon Mansions, London', 'N14 8IJ', 19771225, 963258741, 'e.edwards@yahoo.com');

INSERT INTO book_details (ISBN, title, author, publication_date)
VALUES
(1906021953, 'Mind the Gap', 'Ferdinand Mount', 20100204),
(1783962437, 'Prisoners of Geography', 'Tim Marshall', 20160702),
(1526646651, "Harry Potter and the Philosopher's Stone", 'J.K. Rowling', 20011008),
(1409306305, 'The Gingerbread Man', 'Alan McDonald', 20110224),
(1473662079, 'Misery','Stephen King', 20070531);