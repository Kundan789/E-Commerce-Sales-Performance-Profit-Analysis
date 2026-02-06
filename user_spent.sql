/* ============================================================
   View Name : mffa.user_spent
   Purpose   : Analyze user-level spending, refunds, costs,
               and profitability by product
   Grain     : One row per user per product
   ============================================================ */

CREATE VIEW mffa.user_spent
AS
SELECT
    t.user_id,
    t.product_name,
    SUM(t.refund_amount_usd) AS total_refund_amount_usd,
    SUM(t.price_usd)         AS total_spent_usd,
    SUM(t.cogs_usd)          AS total_cogs_usd,
    SUM(t.gross_profit)      AS gross_profit_usd
FROM (
    SELECT
        o.user_id,
        p.product_name,
        o.price_usd,
        o.cogs_usd,
        ISNULL(oir.refund_amount_usd, 0) AS refund_amount_usd,
        (
            o.price_usd
            - (o.cogs_usd + ISNULL(oir.refund_amount_usd, 0))
        ) AS gross_profit
    FROM mff.order_items AS oi
    LEFT JOIN mff.orders AS o
        ON o.order_id = oi.order_id
    LEFT JOIN mff.order_item_refunds AS oir
        ON oir.order_id = oi.order_id
    LEFT JOIN mff.products AS p
        ON p.product_id = oi.product_id
) AS t
GROUP BY
    t.user_id,
    t.product_name;
GO

