# Step 2
from sqlalchemy import create_engine 
import pandas as pd

# Step 3
%matplotlib inline 

# Step 4
cnxn_string = (
    "postgresql+psycopg2://{username}:{pswd}@{host}:{port}/{database}"
)

engine = create_engine(
    cnxn_string.format( 
        username="postgres", 
        pswd="postgres",
        host="localhost", 
        port=5432, 
        database="sqlda"
    )
)

# Step 5
query = """ 
  SELECT 
    city,
    COUNT(1) AS number_of_customers, 
    COUNT(NULLIF(gender, 'M')) AS female, 
    COUNT(NULLIF(gender, 'F')) AS male 
  FROM 
    customers
  WHERE 
    city IS NOT NULL 
  GROUP BY 
    1
  ORDER BY 
    2 DESC 
  LIMIT 
    10
"""

# Step 6
top_cities_data = pd.read_sql_query(query, engine)

# Step 7
ax = top_cities_data.plot.bar(
    'city', 
    y=['female', 'male'],
    title='Number of Customers by Gender and City'
)

# Step 8
top_cities_data.to_sql(
    'top_cities_data', 
    engine, 
    index=False, 
    if_exists='replace'
)

# Step 9
SELECT
  t.city,
  t.number_of_customers,
  SUM(s.sales_amount)
FROM 
  sales s
JOIN 
  customers c
  ON s.customer_id = c.customer_id
JOIN 
  top_cities_data t
  ON c.city = t.city
GROUP BY
  1, 2
ORDER BY
  2 DESC;
