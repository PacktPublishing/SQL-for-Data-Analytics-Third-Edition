-- Step 1
CREATE TABLE order_info (
    order_id integer,
    customer_id integer,
    product_code text,
    qty integer
);
INSERT INTO order_info VALUES (1618, 3, 'GROG1', 12);
INSERT INTO order_info VALUES (1619, 2, 'POULET3', 3);
INSERT INTO order_info VALUES (1620, 4, 'MON123', 1);
INSERT INTO order_info VALUES (1621, 4, 'MON636', 3);
INSERT INTO order_info VALUES (1622, 5, 'MON666', 1);

CREATE TABLE new_products (
    product_code text,
    name text,
    stock integer
);
INSERT INTO new_products VALUES ('MON636', 'Red Herring', 99);
INSERT INTO new_products VALUES ('MON666', 'Murray"s Arm', 0);
INSERT INTO new_products VALUES ('GROG1', 'Grog', 65);
INSERT INTO new_products VALUES ('POULET3', 'El Pollo Diablo', 2);
INSERT INTO new_products VALUES ('MON123', 'Rubber Chicken + Pulley', 7);

-- Step 2
-- Run the function creation code in the Functions.sql file

-- Step 4
SELECT * FROM new_products;
SELECT * FROM order_info;

-- Step 5
SELECT insert_order(4, 'MON636', 10);

-- Step 6
SELECT * FROM order_info;

-- Step 7
SELECT update_stock();

-- Step 8
SELECT * FROM new_products;

-- Step 9
DROP FUNCTION update_stock;

-- Step 10
CREATE FUNCTION update_stock() 
RETURNS TRIGGER AS $stock_trigger$
DECLARE stock_qty integer;
BEGIN
  stock_qty := get_stock(NEW.product_code) - NEW..qty;
  UPDATE 
    new_products 
  SET 
    stock=stock_qty 
  WHERE 
    product_code=NEW.product_code;
  RETURN NEW;
END; $stock_trigger$
LANGUAGE PLPGSQL;

-- Step 11
CREATE TRIGGER update_trigger
AFTER INSERT ON order_info
FOR EACH ROW
EXECUTE PROCEDURE update_stock();

-- Step 12
SELECT insert_order(4, 'MON123', 2);

-- Step 13
SELECT * FROM order_info;

-- Step 14
SELECT * FROM new_products;

	