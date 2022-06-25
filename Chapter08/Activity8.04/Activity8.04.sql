-- Step 1 to 6
CREATE FUNCTION max_sale() 
RETURNS integer AS $big_sale$
DECLARE big_sale numeric;
BEGIN
	SELECT MAX(sales_amount) INTO big_sale FROM sales;
	RETURN big_sale;
END; $big_sale$
LANGUAGE PLPGSQL;

-- Step 7
SELECT * FROM max_sale()
