-- INNER JOIN
---------------------------------------------------------------------------------------

SELECT *
FROM orders
JOIN customers ON customers.customerid = orders.customerid;

SELECT customers.companyname, orders.orderdate, orders.shipcountry
FROM orders
JOIN customers ON customers.customerid = orders.customerid;

SELECT *
FROM employees
JOIN orders ON orders.employeeid = employees.employeeid;

SELECT employees.firstname, employees.lastname, orders.orderdate
FROM employees
JOIN orders ON orders.employeeid = employees.employeeid;

SELECT *
FROM suppliers
JOIN products ON products.supplierid = suppliers.supplierid;

SELECT suppliers.companyname, products.unitprice, products.unitsinstock
FROM suppliers
JOIN products ON products.supplierid = suppliers.supplierid;

-- Multiple tables
---------------------------------------------------------------------------------------

SELECT * 
FROM customers
INNER JOIN orders ON orders.customerid = customers.customerid
INNER JOIN order_details ON order_details.orderid = orders.orderid;

SELECT customers.companyname,orders.orderdate,order_details.productid, order_details.unitprice, order_details.quantity 
FROM customers
INNER JOIN orders ON orders.customerid = customers.customerid
INNER JOIN order_details ON order_details.orderid = orders.orderid;

SELECT customers.companyname,products.productname,orders.orderdate, order_details.unitprice, order_details.quantity 
FROM customers
INNER JOIN orders ON orders.customerid = customers.customerid
INNER JOIN order_details ON order_details.orderid = orders.orderid
INNER JOIN products ON products.productid = order_details.productid;

SELECT customers.companyname,products.productname, categories.categoryname,orders.orderdate, order_details.unitprice, order_details.quantity 
FROM customers
INNER JOIN orders ON orders.customerid = customers.customerid
INNER JOIN order_details ON order_details.orderid = orders.orderid
INNER JOIN products ON products.productid = order_details.productid
INNER JOIN categories ON categories.categoryid = products.categoryid;

SELECT customers.companyname,products.productname, categories.categoryname,orders.orderdate, order_details.unitprice, order_details.quantity 
FROM customers
INNER JOIN orders ON orders.customerid = customers.customerid
INNER JOIN order_details ON order_details.orderid = orders.orderid
INNER JOIN products ON products.productid = order_details.productid
INNER JOIN categories ON categories.categoryid = products.categoryid
WHERE categories.categoryname = 'Seafood' AND order_details.unitprice * order_details.quantity > 500;

-- LEFT JOIN
---------------------------------------------------------------------------------------

SELECT customers.companyname, orders.orderid
FROM customers
LEFT JOIN orders ON orders.customerid = customers.customerid;

SELECT customers.companyname, orders.orderid
FROM customers
LEFT JOIN orders ON orders.customerid = customers.customerid
WHERE orders.orderid IS NULL;

SELECT * 
FROM products
LEFT JOIN order_details ON order_details.productid = products.productid;

SELECT * 
FROM products
LEFT JOIN order_details ON order_details.productid = products.productid
WHERE order_details.orderid IS NULL;

-- RIGHT JOIN
---------------------------------------------------------------------------------------

SELECT customers.companyname, orders.orderid
FROM orders
RIGHT JOIN customers ON customers.customerid = orders.customerid; 

SELECT customers.companyname, orders.orderid
FROM orders
RIGHT JOIN customers ON customers.customerid = orders.customerid
WHERE orders.orderid IS NULL;

SELECT *
FROM customercustomerdemo
RIGHT JOIN  customers ON customers.customerid = customercustomerdemo.customerid;

-- FULL JOIN
---------------------------------------------------------------------------------------

SELECT customers.companyname, orders.orderid
FROM customers
FULL JOIN orders ON orders.customerid = customers.customerid;

SELECT customers.companyname, orders.orderid
FROM customers
FULL JOIN orders ON orders.customerid = customers.customerid
WHERE customers.companyname IS NULL OR orders.orderid IS NULL;

SELECT products.productname, categories.categoryname
FROM products
FULL JOIN categories ON categories.categoryid = products.categoryid;

SELECT products.productname, categories.categoryname
FROM products
FULL JOIN categories ON categories.categoryid = products.categoryid
WHERE products.productname IS NULL OR categories.categoryname IS NULL;

-- SELF JOIN
---------------------------------------------------------------------------------------

SELECT c1.companyname AS customer1, c2.companyname, c1.city
FROM customers AS c1
JOIN customers AS c2 ON c1.city = c2.city
WHERE c1.customerid <> c2.customerid
ORDER BY c1.city;

SELECT  A.companyname AS SupplierName1,
		    B.companyname AS SupplierName2,  A.country
FROM suppliers A, suppliers B
WHERE A.supplierid > B.supplierid
AND A.country = B.country
ORDER BY A.country;


-- USING
---------------------------------------------------------------------------------------

SELECT * 
FROM orders
INNER JOIN order_details USING(orderid);

SELECT * 
FROM orders
INNER JOIN order_details USING(orderid)
INNER JOIN products USING(productid);

-- NATURAL
---------------------------------------------------------------------------------------

SELECT * 
FROM orders
NATURAL JOIN order_details;

SELECT * 
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details;

-- WRONG!
SELECT count(*)
FROM products
NATURAL JOIN order_details;

SELECT count(*)
FROM products
INNER JOIN order_details USING(productid);


-- PRACTICE
---------------------------------------------------------------------------------------

--01

-- this is spelling out the ON
SELECT firstname,middlename,lastname,phonenumber,name
FROM person.personphone AS ph
JOIN person.businessentity AS be ON be.businessentityid=ph.businessentityid
JOIN person.person AS pe ON pe.businessentityid=be.businessentityid
JOIN person.phonenumbertype AS pnt ON pnt.phonenumbertypeid=ph.phonenumbertypeid
ORDER BY ph.businessentityid DESC;

--this is with USING
SELECT firstname,middlename,lastname,phonenumber,name
FROM person.personphone AS ph
JOIN person.businessentity USING (businessentityid)
JOIN person.person USING (businessentityid)
JOIN person.phonenumbertype USING (phonenumbertypeid)
ORDER BY ph.businessentityid DESC;


--02
SELECT pm.name,c.name,description
FROM production.productdescription
JOIN production.productmodelproductdescriptionculture USING (productdescriptionid)
JOIN production.culture AS c USING (cultureid)
JOIN production.productmodel AS pm USING (productmodelid)
ORDER BY pm.name ASC;

--03
SELECT p.name,pm.name,c.name,description
FROM production.productdescription
JOIN production.productmodelproductdescriptionculture USING (productdescriptionid)
JOIN production.culture AS c USING (cultureid)
JOIN production.productmodel AS pm USING (productmodelid)
JOIN production.product AS p USING (productmodelid)
ORDER BY pm.name ASC;

--04
SELECT name, rating, comments
FROM production.product
LEFT JOIN production.productreview USING (productid)
ORDER BY rating ASC;

--05
SELECT p.name,orderqty,scrappedqty
FROM production.workorder
RIGHT JOIN production.product AS p USING (productid)
ORDER BY p.productid ASC;

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------