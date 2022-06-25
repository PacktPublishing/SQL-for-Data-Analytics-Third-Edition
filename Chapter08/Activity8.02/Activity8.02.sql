-- Step 1
EXPLAIN ANALYZE 
SELECT * 
FROM customers 
WHERE ip_address = '18.131.58.65';

-- Step 2
CREATE INDEX ix_ip ON customers(ip_address);

-- Step 4
CREATE INDEX ix_ip_less ON customers(ip_address) 
WHERE ip_address = '18.131.58.65';

-- Step 6
EXPLAIN ANALYZE SELECT * FROM customers WHERE suffix = 'Jr';

-- Step 7
CREATE INDEX ix_suffix ON customers(suffix);

