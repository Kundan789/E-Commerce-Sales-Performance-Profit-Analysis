/* ============================================================
   View Name : mffa.sales_analysis
   Purpose   : Order-level and product-level sales performance
               including revenue, cost, refunds, and profit
   Grain     : One row per order per product
   ============================================================ */

CREATE VIEW mffa.sales_analysis
AS
SELECT
    o.user_id,
    o.order_id,
    oi.product_id,
    p.product_name,
    o.items_purchased,
    o.price_usd                         AS order_revenue_usd,
    o.cogs_usd                          AS order_cogs_usd,
    ISNULL(oir.refund_amount_usd, 0)    AS refund_amount_usd,
    (
        o.price_usd
        - (o.cogs_usd + ISNULL(oir.refund_amount_usd, 0))
    ) AS gross_profit_usd
FROM mff.order_items AS oi
LEFT JOIN mff.orders AS o
    ON o.order_id = oi.order_id
LEFT JOIN mff.order_item_refunds AS oir
    ON oir.order_id = oi.order_id
LEFT JOIN mff.products AS p
    ON p.product_id = oi.product_id;
GO
