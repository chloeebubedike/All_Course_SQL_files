USE Cohort1;

CREATE TABLE person(
PersonID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(100) NULL,
HobbyID INTEGER,
FOREIGN KEY (HobbyID) REFERENCES hobby(HobbyID)
);

DROP TABLE person;

CREATE TABLE hobby(
HobbyID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
HobbyName VARCHAR(50) NOT NULL,
HobbyDescription VARCHAR(150) NULL

);