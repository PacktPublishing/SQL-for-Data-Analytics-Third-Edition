-- Step 2
EXPLAIN SELECT * FROM customers WHERE state='FO';

-- Step 3
EXPLAIN SELECT DISTINCT state FROM customers;

-- Step 4
CREATE INDEX ix_state ON customers(state);

-- Step 5
EXPLAIN SELECT * FROM customers WHERE state='FO';

-- Step 6
EXPLAIN SELECT * FROM customers WHERE gender='M';

-- Step 7
CREATE INDEX ix_gender ON customers(gender);

-- Step 8
\d customers;

-- Step 9
EXPLAIN SELECT * FROM customers WHERE gender='M';

-- Step 10
EXPLAIN SELECT * FROM customers WHERE (latitude < 38) AND (latitude > 30);

-- Step 11
CREATE INDEX ix_latitude ON customers(latitude);

-- Step 13
EXPLAIN ANALYZE SELECT * FROM customers WHERE (latitude < 38) AND (latitude > 30);

-- Step 14
CREATE INDEX ix_latitude_less ON customers(latitude) WHERE (latitude < 38) and (latitude > 30);

