USE library;

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


