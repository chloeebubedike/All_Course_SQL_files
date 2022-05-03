create database book_library;
use book_library;
create table book_name
(BookID int not null primary key auto_increment,
BookName varchar(100) not null
);

INSERT INTO book_name (BookName)
VALUES
('Brand Strategy'),
('Fundamentals of Financial Services'),
('Methology in the modern world'),
('Comfort Food'),
('Why is the sky blue?');

create table genre
(genreID int not null primary key auto_increment,
GenreName varchar(50) not null
);

INSERT INTO genre (GenreName)
VALUES
('Comedy'),
('Educational'),
('History'),
('Cooking'),
('Business');

create table genreID
(BookID int PRIMARY KEY, FOREIGN KEY(BookID) references book_name(BookID),
genreID int, FOREIGN KEY(genreID) references genre(genreID)
);

create table Author
(AuthorID int not null primary key auto_increment,
FirstName varchar(100),
Surname varchar(100)
);

INSERT INTO Author (FirstName, Surname)
VALUES
('Alison', 'Bor'),
('Claire', 'Joules'),
('David', 'King'),
('Mary', 'Kite'),
('Ruby', 'Denn');


create table User 
(UserID int not null primary key auto_increment,
FirstName varchar(100),
Surname varchar(100),
DOB date,
AddressID int, FOREIGN KEY (AddressID) references Address(AddressID)
);

INSERT INTO User (FirstName, Surname, DOB, AddressID)
VALUES
('Jenny', 'Yi', 19691203, 1),
('Boris' , 'Weeden', 19990312, 2),
('Clarissa', 'Benjamin', 19540525, 3),
('Yvonne', 'Benjamin' , 20070622, 3),
('Fiona', 'Joy' , 20100529, 4),
('Daniel', 'Lee' , 20080612, 4);

create table Department
(DepartmentID int not null primary key auto_increment,
DepartmentName varchar(50));

INSERT INTO Department (DepartmentName)
VALUES
('Finances'),
('Counter staff'),
('Human Resources');

create table staff
(staffID int not null primary key auto_increment,
DeparmentID int, FOREIGN KEY (DepartmentID) references Department(DepartmentID),
FirstName  varchar(100) not null,
Surname  varchar(100) not null
);

create table stock
(BookID int PRIMARY KEY , FOREIGN KEY (BookID) references book_name(BookID),
Quantity int);


create table Address 
(AddressID int not null primary key auto_increment,
AddressFirstLine varchar(100),
AddressSecondLine varchar(100),
City varchar(30),
Postcode varchar(10)
);

INSERT INTO Address (AddressFirstLine, AddressSecondLine, City, Postcode)
VALUES
('24', 'Avenue Drive', 'London', 'UB4 8EK'),
('64', 'Costans Hair', 'Bristol', 'B52, 9G5'),
('24A', 'Oxford Road', 'Leeds', 'LG5 1UR'),
('91', 'The Riverside', 'Edinburgh', 'E5 4SU');

drop table stock;

create table stock
(BookID int PRIMARY KEY , FOREIGN KEY (BookID) references book_name(BookID),
Quantity int);

INSERT INTO stock (BookID, Quantity)
VALUES
(1, 12), (2, 30), (3, 1), (4, 10), (5, 0);

DROP TABLE loans;
SELECT * FROM loans;

create table loans
(loanID INT PRIMARY KEY AUTO_INCREMENT,
userID int, 
FOREIGN KEY (userID) references user(userID),
returned date, 
checkin date,
BookID int, 
FOREIGN KEY (BookID) references book_name(BookID)
);

INSERT INTO loans (userID, returned, checkin, bookID)
VALUES
(1, 2022-03-19, 2022-03-20, 1),
(3, 2022-02-25, 2022-02-28, 3);


-- View all books available with their author, total quantity and genre (join)
-- Update loan table to add a new book loan for one user if total books is > 0



