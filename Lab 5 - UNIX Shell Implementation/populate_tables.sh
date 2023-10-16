#!/bin/bash

# Define your Oracle Database connection information
DB_USER="dcpatel"
DB_PASS="null"
DB_HOST="moon.scs.ryerson.ca"
DB_SID="orcl"

# Define the SQL command to populate tables
SQL_COMMAND="INSERT INTO your_table_name (column1, column2, ...) VALUES (value1, value2, ...);"

# Execute the SQL command using sqlplus
sqlplus -s ${DB_USER}/${DB_PASS}@${DB_HOST}/${DB_SID} <<EOF
$SQL_COMMAND
EOF
