-- Stored procedure for a customer to take out a new book 

-- Select user through user ID 
-- Select book they are going to take out through book ID 
-- Select take out date 
-- Leave checkin date blank 
-- Reduce stock of book by one 

USE book_library;

DROP PROCEDURE user_check_out_book;

DELIMITER // 
CREATE PROCEDURE 
user_check_out_book(
IN userID INT, 
IN returned date,
IN BookID_for_book INT
)
BEGIN
DECLARE due_date date;

SET @qty = (SELECT Quantity
FROM stock
WHERE BookID = BookID_for_book);
SELECT @qty;

IF @qty > 0 THEN
	SET due_date = DATE_ADD(, INTERVAL 3 MONTH);

	INSERT INTO loans(userID, returned, checkin, BookID)
		VALUES (userID, returned, due_date, BookID_for_book);

	UPDATE stock 
	SET Quantity = Quantity - 1
	WHERE BookID = BookID_for_book;
ELSE 
	SELECT "There are no more books left, sorry!";
END IF;

END//
DELIMITER ;

CALL user_check_out_book(3, 20100101, 3);
SELECT * FROM loans;


SELECT * FROM loans;
SELECT * FROM stock;

-- Log a new record in the book loan table
-- IF stock.Quantity > 0 THEN
-- 	INSERT INTO loans(userID, returned, BookID)
-- 	VALUES (userID, returned, BookID);
-- ELSE 
-- 	SELECT "Sorry, there are no more available books left";
-- END IF;

