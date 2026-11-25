-- 02_main_query.sql
-- Combine both customer tables, join the yearly price and cost,
-- and calculate revenue, cost and profit per record.
-- The result of this query is loaded into Power BI.

WITH cte AS (
  SELECT * FROM customer_0
  UNION ALL
  SELECT * FROM customer_1
)
SELECT
  a.dteday,
  a.season,
  a.yr,
  a.weekday,
  a.hr,
  a.rider_type,
  a.riders,
  b.price,
  b.cogs,
  a.riders * b.price AS revenue,
  a.riders * b.cogs AS cost,
  (a.riders * b.price) - (a.riders * b.cogs) AS profit
FROM cte a
LEFT JOIN price b
  ON a.yr = b.yr;
