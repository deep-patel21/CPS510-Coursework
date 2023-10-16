#!/bin/bash

# Define your Oracle Database connection information
DB_USER="dcpatel"
DB_PASS="null"
DB_HOST="moon.scs.ryerson.ca"
DB_SID="orcl"

# Define the SQL query
SQL_QUERY="SELECT column1, column2 FROM your_table_name WHERE condition;"

# Execute the SQL query using sqlplus
sqlplus -s ${DB_USER}/${DB_PASS}@${DB_HOST}/${DB_SID} <<EOF
$SQL_QUERY
EOF
