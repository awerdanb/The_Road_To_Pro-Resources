USE [BikeStores]


/* BASIC SQL PART I */


SELECT *
FROM sales.customers
	/* Retrieving all the customers' information */


SELECT
		last_name,
		first_name,
		email
FROM sales.customers
	/* Retrieving the customers' last name, name and email */


SELECT
		last_name AS Surname,
		first_name AS Name,
		email AS Email
FROM sales.customers
ORDER BY Surname
	/* Changing the column labels and ordering by customers' last name */


SELECT
		last_name AS Surname,
		first_name AS Name,
		email AS Email
FROM sales.customers
ORDER BY Surname DESC
	/* Changing the column labels and ordering by customers' last name in descending order */


SELECT
		last_name AS Surname,
		first_name AS Name,
		email AS Email
FROM sales.customers
WHERE last_name = 'Anderson' OR last_name = 'Miranda'
ORDER BY Surname
	/* Filtering for customers with last name 'Anderson' and 'Miranda' */

SELECT
		last_name AS Surname,
		first_name AS Name,
		email AS Email
FROM sales.customers
WHERE last_name IN ('Anderson', 'Miles', 'Miranda')
ORDER BY Surname
	/* Filtering for customers with last name 'Anderson', 'Miles' and 'Miranda' */


SELECT
		last_name AS Surname,
		first_name AS Name,
		email AS Email
FROM sales.customers
WHERE email LIKE '%@yahoo.com'
ORDER BY Surname
	/* Filtering for customers with yahoo accounts */

select *
FrOm sales.customers