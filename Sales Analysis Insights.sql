/* ============================================================
   Sales Analysis Insights
   Source : mffa.sales_analysis
   ============================================================ */

-- Highest revenue order
SELECT TOP (1) *
FROM mffa.sales_analysis
ORDER BY order_revenue_usd DESC;


-- Most profitable order
SELECT TOP (1) *
FROM mffa.sales_analysis
ORDER BY gross_profit_usd DESC;


-- Orders with the highest refund amounts
SELECT TOP (5) *
FROM mffa.sales_analysis
ORDER BY refund_amount_usd DESC;


-- Products generating the highest total revenue
SELECT
    product_id,
    product_name,
    SUM(order_revenue_usd) AS total_revenue_usd
FROM mffa.sales_analysis
GROUP BY product_id, product_name
ORDER BY total_revenue_usd DESC;


-- Products generating the highest total profit
SELECT
    product_id,
    product_name,
    SUM(gross_profit_usd) AS total_gross_profit_usd
FROM mffa.sales_analysis
GROUP BY product_id, product_name
ORDER BY total_gross_profit_usd DESC;


-- Customers with the highest total spend
SELECT
    user_id,
    SUM(order_revenue_usd) AS total_spent_usd
FROM mffa.sales_analysis
GROUP BY user_id
ORDER BY total_spent_usd DESC;


-- Customers with negative profitability
SELECT
    user_id,
    SUM(gross_profit_usd) AS total_gross_profit_usd
FROM mffa.sales_analysis
GROUP BY user_id
HAVING SUM(gross_profit_usd) < 0
ORDER BY total_gross_profit_usd;


-- Average profit per order
SELECT
    AVG(gross_profit_usd) AS avg_profit_per_order_usd
FROM mffa.sales_analysis;
