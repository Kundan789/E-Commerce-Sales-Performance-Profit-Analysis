CREATE VIEW sales_analyses AS
SELECT o.user_id,
	   o.order_id,
	   oi.product_id,
	   p.product_name,
	   o.items_purchased,
	   o.price_usd,
	   o.cogs_usd,
	   CASE
	   WHEN oir.refund_amount_usd IS NULL THEN 0
	   ELSE oir.refund_amount_usd
	   END AS refund_amount_usd,
	   (o.price_usd  - (o.cogs_usd + ( CASE
	   WHEN oir.refund_amount_usd IS NULL THEN 0
	   ELSE oir.refund_amount_usd
	   END))) AS gross_profit
FROM  mff.order_items AS oi 
LEFT JOIN mff.orders AS o
ON o.order_id = oi.order_id
LEFT JOIN mff.order_item_refunds AS oir
ON oir.order_id = oi.order_id
LEFT JOIN mff.products AS p
ON p.product_id = oi.product_id 

