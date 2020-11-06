USE [BikeStores]


/* SQL Aggregations Part I */

SELECT
		COUNT(*) AS customer_count
FROM sales.customers
WHERE city = 'New York'
	/* How many customers are based in New York? */

SELECT
		COUNT(*) AS order_count
FROM sales.orders
WHERE order_date BETWEEN '2017-01-01' AND '2017-12-31'
	/* How many orders were placed in 2017? */

SELECT
		SUM(quantity) AS product_1_stock
FROM production.stocks
WHERE product_id = 1
	/* What is the total quantity is stock of Trek 820-2016 bikes (product id = 1) across all stores? */

SELECT
		MAX(list_price) AS max_price,
		MIN(list_price) AS min_price,
		AVG(list_price) AS avg_price
FROM production.products
	/* What is the maximum, minimum and average price of all the products listed? */


SELECT
		order_id,
		COUNT(*) AS item_count
FROM sales.order_items
GROUP BY order_id
	/* How many items were included in each order? */


SELECT TOP 10
		i.product_id,
		SUM(i.quantity) AS units_sold_2018
FROM sales.order_items i
JOIN sales.orders o
ON i.order_id = o.order_id
WHERE o.order_date BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY i.product_id
ORDER BY units_sold_2018 DESC
	/* Which were the top 10 highest selling products in 2018? */


SELECT *
FROM production.products
WHERE product_id = 86



SELECT
		st.store_name,
		SUM(s.quantity) product_86_stock
FROM production.stocks s
JOIN sales.stores st
ON s.store_id = st.store_id
WHERE s.product_id = 86
GROUP BY st.store_name
ORDER BY product_86_stock DESC
	/* Which store has more units in stock of Trek's Girl's Kickster model of 2017 (product id = 86)? */


