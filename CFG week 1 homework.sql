-- Task 1 
USE Parts;

-- 1.1 Find the name and weight of each red part 
SELECT 
p.PNAME AS part_name,
p.WEIGHT AS part_weight
FROM 
Part p 
WHERE
p.colour = 'RED';

-- Find all unique supplier(s) name from London

SELECT DISTINCT
s.SNAME AS Supplier_names
FROM 
SUPPLIER s;

-- TASK 2 
USE Shop;
SELECT * FROM SALES1;

-- 2.1 Find out how many sales were recorded per week per day

SELECT
s.Week,
s.Day,
COUNT(*) AS SalesPerDay
FROM
SALES1 s
GROUP BY s.WEEK, s.Day
ORDER BY s.Week Asc;

-- Change the name of the salesperson Inga to be Annette instead
UPDATE SALES1 
SET 
SALES1.SalesPerson = 'Annette'
WHERE 
SALES1.SalesPerson = 'Inga';

-- Find out how many sales Annette logged
SELECT 
COUNT(*) AS Annette_sales
FROM SALES1
WHERE
SalesPerson = 'Annette';

-- NOT COMPLETE Find the total sum of sales amount by each person by day
SELECT
s.SalesPerson,
s.Day,
SUM(s.SalesAmount) AS TotalSales
FROM 
SALES1 s
GROUP BY s.SalesPerson, Day;

-- Find out how much each person sold for
SELECT
s.SalesPerson, SUM(s.SalesAmount) as SumPerPerson
FROM SALES1 s 
GROUP BY s.SalesPerson;

-- Find out how much each person sold for, including their average, lowest and highest sale amounts 
SELECT
s.SalesPerson, 
SUM(s.SalesAmount) as SumPerPerson,
ROUND(AVG(s.SalesAmount), 2) as AvgPerPerson,
MIN(s.SalesAmount) as LowestSalePerPerson,
MAX(s.SalesAmount) as HighestSalePerPerson
FROM SALES1 s 
GROUP BY s.SalesPerson;

-- Find the total sale amount achieved by each store
SELECT
s.Store,
SUM(s.SalesAmount) AS TotalPerStore
FROM 
SALES1 s
GROUP BY s.Store;

-- Find the number of sales by each person if they did less than 3 sales
SELECT
s.SalesPerson,
COUNT(*) AS SalesPerPerson
FROM SALES1 s 
GROUP BY s.SalesPerson
HAVING COUNT(s.SalesPerson) < 3;

-- Find the total amount of sales by month where the combines total is less than 100
SELECT
s.Month,
SUM(s.SalesAmount) as SalesPerMonth
FROM SALES1 s 
GROUP BY s.Month
HAVING SUM(s.SalesAmount) < 100;

-- TASK 3 
Use Parts;
SELECT * FROM Part;
SELECT * FROM Supplier;
SELECT * FROM Project;

-- 3.1 Return the name and city of each project thats not supplied by a London based supplier
SELECT 
pr.JNAME as ProjectName, 
pr.CITY
FROM Project pr
WHERE pr.CITY != 'London';

-- 2.1 Return the supplier name, part name and project name where the supplier supplys a project with a part AND the suppliers city, project city and part city are the same 
SELECT 
s.SNAME as SupplierName,
pa.PNAME as PartName,
pr.JNAME as ProjectName
FROM 
Supplier s,
Part pa, 
Project pr
WHERE S.CITY = pa.CITY AND S.CITY = pr.CITY AND pa.CITY = pr.CITY;