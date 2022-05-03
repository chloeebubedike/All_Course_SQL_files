-- CREATE database library;

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

CREATE TABLE book_genre(
library_barcode int not null,
foreign key (library_barcode) references book_details(library_barcode),
genre varchar(50) unique not null,
shelf_id real not null
);

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