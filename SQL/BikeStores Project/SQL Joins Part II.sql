USE [BikeStores]


/* SQL JOINS PART II */


SELECT
		i.order_id,
		p.product_name,
		p.list_price,
		s.store_name,
		st.quantity AS stock_qty
FROM sales.order_items i
JOIN production.products p
ON i.product_id = p.product_id
JOIN production.stocks st
ON p.product_id = st.product_id
JOIN sales.stores s
ON  s.store_id = st.store_id
WHERE p.list_price > 600 AND st.quantity > 20
	/* Which orders where made on products with a list price higher than USD 600 and with a quantity in stock higher than 20 units?. Display the
		order ID, product name, list price, store name and stock quantity */


SELECT
		i.order_id,
		st.product_id,
		st.quantity AS stock_qty,
		s.store_name,
		s.city,
		sf.last_name AS staff_surname,
		sf.phone
FROM sales.order_items i
JOIN production.stocks st
ON i.product_id = st.product_id
JOIN sales.stores s
ON  s.store_id = st.store_id
JOIN sales.staffs sf
ON sf.store_id = s.store_id
WHERE s.city = 'Santa Cruz' AND st.product_id = 8
	/* Which orders where made on items with product ID equal to 8 in the city of Santa Cruz? Display the order ID, product ID, stock quantity,
		store name, city, staff last name and staff phone */


SELECT
		o.order_id,
		o.order_date,
		i.quantity*i.list_price*(1-discount) AS total_amount_receivable
FROM sales.orders o
JOIN sales.order_items i
ON o.order_id = i.order_id
WHERE (o.order_date BETWEEN '2017-04-01' AND '2017-06-30')
		AND i.quantity*i.list_price*(1-discount) > 2000
ORDER BY total_amount_receivable DESC
	/* Which orders placed in the second quarter of 2017 made a total amount receivable higher that USD 2,000? Display the order ID, order date and
		total amount receivable */




