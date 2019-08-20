-- GROUP BY
---------------------------------------------------------------------------------------

SELECT country, count(*) AS TotalCustomers
FROM customers
GROUP BY country
ORDER BY TotalCustomers DESC;

SELECT count(products.productname) AS total, categories.categoryname
FROM products
INNER JOIN categories USING(categoryid)
GROUP BY categories.categoryname
ORDER BY total DESC;

SELECT products.productname, round(AVG(order_details.quantity), 2) AS AverageQuantity
FROM products
INNER JOIN order_details USING(productid)
GROUP BY products.productname
ORDER BY  AverageQuantity DESC;

SELECT country, count(*) AS Total
FROM suppliers
GROUP BY country
ORDER BY Total DESC;

SELECT products.productname, sum(order_details.unitprice * order_details.quantity ) AS Total
FROM orders
INNER JOIN order_details USING(orderid)
INNER JOIN products USING (productid)
WHERE orders.orderdate BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY products.productid
ORDER BY Total DESC;

-- HAVING 
---------------------------------------------------------------------------------------

SELECT products.productname, sum(order_details.unitprice * order_details.quantity) AS TotalBought
FROM products
INNER JOIN order_details ON order_details.productid = products.productid
GROUP BY products.productname
HAVING sum(order_details.unitprice * order_details.quantity) < 2000
ORDER BY TotalBought DESC;

SELECT companyname, SUM(quantity * order_details.unitprice) AS AmountBought
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details
GROUP BY companyname
HAVING SUM(quantity * order_details.unitprice) >5000
ORDER BY AmountBought DESC;

SELECT companyname, SUM(quantity * order_details.unitprice) AS AmountBought
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details
WHERE orderdate BETWEEN '1997-01-01' AND '1997-6-30'
GROUP BY companyname
HAVING SUM(quantity * order_details.unitprice) >5000
ORDER BY AmountBought DESC;

-- GROUPING SETS
---------------------------------------------------------------------------------------

SELECT categories.categoryname, products.productname, SUM(od.quantity*od.unitprice)
FROM categories
INNER JOIN products USING(categoryid)
INNER JOIN order_details AS od USING(productid)
GROUP BY GROUPING SETS ((categories.categoryname),(categories.categoryname, products.productname))
ORDER BY categories.categoryname, products.productname;

SELECT c.companyname AS buyer,s.companyname AS supplier,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN suppliers  AS s USING (supplierid)
GROUP BY GROUPING SETS ((buyer),(buyer,supplier))
ORDER BY buyer,supplier;

SELECT companyname,categoryname,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories  AS s USING (categoryid)
GROUP BY GROUPING SETS ((companyname),(companyname,categoryname))
ORDER BY companyname,categoryname NULLS FIRST;

-- ROLLUP
---------------------------------------------------------------------------------------

SELECT c.companyname, categories.categoryname, products.productname, sum(od.quantity *od.unitprice)
FROM customers AS c
INNER JOIN orders USING (customerid)
INNER JOIN order_details AS od USING (orderid)
INNER JOIN products USING (productid)
INNER JOIN categories USING (categoryid)
GROUP BY ROLLUP (c.companyname, categories.categoryname, products.productname)
ORDER BY c.companyname NULLS FIRST , categories.categoryname NULLS FIRST , products.productname NULLS FIRST;

SELECT s.companyname AS supplier, c.companyname AS buyer,productname, SUM(od.unitprice*quantity)
FROM suppliers AS s
JOIN products USING (supplierid)
JOIN order_details AS od USING (productid)
JOIN orders USING (orderid)
JOIN customers AS c USING (customerid)
GROUP BY ROLLUP(supplier, buyer, productname)
ORDER BY supplier,buyer,productname;


-- CUBE 
---------------------------------------------------------------------------------------

SELECT c.companyname,categoryname,productname,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories  USING (categoryid)
GROUP BY CUBE (companyname, categoryname, productname);

SELECT s.companyname AS supplier, c.companyname AS buyer,productname, SUM(od.unitprice*quantity)
FROM suppliers AS s
JOIN products USING (supplierid)
JOIN order_details AS od USING (productid)
JOIN orders USING (orderid)
JOIN customers AS c USING (customerid)
GROUP BY CUBE(supplier, buyer, productname);

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
