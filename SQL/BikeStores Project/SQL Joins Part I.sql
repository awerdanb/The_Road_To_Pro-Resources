USE [BikeStores]


/* SQL JOINS PART I */

SELECT
		o.order_id,
		o.order_status,
		c.customer_id,
		c.last_name,
		c.phone
FROM sales.orders o
JOIN sales.customers c
ON o.customer_id = c.customer_id
ORDER BY o.order_id
	/* For each order, display its status as well as the corresponding customer's ID, surname and phone */


SELECT *
FROM sales.orders o
JOIN sales.order_items i
ON o.order_id = i.order_id
	/* Displaying all the columns from the orders and order items tables */

SELECT
		o.*,
		i.product_id,
		i.quantity,
		i.list_price,
		i.discount
FROM sales.orders o
JOIN sales.order_items i
ON o.order_id = i.order_id
		/* Displaying all the information from the orders table and each order's item product id, quantity, list price and discount */


SELECT
		i.order_id,
		i.item_id,
		i.product_id,
		p.product_name,
		p.model_year,
		s.store_id,
		s.quantity AS stock_qty
FROM sales.order_items i
JOIN production.products p
ON i.product_id = p.product_id
JOIN production.stocks s
ON p.product_id = s.product_id
		/* For every order, display the item id, product id, product name, model year and quantity in stock in each store */


SELECT
		i.order_id,
		i.item_id,
		i.product_id,
		p.product_name,
		p.model_year,
		s.store_id,
		s.quantity AS stock_qty
FROM sales.order_items i
JOIN production.products p
ON i.product_id = p.product_id
JOIN production.stocks s
ON p.product_id = s.product_id
WHERE p.product_name LIKE 'Electra Townie%' AND model_year = 2017
		/* For each order placed on models from the Electra Townie series launched in 2017, display the product id, product name,
			model year and quantity in stock in each store*/

