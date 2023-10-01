---------------------------
-- Sample SELECT Queries --
---------------------------

-- Associated with FILM TABLE
-- Expected Output: Oppenheimer
SELECT f.title, f.runtime AS 'runtime (minutes)', CONCAT(d.first_name, ' ', d.last_name) AS director_name
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
SELECT first_name, last_name, birthdate, filmography
FROM Director
WHERE EXCTRACT(YEAR FROM birthdate) < 1960

-- Associated with PRODUCER TABLE


-- Associated with THEUSER TABLE


-- Associated with REVIEW TABLE


-- Associated with STUDIO TABLE


-- Associated with AWRADS TABLE


-- Associated with RECIEVER TABLE



