USE Cohort1;
-- Visualsing the join
SELECT FirstName, LastName, HobbyID FROM Person;
SELECT HobbyID, HobbyName FROM Hobby;

-- Join statement with table aliases 
-- Inner join - hobbyname to be displayed if hobbyID for the hobby also exists in person table
-- I.e. only show the person if they have a hobby and only show the hobby if there is a person who has it 
-- Person table info
SELECT p.FirstName, p.LastName, p.HobbyID,
-- Hobby table info
	h.HobbyID, h.HobbyName
FROM Person AS p
-- Join the hobby table to the person table
INNER JOIN Hobby AS h
-- Need to explain how we want the tables to be joined using the on clause
ON p.HobbyID = h.HobbyID;

INSERT INTO Person(FirstName, LastName)
VALUES ('Mr', 'Burns');

-- Outer Join 
-- Has to have a direction (left, right or full)
-- Left outer join will show everything in the left table, irrespective of if there is a match value for hobby
-- Person is left table 
-- Hobby is the right table 
SELECT p.FirstName, p.LastName, p.HobbyID,
-- Hobby table info
	h.HobbyID, h.HobbyName
FROM Person AS p
-- Join the hobby table to the person table
LEFT OUTER JOIN Hobby AS h
-- Need to explain how we want the tables to be joined using the on clause
ON p.HobbyID = h.HobbyID;


-- Right outer join 
-- Right outer join will show everything in the right table (hobby), irrespective of if there is a matching value in the left table (person)
SELECT p.FirstName, p.LastName, p.HobbyID,
-- Hobby table info
	h.HobbyID, h.HobbyName
FROM Person AS p
-- Join the hobby table to the person table
RIGHT OUTER JOIN Hobby AS h
-- Need to explain how we want the tables to be joined using the on clause
ON p.HobbyID = h.HobbyID;

-- Many to one (person to hobby) and one to many (hobby to person)
-- Can join more than two tables, continue after semi-colon. If start with right join it will have to continue 