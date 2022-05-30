# Step 1
'''
wget https://github.com/PacktPublishing/SQL-for-Data-Analytics-Third-Edition/blob/main/Datasets/public_transportation_statistics_by_zip_code.csv
'''

# Step 2
from sqlalchemy import create_engine 
import pandas as pd
%matplotlib inline

cnxn_string = ("postgresql+psycopg2://{username}:{pswd}@{host}:{port}/{database}")
print(cnxn_string)

engine = create_engine(
    cnxn_string.format( 
        username="postgres", 
        pswd="your_password",
        host="localhost", 
        port=5432, 
        database="sqlda"
    )
)

# Step 3
data = pd.read_csv(
    "c:\\Users\\Public\\public_transportation_statistics_by_zip_code.csv", 
    dtype={'zip_code':str}
)

# Step 4
data.head()

# Step 5
import csv
from io import StringIO

def psql_insert_copy(table, conn, keys, data_iter):
    # gets a DBAPI connection that can provide a cursor 
    dbapi_conn = conn.connection
    with dbapi_conn.cursor() as cur:
        s_buf = StringIO()
        writer = csv.writer(s_buf) 
        writer.writerows(data_iter) 
        s_buf.seek(0)

        columns = ', '.join('"{}"'.format(k) for k in keys) 
        if table.schema:
            table_name = '{}.{}'.format(table.schema, table.name) 
        else:
            table_name = table.name

        sql = 'COPY {} ({}) FROM STDIN WITH CSV'.format(
            table_name, 
            columns
        )
        cur.copy_expert(sql=sql, file=s_buf)

data.to_sql(
    'public_transportation_by_zip', 
    engine, 
    if_exists='replace', 
    method=psql_insert_copy
)

# Step 6
data.max()

# Step 7
data.min()

# Step 8
engine.execute(""" 
    SELECT
        MAX(public_transportation_pct) AS max_pct, 
        MIN(public_transportation_pct) AS min_pct
    FROM public_transportation_by_zip; 
""").fetchall()

# Step 9
engine.execute(""" 
    SELECT
        (public_transportation_pct > 10) AS is_high_public_transport,
        COUNT(s.customer_id) * 1.0 / COUNT(DISTINCT c.customer_id) AS sales_per_customer
    FROM
        customers c
    INNER JOIN 
        public_transportation_by_zip t 
        ON t.zip_code = c.postal_code
    LEFT JOIN 
        sales s
        ON s.customer_id = c.customer_id 
    WHERE
        public_transportation_pct >= 0 
    GROUP BY
        1
    LIMIT
    10
""").fetchall()

# Step 10
data = pd.read_sql_query(""" 
    SELECT 
        *
    FROM 
        public_transportation_by_zip 
    WHERE 
        public_transportation_pct > 0
    AND 
        public_transportation_pct < 50
""", engine) 
data.plot.hist(y='public_transportation_pct')

# Step 11
%time data.to_sql('public_transportation_by_zip', engine, if_exists='replace', method=psql_insert_copy)

%time data.to_sql('public_transportation_by_zip', engine, if_exists='replace')

# Step 12
data = pd.read_sql_query(""" 
    SELECT
        10 * ROUND(public_transportation_pct/10) AS public_transport,
        COUNT(s.customer_id) * 1.0 / COUNT(DISTINCT c.customer_id) AS sales_per_customer
    FROM 
        customers c
    INNER JOIN 
        public_transportation_by_zip t 
        ON t.zip_code = c.postal_code
    LEFT JOIN 
        sales s 
        ON s.customer_id = c.customer_id 
    WHERE 
        public_transportation_pct >= 0
    GROUP BY 
        1
""", engine)

data.to_csv('c:\\Users\\Public\\sales_vs_public_transport_pct.csv')

