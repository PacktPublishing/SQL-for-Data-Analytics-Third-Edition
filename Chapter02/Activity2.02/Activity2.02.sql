CREATE TABLE customers_nyc AS ( 
SELECT * 
FROM customers 
WHERE city='New York City' 
AND state='NY'
);

SELECT * FROM customers_nyc;

DELETE FROM customers_nyc 
WHERE postal_code='10014';

ALTER TABLE customers_nyc 
ADD COLUMN event text;

UPDATE customers_nyc SET
event = 'thank-you party';

SELECT * 
FROM customers_nyc;

DROP TABLE customers_nyc;
