USE [BikeStores]


/* BASIC SQL PART II */


SELECT
		last_name AS Surname,
		first_name AS Name,
		email AS Email
FROM sales.customers
WHERE email LIKE '%@yahoo.com'
ORDER BY Surname
	/* Which customers hold Yahoo email accounts? */


SELECT
		last_name AS Surname,
		first_name AS Name,
		email AS Email
FROM sales.customers
WHERE email LIKE '%@yahoo.com' AND last_name LIKE 'B%' AND first_name LIKE '%a'
ORDER BY Surname
		/* Which are the customers who hold Yahoo email accounts, whose surname starts with 'B' and whose name ends with 'a'?*/


SELECT
		last_name AS Surname,
		first_name AS Name,
		email AS Email
FROM sales.customers
WHERE email NOT LIKE '%@msn.com' AND last_name NOT IN ('Acevedo','Albert') AND first_name NOT LIKE '%ia%'
ORDER BY Surname
	/* Excluding the customers holding MSN accounts, whose surname is either 'Acevedo' or 'Albert' and whose names include the characters 'ia' */


SELECT *
FROM sales.orders
ORDER BY order_date DESC


SELECT *
FROM sales.orders
WHERE shipped_date IS NOT NULL AND order_date > '2017-12-31'
ORDER BY order_date
	/* Which are the orders placed in 2018 that have already been shipped? */


SELECT *
FROM sales.orders
WHERE shipped_date IS NOT NULL AND order_date BETWEEN '2018-01-31' AND '2018-02-28'
ORDER BY order_date
	/* Which orders placed in February 2018 have already been shipped? */


SELECT *
FROM sales.orders
WHERE required_date = shipped_date
ORDER BY order_date
	/* Which orders were required and shipped on the same day? */


SELECT *
FROM sales.order_items


SELECT *
FROM sales.order_items
WHERE list_price > 2000
ORDER BY list_price DESC
	/* Which orders were made on items with a list price higher than USD 2,000? */

SELECT *
FROM sales.order_items
WHERE (list_price BETWEEN 2000 AND 5000)
		AND discount BETWEEN 0.07 AND 0.10
ORDER BY list_price
	/* Which orders were made on items with a list price between USD 2,000 and USD 5,000, and with a discount between 7% and 10%? */


SELECT
		order_id,
		quantity*list_price*(1-discount) AS total_amount_receivable
FROM sales.order_items
	/* Calculating the total amount receivable for each entry */
