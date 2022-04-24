CREATE TABLE products_2022 AS ( 
SELECT * 
FROM products 
WHERE year=2022
);

UPDATE Products_2022 SET  
    base_msrp = base_msrp*1.10 
WHERE model='Model Chi' 
AND year=2022;

SELECT * 
FROM products_2022 
WHERE model='Model Chi' 
AND year=2022;
