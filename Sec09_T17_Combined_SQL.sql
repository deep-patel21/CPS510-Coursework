----------------------------------------
-- Sec09 Team 17 Assignments Combined --
----------------------------------------

-------------------------------
-- Create Tables of Entities --
-------------------------------
CREATE TABLE Film (
  film_id NUMBER PRIMARY KEY,
  title VARCHAR2(100) NOT NULL,
  runtime NUMBER,
  release_year NUMBER, 
  director_id NUMBER,
  FOREIGN KEY (director_id) REFERENCES Director(director_id),
  theCast VARCHAR2(1000) NOT NULL
);

CREATE TABLE Actor (
  actor_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(50) NOT NULL, 
  last_name VARCHAR2(50) NOT NULL,
  birthdate DATE,
  nationality VARCHAR2(50) NOT NULL,
  filmography CLOB
);

CREATE TABLE Director (
  director_id NUMBER PRIMARY KEY, 
  first_name VARCHAR2(50) NOT NULL, 
  last_name VARCHAR2(50) NOT NULL,
  birthdate DATE,
  nationality VARCHAR2(50) NOT NULL,
  filmography CLOB
);

CREATE TABLE Producer (
  producer_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(50) NOT NULL, 
  last_name VARCHAR2(50) NOT NULL,
  birthdate DATE,
  nationality VARCHAR2(50) NOT NULL,
  filmography CLOB
);

CREATE TABLE TheUser (
  user_id NUMBER PRIMARY KEY, 
  first_name VARCHAR2(50) NOT NULL, 
  last_name VARCHAR2(50) NOT NULL, 
  username VARCHAR2(50) UNIQUE NOT NULL,
  email VARCHAR2(100) UNIQUE NOT NULL, 
  password VARCHAR2(100) NOT NULL
);

CREATE TABLE Review (
  review_id NUMBER PRIMARY KEY, 
  user_id NUMBER, 
  film_id NUMBER, 
  theDescription CLOB,
  rating NUMBER, 
  theDate DATE,
  FOREIGN KEY (user_id) REFERENCES TheUser(user_id),
  FOREIGN KEY (film_id) REFERENCES Film(film_id)
);

CREATE TABLE Studio (
  studio_id NUMBER PRIMARY KEY,
  name VARCHAR2(100) NOT NULL,
  owner VARCHAR2(50),
  location VARCHAR2(200),
  credits VARCHAR2(800)
);

CREATE TABLE Awards (
  award_id NUMBER PRIMARY KEY, 
  theName VARCHAR2(100) NOT NULL,
  presenter VARCHAR2(100) NOT NULL,
  year_of_win NUMBER,
  receiver_id NUMBER, 
  winner_type VARCHAR2(20) CHECK (winner_type IN ('Person', 'Film')),
  FOREIGN KEY (receiver_id) REFERENCES Receiver(receiver_id)
);

CREATE TABLE Receiver (
  receiver_id NUMBER PRIMARY KEY,
  theName VARCHAR2(50) NOT NULL,
  theDate DATE,
);

------------------------------------
-- Create Tables of Relationships --
------------------------------------

CREATE TABLE Actor_Acts_In_Film (
  actor_id NUMBER NOT NULL, 
  film_id NUMBER NOT NULL,
  PRIMARY KEY (actor_id, film_id),
  FOREIGN KEY (actor_id) REFERENCES Actor(actor_id),
  FOREIGN KEY (film_id) REFERENCES Film(film_id)
);

CREATE TABLE Director_Directs_Film (
    director_id NUMBER NOT NULL,
    film_id NUMBER NOT NULL,
    PRIMARY KEY (director_id, film_id),
    FOREIGN KEY (director_id) REFERENCES Director(director_id),
    FOREIGN KEY (film_id) REFERENCES Film(film_id)
);

CREATE TABLE Producer_Produces_Film (
    producer_id NUMBER NOT NULL,
    film_id NUMBER NOT NULL,
    PRIMARY KEY (producer_id, film_id),
    FOREIGN KEY (producer_id) REFERENCES Producer(producer_id),
    FOREIGN KEY (film_id) REFERENCES Film(film_id)
);

