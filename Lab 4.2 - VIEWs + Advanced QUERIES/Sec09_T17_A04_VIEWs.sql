-------------------------------------------
-- Three VIEWs and more Advanced QUERIES --
-------------------------------------------

-- VIEW for Film attributes, excluding director_id
CREATE VIEW Film_View_without_Director AS
SELECT title, runtime, release_year, theCast
FROM Film
WHERE release_year > 2003;
--Associated Query
SELECT
  SUBSTR(f.title, 1, 45) AS shortened_title,
  f.runtime AS runtime,
  SUBSTR(d.first_name || ' ' || d.last_name, 1, 20) AS director_name
FROM Film f
JOIN Director d ON f.director_id = director_id
ORDER BY director_name ASC;

-- VIEW for Actor filmographies, with the new generation
CREATE VIEW Actor_Notable_Works AS
SELECT first_name, last_name, filmography
FROM Actor
WHERE EXTRACT(YEAR FROM birthdate) > 1969;
--Associated Query
SELECT
  SUBSTR(first_name, 1, 20) AS first_name,
  SUBST(last_name, 1, 20) AS last_name,
  SUBST(filmography, 1, 256) AS film_credits
FROM Actor_Notable_Works;

--VIEW for anonymising the ratings to exclude user_id
CREATE VIEW Anonymous_Ratings AS
SELECT film_id, theDescription, rating, theDate
FROM Review;
--Associated Query
SELECT
  SUBSTR(r.film_id, 1, 10) AS film_id,
  SUBSTR(d.first_name || ' ' || d.last_name, 1, 20) AS director_name,
  SUBSTR(f.title, 1, 40) AS Film_Title,
  SUBSTR(r.theDescription, 1, 70) AS 'Description',
  r.rating
FROM Anonymous_Ratings r
JOIN Director d ON d.director_id = r.film_id
JOIN Film f ON r.film_id = f.film_id
WHERE r.rating = 4
ORDER BY theDate;

--Below are a few addtional ADVANCED queries we used for testing our DB

--Based on INSERTS, only want to pull a specific BEST ACTOR from 2019
SELECT DISTINCT
  SUBSTR(r.theName, 1, 15) AS 'Receiver Name',
  SUBSTR(TO_CHAR(r.theDate, 'YYYY-MM-DD'), 1, 20) AS 'Win Date',
  SUBSTR(a.theName, 1, 15) AS 'Award Name', 
  SUBTR(a.presenter, 1, 15) AS 'Presenter', 
FROM Receiver r
JOIN Awards a on r.receiver_id = a.receiver_id
WHERE r.theDate >= TO_DATE('2019-01-01', 'YYYY-MM-DD');

--Want to extract all winners after 2014
SELECT
  SUBSTR(a.theName, 1, 15) AS Award_name, 
  SUBSTR(a.presener, 1, 21) AS Presenter,
  SUBSTR(a.year_of_win, 1, 10) AS Win_Year,
  SUBSTR(r.theName, 1, 150) AS Receiver_Title
FROM Awards a
JOIN Receiver r ON a.receiver_id = r_receiver_id
WHERE a.year_of_win > 2021;
