#!/bin/bash
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "dcpatel/06210050@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

DROP VIEW Film_View_without_Director;
DROP VIEW Actor_Notable_Works;
DROP VIEW Anonymous_Ratings;

exit
EOF