CREATE TABLE Studio_Owns_Film (
    studio_id NUMBER NOT NULL,
    film_id NUMBER NOT NULL,
    PRIMARY KEY (studio_id, film_id),
    FOREIGN KEY (studio_id) REFERENCES Studio(studio_id),
    FOREIGN KEY (film_id) REFERENCES Film(film_id)
);

CREATE TABLE Awards_Given_To_Film (
    award_id NUMBER NOT NULL,
    film_id NUMBER NOT NULL,
    PRIMARY KEY (award_id, film_id),
    FOREIGN KEY (award_id) REFERENCES Awards(award_id),
    FOREIGN KEY (film_id) REFERENCES Film(film_id)
);

CREATE TABLE TheUser_Creates_Review (
    user_id NUMBER NOT NULL,
    review_id NUMBER NOT NULL,
    PRIMARY KEY (user_id, review_id),
    FOREIGN KEY (user_id) REFERENCES TheUser(user_id),
    FOREIGN KEY (review_id) REFERENCES Review(review_id)
);

CREATE TABLE Review_Rates_Film (
    review_id NUMBER NOT NULL,
    film_id NUMBER NOT NULL,
    rating NUMBER,
    PRIMARY KEY (review_id, film_id),
    FOREIGN KEY (review_id) REFERENCES Review(review_id),
    FOREIGN KEY (film_id) REFERENCES Film(film_id)
);

-----------------------------------------------------------------------------
---- NOTE: Onwards is the code for many INSERT and SELECT statements,    ----
----       which the rubric says is OPTIONAL. We have included it here   ----
----      as it was a part of our testing.                               ----
-----------------------------------------------------------------------------
----------------------------
-- Update Values in Table --
----------------------------

-- Insert Details into Film Table
INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast)
VALUES (1, 'Oppenheimer', 180, 2023, 1, 'Cillian Murphy, Robert Downey Jr., Matt Damon');

INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast)
VALUES (2, 'Terminator 2: Judgement Day', 137, 1991, 2, 'Arnold Schwarznegger, Linda Hamilton, Edward Furlong');

INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast)
VALUES (3, 'Mission: Impossible - Ghost Protocol', 172, 2011, 3, 'Tom Cruise, Jeremy Renner, Simon Pegg');

INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast)
VALUES (4, 'Harry Potter and The Prizoner of Azkaban', 139, 2004, 4, 'Daniel Radcliffe, Rupert Grint, Emma Watson');

INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast)
VALUES (5, 'Dunkirk', 106, 2017, 1, 'Tom Hardy, Cillian Murphy, Harry Styles');

INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast)
VALUES (6, 'Pulp Fiction', 154, 1994, 5, 'John Travolta, Samuel L. Jackson, Uma Thurman');

INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast)
VALUES (7, 'Jurassic Park', 127, 1993, 6, 'Sam Neill, Laura Dern, Jeff Goldblum');

INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast)
VALUES (8, 'The Matrix', 136, 1999, 8, 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss');

INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast)
VALUES (9, 'Forrest Gump', 142, 1994, 9, 'Tom Hanks, Robin Wright, Gary Sinise');

INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast)
VALUES (10, 'The Shawshank Redemption', 142, 1994, 10, 'Tim Robbins, Morgan Freeman, Bob Gunton');



-- Insert Details into Actor Table
INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (1, 'Cillian', 'Murphy', TO_DATE('1976-05-25', 'YYYY-MM-DD'), 'Irish', '28 Days Later, The Dark Knight, Oppenheimer');

INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (2, 'Robert', 'Downey Jr.', TO_DATE('1965-04-04', 'YYYY-MM-DD'), 'American', 'Iron Man 3, Sherlock Holmes, Avengers: Endgame');

INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (3, 'Matt', 'Damon', TO_DATE('1970-10-08', 'YYYY-MM-DD'), 'American', 'The Martian, Good Will, Hunting, Ford v Ferrari');

INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (4, 'Arnold', 'Schwarzenegger', TO_DATE('1947-07-30', 'YYYY-MM-DD'), 'Austrian-American', 'Terminator 2: Judgement Day, The 6th Day, Last Action Hero');

INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (5, 'Linda', 'Hamilton', TO_DATE('1956-09-26', 'YYYY-MM-DD'), 'American', 'Terminator: Dark Fate, Easy Does It, Lost Girl');

INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (6, 'Edward', 'Furlong', TO_DATE('1977-08-02', 'YYYY-MM-DD'), 'American', 'Terminator 2: Judgement Day, The Green Hornet, Detroit Rock City');

INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (7, 'Tom', 'Cruise', TO_DATE('1962-07-03', 'YYYY-MM-DD'), 'American', 'Top Gun: Maverick, Mission: Impossible - Dead Reckoning Part One, Jack Reacher');

INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (8, 'Jeremy', 'Renner', TO_DATE('1971-01-07', 'YYYY-MM-DD'), 'American', 'Captain America: Civil War, Kill the Messenger, Mission: Impossible - Rogue Nation');

INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (9, 'Simon', 'Pegg', TO_DATE('1970-02-14', 'YYYY-MM-DD'), 'British', 'The Ice Age Adventures of Buck Wild, Hot Fuzz, Mission: Impossible - Dead Reckoning Part One');

INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (10, 'Meryl', 'Streep', TO_DATE('1949-06-22', 'YYYY-MM-DD'), 'American', 'The Devil Wears Prada, Mamma Mia!, The Iron Lady');

INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (11, 'Leonardo', 'DiCaprio', TO_DATE('1974-11-11', 'YYYY-MM-DD'), 'American', 'Titanic, The Revenant, Inception');

INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (12, 'Angelina', 'Jolie', TO_DATE('1975-06-04', 'YYYY-MM-DD'), 'American', 'Tomb Raider, Maleficent, Girl, Interrupted');




-- Insert Details into Director Table
INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (1, 'Christopher', 'Nolan', TO_DATE('1970-07-30', 'YYYY-MM-DD'), 'British-American', 'Tenet, Interstellar, Inception');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (2, 'James', 'Cameron', TO_DATE('1954-08-16', 'YYYY-MM-DD'), 'Canadian-American', 'Titanic, Avatar: The Way of Water, Terminator 2: Judgement Day');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (3, 'Brad', 'Bird', TO_DATE('1957-09-24', 'YYYY-MM-DD'), 'American', 'The Incredibles, Ratatouille, Cars');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (4, 'Alfonso', 'Cuaron', TO_DATE('1961-11-08', 'YYYY-MM-DD'), 'Mexican', 'Gravity, Roma, A Little Princess');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (5, 'Quentin', 'Tarantino', TO_DATE('1963-03-27', 'YYYY-MM-DD'), 'American', 'Pulp Fiction, Kill Bill, Django Unchained');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (6, 'Steven', 'Spielberg', TO_DATE('1946-12-18', 'YYYY-MM-DD'), 'American', 'Jurassic Park, E.T. the Extra-Terrestrial, Schindler''s List');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (7, 'Lana', 'Wachowski', TO_DATE('1965-06-21', 'YYYY-MM-DD'), 'American', 'The Matrix, Cloud Atlas, Sense8');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (8, 'Robert', 'Zemeckis', TO_DATE('1951-05-14', 'YYYY-MM-DD'), 'American', 'Forrest Gump, Back to the Future, Cast Away');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (9, 'Frank', 'Darabont', TO_DATE('1959-01-28', 'YYYY-MM-DD'), 'American', 'The Shawshank Redemption, The Green Mile, The Mist');


-- Insert Details into Producer Table
INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (1, 'Emma', 'Thomas', TO_DATE('1971-12-09', 'YYYY-MM-DD'), 'British', 'Inception, Interstellar, Dunkirk');

INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (2, 'Edward', 'Furlong', TO_DATE('1977-08-02', 'YYYY-MM-DD'), 'American', 'Living & Dying, Heart of a Champion, Matt''s Chance');

INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (3, 'Bryan', 'Burk', TO_DATE('1968-12-30', 'YYYY-MM-DD'), 'American', 'Mission: Impossible - Rogue Nation, Star Trek Into Darkness, The Cloverfield Paradox');

INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (4, 'Kathleen', 'Kennedy', TO_DATE('1953-06-05', 'YYYY-MM-DD'), 'American', 'Jurassic Park, E.T. the Extra-Terrestrial, Star Wars: The Force Awakens');

INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (5, 'Jerry', 'Bruckheimer', TO_DATE('1945-09-21', 'YYYY-MM-DD'), 'American', 'Pirates of the Caribbean, Top Gun, Armageddon');





-- Insert Details into User Table
INSERT INTO TheUser(user_id, first_name, last_name, username, email, password)
VALUES (1, 'Anmol', 'Panchal', 'IwasHuman', 'anmol.panchal@torontomu.ca', 'Admin1');

INSERT INTO TheUser(user_id, first_name, last_name, username, email, password)
VALUES (2, 'Deep', 'Patel', 'Deep Studios', 'deep.c.patel@torontomu.ca', 'Admin2');

INSERT INTO TheUser(user_id, first_name, last_name, username, email, password)
VALUES (3, 'Aryan', 'Patel', 'Rayna', 'aryan.patel@torontomu.ca', 'Admin3');

INSERT INTO TheUser(user_id, first_name, last_name, username, email, password)
VALUES (4, 'John', 'Doe', 'JohnDoe123', 'john.doe@gmail.com', 'ilovemovies');

INSERT INTO TheUser(user_id, first_name, last_name, username, email, password)
VALUES (5, 'Emma', 'Smithson', 'harrypotterfan450', 'emma.smithson@gmail.com', 'voldemortthedark');

INSERT INTO TheUser(user_id, first_name, last_name, username, email, password)
VALUES (6, 'Daniel', 'Mosfet', '007Lover', 'daniel.mosfet@007.com', '007SecretAgent');

INSERT INTO TheUser(user_id, first_name, last_name, username, email, password)
VALUES (7, 'System', 'Admin', 'AdminSir', 'sytem_admin@dbms.com', 'AdminMaster');


-- Insert Details into Studio Tables
INSERT INTO Studio(studio_id, name, owner, location, credits)
VALUES (1, 'Universal Studios', 'Mark Woodbury', 'Universal City, California', 'Fast X, The Super Mario Bros, Jurrasic World: Dominion');

INSERT INTO Studio(studio_id, name, owner, location, credits)
VALUES (2, 'Warner Bros', 'David Zaslav', 'Burbank, California', 'Tenet, Inception, Shazam');

INSERT INTO Studio(studio_id, name, owner, location, credits)
VALUES (3, 'Paramount Pictures', 'Brian Robbins', 'Los Angeles, California', 'Scream, Shrek Forever After, Top Gun: Maverick');

INSERT INTO Studio(studio_id, name, owner, location, credits)
VALUES (4, 'Sony Pictures Entertainment', 'Tony Vinciquerra', 'Culver City, California', 'Spider-Man: No Way Home, Venom: Let There Be Carnage, Ghostbusters: Afterlife');

INSERT INTO Studio(studio_id, name, owner, location, credits)
VALUES (5, '20th Century Studios', 'Dana Walden', 'Century City, California', 'Deadpool, The Martian, Logan');

INSERT INTO Studio(studio_id, name, owner, location, credits)
VALUES (6, 'New Line Cinema', 'Ann Sarnoff', 'Burbank, California', 'The Lord of the Rings: The Fellowship of the Ring, A Nightmare on Elm Street, The Conjuring');



-- Insert Details into Awards Tables
INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type)
VALUES (1, 'Best Film', 'Academy Awards', '2022', 1, 'Film');

INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type)
VALUES (2, 'Best Actor', 'Oscars Ceremony', '2023', 2, 'Person');

INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type)
VALUES (3, 'Best Director', 'Academy Awards', '2014', 3, 'Person');

INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type)
VALUES (4, 'Best Actress', 'Academy Awards', '2018', 2, 'Person');

INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type)
VALUES (5, 'Best Original Score', 'Grammy Awards', '2022', 1, 'Film');



-- Insert Details into Review Table
INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate)
VALUES (1, 3, 2, 'This movie was action packed with my favorite action hero Arnold!', 4, TO_DATE('2023-07-03', 'YYYY-MM-DD'));

INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate)
VALUES (2, 2, 3, 'The iconic run of Tom Cruise made this movie epic to watch.', 4, TO_DATE('2023-05-16', 'YYYY-MM-DD'));

INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate)
VALUES (3, 1, 1, 'Amazing cinematics from Nolan once again. Pristine performance!.', 5, TO_DATE('2023-06-21', 'YYYY-MM-DD'));

INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate)
VALUES (4, 4, 6, 'An unforgettable cinematic experience! Tarantino''s masterpiece.', 5, TO_DATE('2023-09-12', 'YYYY-MM-DD'));

INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate)
VALUES (5, 5, 7, 'A thrilling adventure with dinosaurs! Spielberg''s classic.', 4, TO_DATE('2023-08-27', 'YYYY-MM-DD'));



-- Insert Details into Receiver Table
INSERT INTO Receiver(receiver_id, theName, theDate)
VALUES (1, 'Harry Potter and The Philosopher''s Stone', TO_DATE('2018-03-13', 'YYYY-MM-DD'));

INSERT INTO Receiver(receiver_id, theName, theDate)
VALUES (2, 'Steve Hamilton', TO_DATE('2019-05-18', 'YYYY-MM-DD'));

INSERT INTO Receiver(receiver_id, theName, theDate)
VALUES (3, 'Dwayne Johnson', TO_DATE('2012-01-11', 'YYYY-MM-DD'));

INSERT INTO Receiver(receiver_id, theName, theDate)
VALUES (4, 'Interstellar', TO_DATE('2023-02-17', 'YYYY-MM-DD'));

INSERT INTO Receiver(receiver_id, theName, theDate)
VALUES (5, 'Inception', TO_DATE('2010-07-08', 'YYYY-MM-DD'));

INSERT INTO Receiver(receiver_id, theName, theDate)
VALUES (6, 'Jodie Foster', TO_DATE('2013-03-02', 'YYYY-MM-DD'));


---------------------------
-- Simple SELECT Queries --
---------------------------

-- Note: Expeceted outputs have not been traced for the followin TEST queries
--       They will be present along with the required advanced queries
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
SELECT 
  SUBSTR(f.title, 1, 45) AS shortened_title, 
  f.runtime AS RUNTIME, 
  SUBSTR(d.first_name || ' ' || d.last_name, 1, 20) AS director_name 
FROM Film f
JOIN Director d ON f.director_id = d.director_id;

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
SELECT 
  SUBSTR(r.review_id, 1, 10) AS review_id, 
  SUBSTR(u.username, 1, 15) AS username, 
  SUBSTR(f.title, 1, 40) AS Film_Title, 
  SUBSTR(r.theDescription, 1, 70) AS "Description", 
  r.rating
FROM Review r
JOIN TheUser u ON r.user_id = u.user_id
JOIN Film f ON r.film_id = f.film_id
WHERE r.rating = 4
ORDER BY username;

-- Associated with STUDIO TABLE
-- Expected Output: {Warner Bros.}, {David Zaslav}, {Tenet, Inception, Shazam}
SELECT 
  SUBSTR(name, 1, 20) AS name_short,
  SUBSTR(owner, 1, 20) AS owner_short,
  SUBSTR(location, 1, 20) AS location_short,
  credits
FROM Studio
WHERE location LIKE '%Burbank%';

-- Associated with AWARDS TABLE
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
SELECT DISTINCT
  SUBSTR(r.theName, 1, 15) AS "Receiver Name",
  SUBSTR(TO_CHAR(r.theDate, 'YYYY-MM-DD'), 1, 20) AS "Win Date",
  SUBSTR(a.theName, 1, 15) AS "Award Name",
  SUBSTR(a.presenter, 1, 15) AS "Presenter"
FROM Receiver r
JOIN Awards a ON r.receiver_id = a.receiver_id
-- Only want the Best Actor(s) in 2019
WHERE r.theDate >= TO_DATE('2019-01-01', 'YYYY-MM-DD');

--------------------------------------------
-- Simple VIEWs and more Advanced QUERIES --
--------------------------------------------

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













