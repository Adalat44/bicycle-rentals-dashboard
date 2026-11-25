-- 01_data_preparation.sql
-- The raw column dteday is stored as text. Convert it into a proper DATE column (dte)
-- in both customer tables so dates can be used for sorting and time analysis.

ALTER TABLE customer_0 ADD (dte DATE);
UPDATE customer_0 SET dte = TO_DATE(dteday, 'DD/MM/YYYY');

ALTER TABLE customer_1 ADD (dte DATE);
UPDATE customer_1 SET dte = TO_DATE(dteday, 'DD/MM/YYYY');

COMMIT;
