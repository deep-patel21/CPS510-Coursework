CREATE TABLE Film (
  film_id NUMBER PRIMARY KEY,
  title VARCHAR2(100) NOT NULL,
  runtime NUMBER,
  release_year NUMBER, 
  director_id NUMBER,
  FOREIGN KEY (director_id) REFERENCES Director(director_id),
  cast VARCHAR2(1000) NOT NULL
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

CREATE TABLE Review (
  review_id NUMBER PRIMARY KEY, 
  used_id NUMBER, 
  film_id NUMBER, 
  description VARCHAR2(500),
  rating NUMBER, 
  date DATE,
  FOREIGN KEY (user_id) REFERENCES User(user_id),
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
  name VARCHAR2(100) NOT NULL,
  presenter VARCHAR2(100) NOT NULL,
  year NUMBER,
  winner_id NUMBER, 
  winner_type VARCHAR2(20) CHECK (winner_type IN ('Person', 'Film')),
  FOREIGN KEY (winner_id, winner_type) REFERENCES PersonFilm(person_film_id, person_film_type)
);
