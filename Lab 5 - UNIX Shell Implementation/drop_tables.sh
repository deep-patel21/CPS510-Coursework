
#!/bin/bash

# Define your Oracle Database connection information
DB_USER = "dcpatel"
DB_PASS = "null"
DB_HOST = "oracle.scs.ryerson.ca"
DB_SID = "orcl"

# Define the SQL command to drop tables
SQL_COMMAND="DROP TABLE your_table_name;"

# Execute the SQL command using sqlplus
sqlplus -s ${DB_USER}/${DB_PASS}@${DB_HOST}/${DB_SID} <<EOF
$SQL_COMMAND
EOF
