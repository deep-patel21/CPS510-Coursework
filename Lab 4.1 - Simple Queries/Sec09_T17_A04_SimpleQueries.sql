SELECT *
FROM Film;

SELECT title, runtime, release_year
FROM Film
WHERE runtime >= 170;

SELECT title
From Film
WHERE director_id = 1;

SELECT first_name, last_name
FROM Actor
WHERE nationality = 'American';

SELECT name
FROM Studio
WHERE location = 'Burbank, California';

SELECT rating
FROM Review
WHERE rating = 4;

SELECT email
FROM TheUser;

SELECT receiver_id, theName, year_of_win
FROM Awards
WHERE year_of_win = '2023';

-----------------------------
-- Advanced SELECT Queries --
-----------------------------

-- Associated with FILM TABLE
-- Expected Output: {Oppenheimer}, {180}, {Christopher Nolan}
--                  {Terminator 2: Judgement Day}, {137}, {James Cameron}
--                  {Mission: Impossible - Ghost Protocol}, {172}, {Brad Bird}
SELECT f.title, f.runtime AS RUNTIME, CONCAT(d.first_name, ' ', d.last_name) AS director_name
FROM Film f
JOIN Director d ON f.director_id = d.director_id

-- Associated with ACTOR TABLE
-- Expected Output: {Robert}, {Downey Jr.}, {American}
--                  {Matt}, {Damon}, {American}
--                  {Linda}, {Hamilton}, {American}
--                  {Edward}, {Furlong}, {American}
--                  {Tom}, {Cruise}, {American}
--                  {Jeremy}, {Renner}, {American}
SELECT first_name, last_name, nationality
FROM Actor
WHERE nationality = 'American';

-- Associated with DIRECTOR TABLE
-- Expected Output: {James}, {Cameron}, {1954}, {Titanic, Avatar: The Way of Water, Terminator 2: Judgement Day}
--                  {Brad}, {Bird}, {1957}, {The Incredibles, Ratatouille, Cars}
SELECT 
  SUBSTR(first_name, 1, 10) AS first_name,
  SUBSTR(last_name, 1, 10) AS last_name,
  TO_CHAR(birthdate, 'YYYY-MM-DD') AS birth_date,
  filmography
FROM Director
WHERE EXTRACT(YEAR FROM birthdate) < 1960;


-- Associated with PRODUCER TABLE
-- Expected Output: {Bryan}, {Burk}, {Living & Dying, Heart of a Champion, Star Trek: The Next Generation}
SELECT first_name, last_name, filmography
FROM Producer
WHERE nationality = 'American' AND filmography LIKE '%Star Trek%';

-- Associated with THEUSER TABLE
-- Expected Output: {Anmol}, {Panchal}, {IwasHuman}
--                  {Deep}, {Patel}, {Deep Studios}
--                  {Aryan}, {Patel}, {Rayna}
SELECT first_name, last_name, username
FROM TheUser
WHERE password LIKE 'Admin%'

-- Associated with REVIEW TABLE
-- Expected Output: {2}, {Deep Studios}, {Mission: Impossible - Ghost Protocol}, {Iconic film}, {4}
--                  {3}, {IwasHuman}, {Terminator 2: Judgement Day}, {Amazing Movie}, {4}
SELECT r.review_id, u.username, f.title AS 'Film Title', r.theDescription AS "Description", r.rating
FROM Review r
JOIN TheUser u ON r.user_id = u.user_id
JOIN Film f ON r.film_id = f.film_id
WHERE r.rating = 4;

-- Associated with STUDIO TABLE
-- Expected Output: {Warner Bros.}, {David Zaslav}, {Tenet, Inception, Shazam}
SELECT 
  SUBSTR(name, 1, 20) AS name_short,
  SUBSTR(owner, 1, 20) AS owner_short,
  SUBSTR(location, 1, 20) AS location_short,
  credits
FROM Studio
WHERE location LIKE '%Burbank%';

-- Associated with AWRADS TABLE
-- Expected Output: {Best Film}, {Academy Awards}, {2022}, {Wojak}
--                  {Best Director}, {Academy Awards}, {2023}, {Steve}
SELECT 
  SUBSTR(a.theName, 1, 15) AS "Award Name",
  SUBSTR(a.presenter, 1, 21) AS "Presenter",
  SUBSTR(a.year_of_win, 1, 10) AS "Win Year", 
  SUBSTR(r.theName, 1, 50) AS "Receiver Title" 
FROM Awards a
JOIN Receiver r ON a.receiver_id = r.receiver_id
WHERE a.year_of_win > 2014;


-- Associated with RECIEVER TABLE
-- Expected Output: {Steve Hamilton}, {2019-05-18}
--                  {Interstellar}, {2023-02-17}
SELECT 
  SUBSTR(theName, 1, 15) AS "Receiver Name",
  SUBSTR(TO_CHAR(theDate, 'YYYY-MM-DD'), 1, 12) AS "Receiving Date" 
FROM Receiver
WHERE theDate >= TO_DATE('2019-01-01', 'YYYY-MM-DD');
