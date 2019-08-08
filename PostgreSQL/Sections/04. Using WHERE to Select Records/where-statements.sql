SELECT * FROM suppliers;

SELECT * FROM suppliers WHERE city ='Berlin';

SELECT companyname, contactname FROM customers WHERE country='Mexico';

----------------------------------------------------------------------------------

SELECT * FROM orders;

SELECT count(*) AS "employeeID 3 total orders" FROM orders WHERE employeeid = 3;

SELECT * FROM order_details;

SELECT count(*) FROM order_details WHERE quantity >= 20;

SELECT * FROM orders;

SELECT * FROM orders WHERE freight >= 250;

SELECT count(*) FROM orders WHERE freight >= 250;

---------------------------------------------------------------------------------------

SELECT * FROM orders WHERE orderdate > '1998-01-01';

SELECT count(*) FROM orders WHERE orderdate > '1998-01-01';

SELECT * FROM orders WHERE shippeddate < '1997-07-05';

SELECT count(*) FROM orders WHERE shippeddate < '1997-07-05';

---------------------------------------------------------------------------------------

SELECT * FROM orders;

SELECT count(*) FROM orders WHERE shipcountry='Germany' AND freight > 100; 

SELECT DISTINCT customerid FROM orders WHERE shipvia =2 AND shipcountry = 'Brazil';

---------------------------------------------------------------------------------------

SELECT count(*) FROM customers WHERE country = 'USA' OR country='Canada';

SELECT count(*) FROM suppliers WHERE country ='Germany' OR country='Spain';

SELECT count(*) FROM orders WHERE shipcountry='USA' OR shipcountry='Brazil' OR shipcountry='Argentina';

---------------------------------------------------------------------------------------

SELECT count(*) FROM customers WHERE NOT country='France';

SELECT count(*) FROM suppliers WHERE NOT country='USA';

---------------------------------------------------------------------------------------

SELECT count(*) FROM orders WHERE shipcountry='Germany' AND (freight < 50 OR freight > 175);

SELECT * FROM orders;

SELECT count(*) FROM orders WHERE (shipcountry='Canada' OR shipcountry='Spain') AND shippeddate > '1997-05-01';

---------------------------------------------------------------------------------------

SELECT * FROM order_details;

SELECT count(*) FROM order_details WHERE unitprice BETWEEN 10 AND 20;

SELECT * FROM orders;

SELECT count(*) FROM orders WHERE shippeddate BETWEEN '1996-06-01' AND '1996-09-30';

---------------------------------------------------------------------------------------

SELECT count(*) FROM suppliers WHERE country IN ('Germany','France','Spain','Italy');

SELECT count(*) FROM products WHERE categoryid IN (1,4,6,7);

---------------------------------------------------------------------------------------


---PRACTICE-------
---------------------------------------------------------------------------------------

--1
SELECT * FROM data_src
WHERE journal = 'Food Chemistry';

--2
SELECT * FROM nutr_def
WHERE nutrdesc = 'Retinol';

--3
SELECT * FROM food_des
WHERE manufacname = 'Kellogg, Co.';

--4
SELECT COUNT(*) FROM data_src
WHERE year > 2000;

--5
SELECT COUNT(*) FROM food_des
WHERE fat_factor<4;

--6
SELECT * FROM weight
WHERE gm_wgt = 190;

--7
SELECT COUNT(*)
FROM food_des
WHERE pro_factor > 1.5 AND fat_factor < 5;

--8
SELECT * FROM data_src
WHERE year=1990 AND journal='Cereal Foods World';

--9
SELECT COUNT(*) FROM weight
WHERE gm_wgt > 150 and gm_wgt < 200;

--10
SELECT *
FROM nutr_def
WHERE units = 'kj' or units='kcal';

--11
SELECT * FROM data_src
WHERE year=2000 OR journal='Food Chemistry';

--12
-- lookup the fdgrp_cd for Breakfast Cereals
SELECT fdgrp_cd FROM fd_group
WHERE fddrp_desc = 'Breakfast Cereals';
-- find the count
SELECT COUNT(*) FROM food_des
WHERE NOT fdgrp_cd = '0800';

--13
SELECT * FROM data_src
WHERE (year >= 1990 AND year <=2000) AND
	(journal = 'J. Food Protection' OR Journal='Food Chemistry');

--14
SELECT COUNT(*)
FROM weight
WHERE gm_wgt BETWEEN 50 AND 75;

--15
SELECT * FROM data_src
WHERE year IN (1960,1970,1980,1990,2000);

---------------------------------------------------------------------------------------
