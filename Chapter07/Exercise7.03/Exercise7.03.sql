-- Step 1
CREATE TEMP TABLE customer_email_sequences AS (
  SELECT
    customer_id,
    ARRAY_AGG(
      email_subject ORDER BY sent_date
    ) AS email_sequence
  FROM 
emails
  GROUP BY 
    1
);

-- Step 2
CREATE TEMP TABLE top_email_sequences AS (
  SELECT
    email_sequence,
    COUNT(1) AS occurrences
  FROM 
    customer_email_sequences
  GROUP BY 
    1
  ORDER BY 
    2 DESC
  LIMIT 
    3
);

SELECT 
  email_sequence 
FROM 
  top_email_sequences;


-- Step 3
ALTER TABLE 
  top_email_sequences 
ADD COLUMN 
  id SERIAL PRIMARY KEY;

-- Step 4
SELECT
  super_email_seq.id AS superset_id,
  sub_email_seq.id AS subset_id
FROM 
  top_email_sequences AS super_email_seq
CROSS JOIN 
  top_email_sequences AS sub_email_seq
WHERE 
  super_email_seq.email_sequence @> sub_email_seq.email_sequence
AND 
  super_email_seq.id != sub_email_seq.id;

