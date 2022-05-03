USE Cohort1;

SELECT * FROM Person;
SELECT * FROM Hobby;

INSERT INTO Person(FirstName, LastName, HobbyID)
VALUES ('Lisa', 'Simpson', 5);

INSERT INTO Person(FirstName, LastName, HobbyID)
VALUES 
('Bart', 'Simpson', 8),
('Marge', 'Simpson', 7),
('Homer', 'Simpson', 6);

UPDATE Person 
SET Email = 'marge@yahoo.com'
WHERE PersonID = 3;

UPDATE Hobby
SET HobbyDescription = 'Lifting heavy weights'
WHERE HobbyID = 3;

UPDATE Hobby
SET HobbyDescription = 'Walking on a trail'
WHERE HobbyID = 1;

UPDATE Hobby
SET HobbyDescription = 'Looking at words'
WHERE HobbyID = 5;

insert into person(Firstname, lastname, Email, hobbyid)
values ('Fred', 'Flintstone', 'fred@yahoo.com', 6),
('Wilma', 'Flintstone', 'wilma@yahoo.com', 1),
('Johnny', 'Depp', null, 2),
('Lily-Rose', 'Depp', 'lilyrose@gmail.com', 2),
('Fred', 'Jones', 'jones@hotmail.com', 7);

SELECT 
Firstname AS 'First name' ,
lastname AS 'Surname', 
Email AS 'User Email'
FROM Person
WHERE lastname = 'Depp'
OR lastname = 'Flintstone';

-- Shorthand version of where clause  

SELECT 
Firstname AS 'First name' ,
lastname AS 'Surname', 
Email AS 'User Email'
FROM Person
WHERE lastname in ('Depp', 'Flintstone');

-- Between clause 
-- Before using between clause 
SELECT personID, firstname
FROM Person
WHERE personID in ('3','4','5','6');

-- After using between and clause 
SELECT personID, firstname
FROM Person
WHERE personID between 3 and 6;

-- wildcard clause 
SELECT personID, firstname
FROM Person
WHERE email like '%@yahoo.com';
