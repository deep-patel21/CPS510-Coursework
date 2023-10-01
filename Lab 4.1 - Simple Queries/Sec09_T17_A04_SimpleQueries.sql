---------------------------
-- Sample SELECT Queries --
---------------------------

-- Associated with FILM TABLE
-- Expected Output: {Oppenheimer}, {180}, {Christopher Nolan}
--                  {Terminator 2: Judgement Day}, {137}, {James Cameron}
--                  {Mission: Impossible - Ghost Protocol}, {172}, {Brad Bird}
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
WHERE EXTRACT(YEAR FROM birthdate) < 1960

-- Associated with PRODUCER TABLE
-- Expected Output: {Edward}, {Furlong}, {Living & Dying, Heart of a Champion, Star Trek: The Next Generation}
SELECT first_name, last_name, filmography
FROM Producer;
WHERE nationality = 'American' AND filmography LIKE '%Star Trek%';

-- Associated with THEUSER TABLE
-- Expected Output: {Anmol}, {Panchal}, {IwasHuman}
--                  {Deep}, {Patel}, {Deep Studios}
--                  {Aryan}, {Patel}, {Rayna}
SELECT first_name_ last_name, username
FROM TheUser
WHERE username LIKE 'Admin%'

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
SELECT name, owner, credits
FROM Studio
WHERE location LIKE '%BURBANK%'

-- Associated with AWRADS TABLE
-- Expected Output: {Best Film}, {Academy Awards}, {2022}, {Wojak}
--                  {Best Director}, {Academy Awards}, {2023}, {Steve}
SELECT a.theName AS "Award Name", a.presenter, a.year_of_win AS "Win Year", r.theName AS "Receiver Title"
FROM Awards a
JOIN Receiver r ON a.receiver_id = r.receiver_id
WHERE a.year_of_win > 2014;


-- Associated with RECIEVER TABLE
-- Expected Output: {}
SELECT theName AS "Receiver Name", theDate AS "Receiving Date"
FROM Receiver
WHERE theDate >= TO_DATE('2019-01-01', 'YYYY-MM-DD');



