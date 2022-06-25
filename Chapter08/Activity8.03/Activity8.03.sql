-- Step 1
EXPLAIN ANALYZE 
SELECT * FROM emails 
WHERE email_subject='Shocking Holiday Savings On Electric Scooters';

-- Step 2
CREATE INDEX ix_subject ON emails USING HASH(email_subject);

-- Step 4
CREATE INDEX ix_customer_id ON emails USING HASH(customer_id);

-- Step 5
EXPLAIN ANALYZE SELECT * FROM emails WHERE customer_id>100;



