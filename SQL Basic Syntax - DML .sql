USE Cohort1;

-- Data manipulation language 
-- INSERT adds rows 
-- UPDATE modifies rows
-- DELETE removes rows 

INSERT INTO hobby (HobbyName)
VALUES ('Weightlifting'),
('Sewing'),
('Reading');

INSERT INTO hobby (HobbyName, HobbyDescription)
VALUES ('Painting', 'Using brushes or knifes to apply paint to a medium'),
('Knitting', 'Fighting with wool and sticks'),
('Bouldering', 'Climbing big boulders and rocks with your hands');

-- DQL (Data Query Language)
SELECT *
FROM hobby;

-- Better to use primary key with update 
UPDATE hobby
SET HobbyDescription = 'Sweating and crying'
WHERE HobbyID = 2;

DELETE FROM hobby
WHERE HobbyID = 4;