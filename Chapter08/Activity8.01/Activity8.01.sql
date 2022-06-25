-- Step 2
EXPLAIN 
SELECT * 
FROM customers;

-- Step 4
EXPLAIN 
SELECT * 
FROM customers
LIMIT 15;

-- Step 5
EXPLAIN 
SELECT * 
FROM customers
WHERE latitude BETWEEN 30 AND 40;

