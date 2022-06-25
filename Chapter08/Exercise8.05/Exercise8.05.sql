-- Step 1 to 6
CREATE FUNCTION fixed_val() 
RETURNS integer AS $$
BEGIN
  RETURN 1;
END; $$
LANGUAGE PLPGSQL;

-- Step 7
SELECT * FROM fixed_val();

-- Step 8
EXPLAIN ANALYZE SELECT * FROM fixed_val();

-- Step 9 to 15
CREATE FUNCTION num_samples() 
RETURNS integer AS $total$
DECLARE total integer;
BEGIN
  SELECT COUNT(*) INTO total FROM sales;
  RETURN total;
END; $total$
LANGUAGE PLPGSQL;

-- Step 16
SELECT num_samples();

