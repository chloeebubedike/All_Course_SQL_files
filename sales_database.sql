CREATE DATABASE shop;
use shop;

CREATE TABLE SALES1 (
    Store VARCHAR(20) NOT NULL,
    Week VARCHAR(20) NOT NULL,
    Day VARCHAR(20) NOT NULL,
    SalesPerson VARCHAR(20) NOT NULL,
    SalesAmount DECIMAL(6 , 2 ) NOT NULL,
    Month VARCHAR(20) NULL
); 

INSERT INTO  SALES1
(Store, Week, Day, SalesPerson, SalesAmount, Month) 
VALUES 
(N'London', N'2', N'Monday', N'Frank', CAST(56.25 AS Decimal(6, 2)), N'May'),
(N'London', N'5', N'Tuesday', N'Frank', CAST(74.32 AS Decimal(6, 2)), N'Sep'),
(N'London', N'5', N'Monday', N'Bill', CAST(98.42 AS Decimal(6, 2)), N'Sep'),
(N'London', N'5', N'Saturday', N'Bill', CAST(73.90 AS Decimal(6, 2)), N'Dec'),
(N'London', N'1', N'Tuesday', N'Josie', CAST(44.27 AS Decimal(6, 2)), N'Sep'),
(N'Dusseldorf', N'4', N'Monday', N'Manfred', CAST(77.00 AS Decimal(6, 2)), N'Jul'),
(N'Dusseldorf', N'3', N'Tuesday', N'Inga', CAST(9.99 AS Decimal(6, 2)), N'Jun'),
(N'Dusseldorf', N'4', N'Wednesday', N'Manfred', CAST(86.81 AS Decimal(6, 2)), N'Jul'),
(N'London', N'6', N'Friday', N'Josie', CAST(74.02 AS Decimal(6, 2)), N'Oct'),
(N'Dusseldorf', N'1', N'Saturday', N'Manfred', CAST(43.11 AS Decimal(6, 2)), N'Apr');

