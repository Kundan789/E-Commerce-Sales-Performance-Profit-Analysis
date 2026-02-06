/* ============================================================
   Product Performance Insights
   Source : mffa.product_performance
   ============================================================ */

-- Most costly product (highest total COGS)
SELECT TOP (1) *
FROM mffa.product_performance
ORDER BY total_cogs_usd DESC;


-- Most profitable product (highest gross profit)
SELECT TOP (1) *
FROM mffa.product_performance
ORDER BY gross_profit_usd DESC;


-- Highest revenue generating product
SELECT TOP (1) *
FROM mffa.product_performance
ORDER BY total_revenue_usd DESC;


-- Product with highest refund amount
SELECT TOP (1) *
FROM mffa.product_performance
ORDER BY total_refund_amount_usd DESC;


-- Least profitable product
SELECT TOP (1) *
FROM mffa.product_performance
ORDER BY gross_profit_usd ASC;


-- Product with lowest revenue
SELECT TOP (1) *
FROM mffa.product_performance
ORDER BY total_revenue_usd ASC;
