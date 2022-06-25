-- Step 2
EXPLAIN SELECT * FROM emails;

-- Step 3
EXPLAIN SELECT * FROM emails LIMIT 5;

-- Step 4
EXPLAIN 
SELECT * 
FROM emails 
WHERE clicked_date BETWEEN '2011-01-01' and '2011-02-01';

