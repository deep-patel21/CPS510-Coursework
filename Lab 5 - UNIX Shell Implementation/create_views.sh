#!/bin/bash
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "dcpatel/06210050@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

CREATE VIEW Film_View_without_Director AS
SELECT title, runtime, release_year, theCast
FROM Film
WHERE release_year > 2003;

CREATE VIEW Actor_Notable_Works AS
SELECT first_name, last_name, filmography
FROM Actor
WHERE EXTRACT(YEAR FROM birthdate) > 1969;

CREATE VIEW Anonymous_Ratings AS
SELECT film_id, theDescription, rating, theDate
FROM Review;

exit
EOF
