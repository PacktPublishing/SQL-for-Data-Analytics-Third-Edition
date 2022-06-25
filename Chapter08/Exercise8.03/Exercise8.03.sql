-- Step 1 
DROP INDEX ix_gender;
DROP INDEX ix_state;
DROP INDEX ix_latitude;
DROP INDEX ix_latitude_less;

-- Step 2
EXPLAIN ANALYZE SELECT * FROM customers WHERE gender='M';

-- Step 3	
CREATE INDEX ix_gender ON customers USING btree(gender);

-- Step 4
EXPLAIN ANALYZE SELECT * FROM customers WHERE gender='M';

-- Step 5
DROP INDEX ix_gender;

-- Step 6
CREATE INDEX ix_gender ON customers USING HASH(gender);

-- Step 7
EXPLAIN ANALYZE SELECT * FROM customers WHERE gender='M';

-- Step 8
EXPLAIN ANALYZE SELECT * FROM customers WHERE state='FO';

-- Step 9
CREATE INDEX ix_state ON customers USING BTREE(state);
EXPLAIN ANALYZE SELECT * FROM customers WHERE state='FO';

-- Step 10
DROP INDEX ix_state;
CREATE INDEX ix_state ON customers USING HASH(state);

-- Step 11
EXPLAIN ANALYZE SELECT * FROM customers WHERE state='FO';

