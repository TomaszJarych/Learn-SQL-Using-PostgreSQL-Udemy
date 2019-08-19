-- ORDER BY
---------------------------------------------------------------------------------------

SELECT DISTINCT country
FROM suppliers
ORDER BY country ASC;

SELECT DISTINCT country
FROM suppliers
ORDER BY country DESC;

SELECT DISTINCT country, city
FROM suppliers
ORDER BY country ASC, city DESC;

SELECT DISTINCT country, city
FROM suppliers
ORDER BY country ASC, city ASC;

SELECT DISTINCT productname, unitprice
FROM products
ORDER BY unitprice DESC, productname ASC;

-- MAX() and MIN()
---------------------------------------------------------------------------------------

SELECT orderdate, shipcountry
FROM orders
WHERE shipcountry = 'Italy';

SELECT min(orderdate)
FROM orders
WHERE shipcountry = 'Italy';

SELECT max(orderdate) AS "last order from Canada"
FROM orders
WHERE shipcountry = 'Canada';

SELECT max(shippeddate - orderdate) AS "longest shipping"
FROM orders
WHERE shipcountry='France';


-- AVG() and SUM()
---------------------------------------------------------------------------------------

SELECT avg(freight)
FROM orders
WHERE shipcountry='Brazil';

SELECT sum(quantity)
FROM order_details
WHERE productid=14;

SELECT avg(quantity)
FROM order_details
WHERE productid=35;


-- LIKE
---------------------------------------------------------------------------------------

SELECT * FROM customers;

SELECT companyname, contactname 
FROM customers
WHERE contactname LIKE 'D%';


SELECT companyname
FROM suppliers
WHERE companyname LIKE '_or%';

SELECT companyname
FROM customers
WHERE companyname LIKE '%er';

-- Aliases (AS)
---------------------------------------------------------------------------------------

SELECT * FROM order_details;

SELECT unitprice * quantity
FROM order_details;

SELECT unitprice * quantity AS TotalSpent
FROM order_details;


SELECT unitprice * quantity AS TotalSpent
FROM order_details
ORDER By TotalSpent DESC;

SELECT * FROM products;

SELECT productname, unitsinstock * unitprice AS TotalInventory
FROM products
ORDER BY TotalInventory DESC;

-- LIMIT
---------------------------------------------------------------------------------------

SELECT * FROM order_details;

SELECT productid, unitprice * quantity AS TotalCost
FROM order_details
ORDER BY TotalCost DESC
LIMIT 3;

SELECT productname, unitsinstock * unitprice AS TotalInventory
FROM products
ORDER BY TotalInventory ASC, productname ASC
LIMIT 2;

-- NULL values
---------------------------------------------------------------------------------------

SELECT * FROM customers;

SELECT companyname 
FROM customers
WHERE region IS NULL;

SELECT COUNT(companyname) 
FROM customers
WHERE region IS NULL;

SELECT * FROM suppliers;

SELECT count(companyname) 
FROM suppliers
WHERE region IS NOT NULL;

SELECT count(orderid) FROM orders
WHERE shipregion IS NULL;

-- PRACTICE
---------------------------------------------------------------------------------------

--1
SELECT name,weight,productnumber
FROM production.product
ORDER BY weight ASC;

--2
SELECT *
FROM purchasing.productvendor
WHERE productid=407
ORDER BY averageleadtime ASC;

--3
SELECT *
FROM sales.salesorderdetail
WHERE productid=799
ORDER BY orderqty DESC;

--4
SELECT MAX(discountpct)
FROM sales.specialoffer;

--5
SELECT MIN(sickleavehours)
FROM humanresources.employee;

--6
SELECT MAX(rejectedqty)
FROM purchasing.purchaseorderdetail;

--7
SELECT AVG(rate)
FROM humanresources.employeepayhistory;

--8
SELECT AVG(standardcost)
FROM production.productcosthistory
WHERE productid=738;

--9
SELECT SUM(scrappedqty)
FROM production.workorder
WHERE productid = 529;

--10
SELECT name
FROM purchasing.vendor
WHERE name LIKE 'G%';

--11
SELECT name
FROM purchasing.vendor
WHERE name LIKE '%Bike%';

--12
SELECT firstname
FROM person.person
WHERE firstname LIKE '_t%';

--13
SELECT *
FROM person.emailaddress
LIMIT 20;

--14
SELECT *
FROM production.productcategory
LIMIT 2;

--15
SELECT COUNT(*)
FROM production.product
WHERE weight IS NULL;

--16
SELECT COUNT(*)
FROM person.person
WHERE additionalcontactinfo IS NOT NULL;

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------