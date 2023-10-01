---------------------------
-- Sample SELECT Queries --
---------------------------

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
 
