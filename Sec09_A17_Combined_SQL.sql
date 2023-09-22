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
  cast VARCHAR2(1000)
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

CREATE TABLE User (
  user_id NUMBER PRIMARY KEY, 
  first_name VARCHAR2(50) NOT NULL, 
  last_name VARCHAR2(50) NOT NULL, 
  username VARCHAR2(50) UNIQUE NOT NULL,
  email VARCHAR2(100) UNIQUE NOT NULL, 
  password VARCHAR2(100) NOT NULL
);

CREATE TABLE Awards (
  award_id NUMBER PRIMARY KEY, 
  name VARCHAR2(100) NOT NULL,
  presenter VARCHAR2(100) NOT NULL,
  year NUMBER,
  winner_id NUMBER, 
  winner_type VARCHAR2(20) CHECK (winner_type IN ('Person', 'Film')),
  FOREIGN KEY (winner_id, winner_type) REFERENCES PersonFilm(person_film_id, person_film_type)
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

CREATE TABLE User_Creates_Review (
    user_id NUMBER NOT NULL,
    review_id NUMBER NOT NULL,
    PRIMARY KEY (user_id, review_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
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

----------------------------
-- Update Values in Table --
----------------------------

-- Insert Details into Movie Table
INSERT INTO Movie (movie_id, title, runtime, release_year, director_id, cast)
VALUES (1, 'Oppenheimer', 180, 2023, 1, 'Cillian Murphy, Robert Downey Jr., Matt Damon');

INSERT INTO Movie (movie_id, title, runtime, release_year, director_id, cast)
VALUES (2, 'Terminator 2: Judgement Day', 137, 1991, 2, 'Arnold Schwarznegger, Linda Hamilton, Edward Furlong');

INSERT INTO Movie (movie_id, title, runtime, release_year, director_id, cast)
VALUES (3, 'Mission: Impossible - Ghost Protocol', 172, 2011, 3, 'Tom Cruise, Jeremy Renner, Simon Pegg');

-- Insert Details into Actor Table
INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (1, 'Cillian', 'Murphy', TO_DATE('1976-05-25', 'YYYY-MM-DD'), 'Irish', '28 Days Later, The Dark Night, Oppenheimer');

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


-- Insert Details into Director Table
INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (1, 'Christopher', 'Nolan', TO_DATE('1970-07-30', 'YYYY-MM-DD'), 'British-American', 'Tenet, Interstellar, Inception');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (2, 'James', 'Cameron', TO_DATE('1954-08-16', 'YYYY-MM-DD'), 'Canadian-American', 'Titanic, Avatatr: The Way of Water, Terminator 2: Judgement Day');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (3, 'Brad', 'Bird', TO_DATE('1957-09-24', 'YYYY-MM-DD'), 'American', 'The Incredibles, Ratatouille, Cars');

-- Insert Details into Producer Table
INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (1, 'Emma', 'Thomas', TO_DATE('1971-12-09', 'YYYY-MM-DD'), 'British', 'Inception, Interstellar, Dunkirk');

INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (2, 'Edward', 'Furlong', TO_DATE('1977-08-02', 'YYYY-MM-DD'), 'American', 'Living & Dying, Heart of a Champion, Matt''s Chance');

INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (3, 'Bryan', 'Burk', TO_DATE('1968-12-30', 'YYYY-MM-DD'), 'American', 'Mission: Impossible - Rogue Nation, Star Trek Into Darkness, The Cloverfield Paradox');











