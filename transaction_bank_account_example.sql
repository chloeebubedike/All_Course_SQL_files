-- Let's create a very simple sample bank accoutn database
CREATE DATABASE bank;
USE bank;

SELECT * FROM accounts;
CREATE TABLE accounts (
  account_number int(11) DEFAULT NULL,
  account_holder_name varchar(50) DEFAULT NULL,
  account_holder_surname varchar(50) DEFAULT NULL,
  balance float DEFAULT NULL,
  overdraft_allowed tinyint(1) DEFAULT NULL
);

insert into accounts
(account_number, account_holder_name, account_holder_surname, balance, overdraft_allowed)
VALUES
(111112, 'Julie', 'Smith', 150, true),
(111113, 'James', 'Andrews', 20, false),
(111114, 'Jack', 'Oakes', -70, true),
(111115, 'Jasper', 'Wolf', 200, true);

-- Function 1 
DELIMITER // 
CREATE FUNCTION is_eligible(balance FLOAT, overdraft_allowed TINYINT)
RETURNS BOOL
READS SQL DATA
BEGIN 
	DECLARE allowed BOOL;
    IF balance >= 100 AND overdraft_allowed = 1 THEN
		SET allowed = True;
	ELSE
		SET allowed = False;
	END IF ;
    RETURN(allowed);
    
END//
DELIMITER ;

DROP FUNCTION is_eligible;

SELECT *, is_eligible(balance, overdraft_allowed) as Eligible
FROM accounts;

-- Function 2 
DELIMITER // 
CREATE FUNCTION is_negative(balance FLOAT)
RETURNS BOOL
READS SQL DATA
BEGIN 
	DECLARE negative BOOL;
    IF balance < 0 THEN
		SET negative = True;
	ELSE
		SET negative = False;
	END IF ;
    RETURN(negative);
    
END//
DELIMITER ;


SELECT *, is_negative(balance) as Negative
FROM accounts;

-- Function 3 
-- Create a function to give greetings
DELIMITER //
CREATE FUNCTION give_greetings(name varchar(10), lastname varchar(10))
RETURNS VARCHAR(50)
CONTAINS SQL
READS SQL DATA
BEGIN
	DECLARE greeting VARCHAR(50);
    SET greeting = CONCAT("Greetings", " ", name, " ", lastname, "!!");
    RETURN greeting;
END//
DELIMITER ;

SELECT give_greetings(account_holder_name, account_holder_surname)
FROM accounts;

-- Stored procedure 1 
-- Create a procedure to give greetings 
DELIMITER // 
CREATE PROCEDURE greeting(IN name VARCHAR(10), IN last_name VARCHAR(10))
CONTAINS SQL
BEGIN
	SELECT CONCAT("Hey", " ", name, " ", last_name, "!<3");
END//
DELIMITER ;

CALL greeting("chloe", "louise");


-- Stored procedure 2 
-- Create a procedure to create accounts
-- Step 1 - create new account number 
-- Step 2 - set overdraft allowed propery
-- Step 3 - Throw a error if balance < 0

DELIMITER // 
CREATE PROCEDURE create_account(
IN holder_name VARCHAR(10),
IN holder_surname VARCHAR(50),
IN balance FLOAT)
CONTAINS SQL
MODIFIES SQL DATA
BEGIN 
	DECLARE new_account_number INT;
    DECLARE overdraft_allowed BOOL;
	SET new_account_number = (SELECT MAX(account_number) FROM accounts) + 1;
	IF (balance <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BALANCE TOO LOW';
    ELSEIF (balance > 100) THEN
		SET overdraft_allowed = True;
	ELSE 
		SET overdraft_allowed = False;
	END IF;
    INSERT INTO accounts(account_number, account_holder_name, account_holder_surname, balance, overdraft_allowed)
		VALUES (new_account_number, holder_name, holder_surname, balance, overdraft_allowed);

END//
DELIMITER ;

CALL create_account("chloe", "louise", 500);
CALL create_account("chi", "smith", 10);

-- Stored procedure 3 

DELIMITER // 
CREATE PROCEDURE create_account_with_error(
IN holder_name VARCHAR(10),
IN holder_surname VARCHAR(50),
IN balance FLOAT)
CONTAINS SQL
MODIFIES SQL DATA
BEGIN 
	DECLARE new_account_number INT;
    DECLARE overdraft_allowed BOOL;
	SET new_account_number = (SELECT MAX(account_number) FROM accounts) + 1;
	IF (balance <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BALANCE TOO LOW';
    ELSEIF (balance > 100) THEN
		SET overdraft_allowed = True;
	ELSE 
		SET overdraft_allowed = False;
	END IF;
    INSERT INTO accounts(account_number, account_holder_name, account_holder_surname, balance, overdraft_allowed)
		VALUES (new_account_number, holder_name, holder_surname, balance, overdraft_allowed);

END//
DELIMITER ;

CALL create_account_with_error("Sally", "Plant", 90);


-- Trigger
DELIMITER //
CREATE TRIGGER ACCOUNT_HOLDER_NAME_UPPER
BEFORE INSERT ON accounts
FOR EACH ROW
BEGIN
	SET NEW.account_holder_name = UPPER(NEW.account_holder_name);
    SET NEW.account_holder_surname = UPPER(NEW.account_holder_surname);
						
END//
DELIMITER ;


CALL create_account("ri", "banks", 1000);

-- Create event 
DELIMITER //
CREATE EVENT recurring_time_event
ON SCHEDULE EVERY 2 SECOND
STARTS NOW()
DO BEGIN
	CALL create_account("first_name", "last_name", 0);
END//
DELIMITER ;




-- 1. start a new transaction
START TRANSACTION;

SELECT 
    @moneyAvailable:=IF(balance > 0, balance, 0) AS MONEY
FROM
    bank.accounts
WHERE
    account_number = 111112
        AND account_holder_surname = 'Smith';
        
--------
SET @TransferAmount = 50;

--------
UPDATE accounts 
SET 
    balance = balance - @TransferAmount
WHERE
    account_number = 111112
        AND account_holder_surname = 'Smith';
        
--------
UPDATE accounts 
SET 
    balance = balance + @TransferAmount
WHERE
    account_number = 111115
        AND account_holder_surname = 'Wolf';

--------
select *
from accounts;

-- 2. (optional) Try Rollback to see how it works
-- ROLLBACK;

-- 3. commit changes 
COMMIT;



