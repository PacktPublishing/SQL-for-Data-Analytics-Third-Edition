-- Step 2
CREATE TABLE avg_qty_log (order_id integer, avg_qty numeric);

-- Step 3
CREATE FUNCTION avg_qty() RETURNS TRIGGER AS $_avg$
DECLARE _avg numeric;
BEGIN
  SELECT 
    AVG(qty) 
  INTO 
    _avg 
  FROM 
    order_info;
  INSERT INTO 
    avg_qty_log (order_id, avg_qty) 
  VALUES 
    (NEW.order_id, _avg);
  RETURN NEW;
END; $_avg$
LANGUAGE PLPGSQL;

-- Step 4
CREATE TRIGGER avg_trigger
AFTER INSERT ON order_info
FOR EACH ROW
EXECUTE PROCEDURE avg_qty();

-- Step 5
SELECT insert_order(3, 'GROG1', 6);
SELECT insert_order(4, 'GROG1', 7);
SELECT insert_order(1, 'GROG1', 8);

-- Step 6
SELECT * FROM avg_qty_log;
