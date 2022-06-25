-- Step 1 to 4
CREATE FUNCTION avg_sales_window(from_date DATE, to_date DATE) 
RETURNS numeric AS $sales_avg$
DECLARE sales_avg numeric;
BEGIN
  SELECT AVG(sales_amount) 
  FROM sales 
  INTO sales_avg 
  WHERE sales_transaction_date > from_date 
  AND sales_transaction_date < to_date;
  RETURN sales_avg;
END; $sales_avg$
LANGUAGE PLPGSQL;

-- Step 5
SELECT avg_sales_window('2020-04-12', '2021-04-12');
