
-- Step 2
SELECT 
  * 
FROM 
  emails 
LIMIT 
  5;

-- Step 3
SELECT 
  emails.email_subject, 
  emails.customer_id, 
  emails.opened, 
  emails.sent_date, 
  emails.opened_date, 
  bat_sales.sales_date 
INTO 
  bat_emails 
FROM 
  emails 
INNER JOIN 
  bat_sales 
ON 
  bat_sales.customer_id=emails.customer_id 
ORDER BY 
  bat_sales.sales_date;

-- Step 4
SELECT 
  * 
FROM 
  bat_emails 
ORDER BY 
  sales_date
LIMIT 
  10;

-- Step 5
SELECT 
  * 
FROM 
  bat_emails 
WHERE 
  sent_date < sales_date 
ORDER BY 
  customer_id 
LIMIT 
  22;

-- Step 6
DELETE FROM 
  bat_emails 
WHERE 
  sent_date < '2019-06-07';

-- Step 7
DELETE FROM 
  bat_emails 
WHERE 
  sent_date > sales_date;

-- Step 8
DELETE FROM 
  Bat_emails 
WHERE 
  sales_date-sent_date > '30 days';

-- Step 9
SELECT 
  * 
FROM 
  bat_emails 
ORDER BY 
  customer_id 
LIMIT 
  22;

-- Step 10
SELECT 
  DISTINCT(email_subject) 
FROM 
  bat_emails;

-- Step 11
DELETE FROM 
  bat_emails 
WHERE 
  position('Black Friday' in email_subject)>0;

-- Step 12
DELETE FROM 
  bat_emails 
WHERE 
  position('25% off all EV' in email_subject)>0;

DELETE FROM 
  bat_emails 
WHERE 
  position('Some New EV' in email_subject)>0;

-- Step 13
SELECT 
  count(sales_date) 
FROM 
  bat_emails;

-- Step 14
SELECT 
  count(opened) 
FROM 
  bat_emails 
WHERE 
  opened='t';

-- Step 15
SELECT 
  COUNT(DISTINCT(customer_id)) 
FROM 
  bat_emails;

-- Step 16
SELECT 
  COUNT(DISTINCT(customer_id)) 
FROM 
  bat_sales;

-- Step 17
SELECT 314.0/6659.0 AS email_rate;
