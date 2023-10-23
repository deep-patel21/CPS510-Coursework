
#!/bin/bash
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "dcpatel/06210050@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

set lines 150
set pagesize 50000
set trimspool on
set trimout on
set tab off

--Find directors who made made 2 films
SELECT director_id, first_name, last_name
FROM Director d
WHERE EXISTS (
    SELECT 1
    FROM Film f
    WHERE f.director_id = d.director_id
    HAVING COUNT(*) >= 2
);

--Unionizes names of all actors and directors in DB
SELECT first_name, last_name
FROM Actor
UNION
SELECT first_name, last_name
FROM Director;

-- Find movies that don't have a 4-star rating
SELECT title
FROM Film
MINUS
SELECT title
FROM Film
WHERE film_id IN (
    SELECT DISTINCT film_id
    FROM Review
    WHERE rating = 4
);


--COUNT number of films released in any given year with more than 1 releases
SELECT release_year, COUNT(*) as num_films
FROM Film
GROUP BY release_year
HAVING COUNT(*) >= 1;


--Finds films who have atleast one 5 star rating, indicating high popularity in DB
SELECT title
FROM Film f
WHERE EXISTS (
    SELECT 1
    FROM Review r
    WHERE r.film_id = f.film_id
    AND r.rating = 4
);

--UNIONIZES the titles of films with the studios at which they were created
SELECT title AS film_or_studio_name, 'Film' AS source
FROM Film
UNION
SELECT name AS film_or_studio_name, 'Studio' AS source
FROM Studio;


exit;
EOF
