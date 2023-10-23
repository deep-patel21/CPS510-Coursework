
#!/bin/bash
sqlplus64 "dcpatel/06210050@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF


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




INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (1, 'Christopher', 'Nolan', TO_DATE('1970-07-30', 'YYYY-MM-DD'), 'British-American', 'Tenet, Interstellar, Inception');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (2, 'James', 'Cameron', TO_DATE('1954-08-16', 'YYYY-MM-DD'), 'Canadian-American', 'Titanic, Avatar: The Way of Water, Terminator 2: Judgement Day');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (3, 'Brad', 'Bird', TO_DATE('1957-09-24', 'YYYY-MM-DD'), 'American', 'The Incredibles, Ratatouille, Cars');

INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (4, 'Alfonso', 'Cuaron', TO_DATE('1961-11-08', 'YYYY-MM-DD'), 'Mexican', 'Gravity, Roma, A Little Princess');





INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (1, 'Emma', 'Thomas', TO_DATE('1971-12-09', 'YYYY-MM-DD'), 'British', 'Inception, Interstellar, Dunkirk');

INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (2, 'Edward', 'Furlong', TO_DATE('1977-08-02', 'YYYY-MM-DD'), 'American', 'Living & Dying, Heart of a Champion, Matt''s Chance');

INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography)
VALUES (3, 'Bryan', 'Burk', TO_DATE('1968-12-30', 'YYYY-MM-DD'), 'American', 'Mission: Impossible - Rogue Nation, Star Trek Into Darkness, The Cloverfield Paradox');





INSERT INTO TheUser(user_id, first_name, last_name, username, email, password)
VALUES (1, 'Anmol', 'Panchal', 'IwasHuman', 'anmol.panchal@torontomu.ca', 'Admin1');

INSERT INTO TheUser(user_id, first_name, last_name, username, email, password)
VALUES (2, 'Deep', 'Patel', 'Deep Studios', 'deep.c.patel@torontomu.ca', 'Admin2');

INSERT INTO TheUser(user_id, first_name, last_name, username, email, password)
VALUES (3, 'Aryan', 'Patel', 'Rayna', 'aryan.patel@torontomu.ca', 'Admin3');

INSERT INTO TheUser(user_id, first_name, last_name, username, email, password)
VALUES (4, 'John', 'Doe', 'JohnDoe123', 'john.doe@gmail.com', 'ilovemovies');




INSERT INTO Studio(studio_id, name, owner, location, credits)
VALUES (1, 'Universal Studios', 'Mark Woodbury', 'Universal City, California', 'Fast X, The Super Mario Bros, Jurrasic World: Dominion');

INSERT INTO Studio(studio_id, name, owner, location, credits)
VALUES (2, 'Warner Bros', 'David Zaslav', 'Burbank, California', 'Tenet, Inception, Shazam');

INSERT INTO Studio(studio_id, name, owner, location, credits)
VALUES (3, 'Paramount Pictures', 'Brian Robbins', 'Los Angeles, California', 'Scream, Shrek Forever After, Top Gun: Maverick');






INSERT INTO Receiver(receiver_id, theName, theDate)
VALUES (1, 'Harry Potter and The Philosopher''s Stone', TO_DATE('2018-03-13', 'YYYY-MM-DD'));

INSERT INTO Receiver(receiver_id, theName, theDate)
VALUES (2, 'Steve Hamilton', TO_DATE('2019-05-18', 'YYYY-MM-DD'));

INSERT INTO Receiver(receiver_id, theName, theDate)
VALUES (3, 'Dwayne Johnson', TO_DATE('2012-01-11', 'YYYY-MM-DD'));

INSERT INTO Receiver(receiver_id, theName, theDate)
VALUES (4, 'Interstellar', TO_DATE('2023-02-17', 'YYYY-MM-DD'));





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





INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type)
VALUES (1, 'Best Film', 'Academy Awards', '2022', 1, 'Film');

INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type)
VALUES (2, 'Best Actor', 'Oscars Ceremony', '2023', 2, 'Person');

INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type)
VALUES (3, 'Best Director', 'Academy Awards', '2014', 3, 'Person');





INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate)
VALUES (1, 3, 2, 'This movie was action packed with my favorite action hero Arnold!', 4, TO_DATE('2023-07-03', 'YYYY-MM-DD'));

INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate)
VALUES (2, 2, 3, 'The iconic run of Tom Cruise made this movie epic to watch.', 4, TO_DATE('2023-05-16', 'YYYY-MM-DD'));

INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate)
VALUES (3, 1, 1, 'Amazing cinematics from Nolan once again. Pristine performance!.', 5, TO_DATE('2023-06-21', 'YYYY-MM-DD'));

exit
EOF
