
/* ============================================================
   User-Level Insights
   Source : mffa.user_spent
   ============================================================ */

-- Top 5 highest spending customers
SELECT TOP (5)
    user_id,
    SUM(total_spent_usd) AS total_spent_usd
FROM mffa.user_spent
GROUP BY user_id
ORDER BY total_spent_usd DESC;


-- Top 5 most profitable customers
SELECT TOP (5)
    user_id,
    SUM(gross_profit_usd) AS total_gross_profit_usd
FROM mffa.user_spent
GROUP BY user_id
ORDER BY total_gross_profit_usd DESC;


-- Customers with highest refund amounts
SELECT TOP (5)
    user_id,
    SUM(total_refund_amount_usd) AS total_refund_amount_usd
FROM mffa.user_spent
GROUP BY user_id
ORDER BY total_refund_amount_usd DESC;


-- Least profitable customers (potential churn risk)
SELECT TOP (5)
    user_id,
    SUM(gross_profit_usd) AS total_gross_profit_usd
FROM mffa.user_spent
GROUP BY user_id
ORDER BY total_gross_profit_usd ASC;


-- Average spend per product per user
SELECT
    user_id,
    AVG(total_spent_usd) AS avg_spend_per_product_usd
FROM mffa.user_spent
GROUP BY user_id
ORDER BY avg_spend_per_product_usd DESC;


-- Users buying the widest variety of products
SELECT
    user_id,
    COUNT(DISTINCT product_name) AS distinct_products_purchased
FROM mffa.user_spent
GROUP BY user_id
ORDER BY distinct_products_purchased DESC;


-- Product that generates the most profit per user
SELECT TOP (5)
    user_id,
    product_name,
    gross_profit_usd
FROM mffa.user_spent
ORDER BY gross_profit_usd DESC;


-- Users with negative profitability (refund-heavy users)
SELECT
    user_id,
    SUM(gross_profit_usd) AS total_gross_profit_usd
FROM mffa.user_spent
GROUP BY user_id
HAVING SUM(gross_profit_usd) < 0
ORDER BY total_gross_profit_usd;
