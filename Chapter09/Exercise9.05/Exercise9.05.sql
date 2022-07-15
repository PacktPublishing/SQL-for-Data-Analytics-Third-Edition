
-- Step 2
DROP TABLE IF EXISTS lemon_sales;

-- Step 3
SELECT 
  customer_id, 
  sales_transaction_date::DATE as sales_date 
INTO 
  lemon_sales 
FROM 
  sales 
WHERE 
  product_id=3;

-- Step 4
SELECT 
  emails.customer_id, 
  emails.email_subject, 
  emails.opened, 
  emails.sent_date, 
  emails.opened_date, 
  lemon_sales.sales_date 
INTO 
  lemon_emails 
FROM 
  emails 
INNER JOIN 
  Lemon_sales 
ON 
  emails.customer_id=lemon_sales.customer_id;

-- Step 5
SELECT 
  production_start_date 
FROM 
  products 
WHERE 
  product_id=3;

-- Step 6
DELETE FROM 
  lemon_emails 
WHERE 
  sent_date < '2015-12-27';

-- Step 7
DELETE FROM 
  lemon_emails 
WHERE 
  sent_date > sales_date;

-- Step 8
DELETE FROM 
  lemon_emails 
WHERE 
  (sales_date - sent_date) > '30 days';

-- Step 9
SELECT DISTINCT
  email_subject
FROM 
  lemon_emails;

-- Step 10
DELETE FROM 
  lemon_emails 
WHERE 
  POSITION('25% off all EVs.' in email_subject)>0;

DELETE FROM 
  lemon_emails 
WHERE 
  POSITION('Like a Bat out of Heaven' in email_subject)>0;

DELETE FROM 
  lemon_emails 
WHERE 
  POSITION('Save the Planet' in email_subject)>0;

DELETE FROM 
  lemon_emails 
WHERE 
  POSITION('An Electric Car' in email_subject)>0;

DELETE FROM 
  lemon_emails 
WHERE 
  POSITION('We cut you a deal' in email_subject)>0;

DELETE FROM 
  lemon_emails 
WHERE 
  POSITION('Black Friday. Green Cars.' in email_subject)>0;

DELETE FROM 
  lemon_emails 
WHERE 
  POSITION('Zoom' in email_subject)>0;

-- Step 11
SELECT 
  COUNT(opened) 
FROM 
  lemon_emails 
WHERE 
  opened='t';

-- Step 12
SELECT 
  COUNT(DISTINCT(customer_id)) 
FROM 
  lemon_emails;

-- Step 13
SELECT 127.0/498.0 AS email_rate;

-- Step 14
SELECT 
  COUNT(DISTINCT(customer_id)) 
FROM 
  lemon_sales;

-- Step 15
SELECT 498.0/13854.0 AS email_sales;
