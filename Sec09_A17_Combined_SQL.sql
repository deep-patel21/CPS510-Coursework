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







