-- 03_validation.sql
-- Checks that the join does not duplicate or lose rows.

-- 1. The price table must have exactly one row per year (expected: no rows returned)
SELECT yr, COUNT(*) AS rows_per_year
FROM price
GROUP BY yr
HAVING COUNT(*) > 1;

-- 2. Number of rows in the source tables
SELECT (SELECT COUNT(*) FROM customer_0)
     + (SELECT COUNT(*) FROM customer_1) AS source_rows
FROM dual;

-- 3. Number of rows after the join (must equal the number above)
WITH cte AS (
  SELECT * FROM customer_0
  UNION ALL
  SELECT * FROM customer_1
)
SELECT COUNT(*) AS result_rows
FROM cte a
LEFT JOIN price b
  ON a.yr = b.yr;

-- 4. Date range of each table after the conversion
SELECT MIN(dte), MAX(dte) FROM customer_0;
SELECT MIN(dte), MAX(dte) FROM customer_1;
