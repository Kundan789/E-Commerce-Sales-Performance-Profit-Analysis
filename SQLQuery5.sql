-- FIRST TABLE 
select count(*) AS dublicate 
from (SELECT order_id,  count(*) AS dublicate FROM  mff.order_items
group by order_id
having count(*) >1)t


select  * from mff.order_items
select  * from mff.orders
--SECOND TABLE 
SELECT user_id, count(*) AS dublicate  FROM mff.orders
group by user_id
having count(*) > 1
-- THIRD TABLE
SELECT TOP(10) * FROM mff.order_item_refunds;

--FOURTH TABLE 
SELECT TOP (10) * FROM  mff.products;

--FIFTH TABLE
SELECT TOP(10) * FROM mff.maven_fuzzy_factory_data_dictionary;

--SIXTH TABLE
SELECT TOP(10) * FROM mff.website_sessions ;



