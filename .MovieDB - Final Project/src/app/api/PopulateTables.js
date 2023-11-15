const oracledb = require('oracledb');

async function populatetables() {
  let connection;

  try {
    // oracledb.initOracleClient({ libDir: "C:/Users/pra_d/OneDrive/Desktop/Anmol/Ryerson/instantclient-basic-windows.x64-21.12.0.0.0dbru/instantclient_21_12" });
    // connection = await oracledb.getConnection({
    //  user: 'appancha',
    //  password: '11157696',
    //  connectString: '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))',
    // });

    oracledb.initOracleClient({ libDir:  "d:/instantclient_21_12"});
     connection = await oracledb.getConnection({
       user: 'dcpatel',
       password: '06210050',
       connectString: '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))',
     });


    const actorInsertStatements = [
        "INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography) VALUES (1, 'Cillian', 'Murphy', TO_DATE('1976-05-25', 'YYYY-MM-DD'), 'Irish', '28 Days Later, The Dark Knight, Oppenheimer')",
        "INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography) VALUES (2, 'Robert', 'Downey Jr.', TO_DATE('1965-04-04', 'YYYY-MM-DD'), 'American', 'Iron Man 3, Sherlock Holmes, Avengers: Endgame')",
        "INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography) VALUES (3, 'Matt', 'Damon', TO_DATE('1970-10-08', 'YYYY-MM-DD'), 'American', 'The Martian, Good Will, Hunting, Ford v Ferrari')",
        "INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography) VALUES (4, 'Arnold', 'Schwarzenegger', TO_DATE('1947-07-30', 'YYYY-MM-DD'), 'Austrian-American', 'Terminator 2: Judgement Day, The 6th Day, Last Action Hero')",
        "INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography) VALUES (5, 'Linda', 'Hamilton', TO_DATE('1956-09-26', 'YYYY-MM-DD'), 'American', 'Terminator: Dark Fate, Easy Does It, Lost Girl')",
        "INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography) VALUES (6, 'Edward', 'Furlong', TO_DATE('1977-08-02', 'YYYY-MM-DD'), 'American', 'Terminator 2: Judgement Day, The Green Hornet, Detroit Rock City')",
        "INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography) VALUES (7, 'Tom', 'Cruise', TO_DATE('1962-07-03', 'YYYY-MM-DD'), 'American', 'Top Gun: Maverick, Mission: Impossible - Dead Reckoning Part One, Jack Reacher')",
        "INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography) VALUES (8, 'Jeremy', 'Renner', TO_DATE('1971-01-07', 'YYYY-MM-DD'), 'American', 'Captain America: Civil War, Kill the Messenger, Mission: Impossible - Rogue Nation')",
        "INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography) VALUES (9, 'Simon', 'Pegg', TO_DATE('1970-02-14', 'YYYY-MM-DD'), 'British', 'The Ice Age Adventures of Buck Wild, Hot Fuzz, Mission: Impossible - Dead Reckoning Part One')",
        "INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography) VALUES (10, 'Meryl', 'Streep', TO_DATE('1949-06-22', 'YYYY-MM-DD'), 'American', 'The Devil Wears Prada, Mamma Mia!, The Iron Lady')",
        "INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography) VALUES (11, 'Leonardo', 'DiCaprio', TO_DATE('1974-11-11', 'YYYY-MM-DD'), 'American', 'Titanic, The Revenant, Inception')",
        "INSERT INTO Actor (actor_id, first_name, last_name, birthdate, nationality, filmography) VALUES (12, 'Angelina', 'Jolie', TO_DATE('1975-06-04', 'YYYY-MM-DD'), 'American', 'Tomb Raider, Maleficent, Girl, Interrupted')"];

    // Execute Actor insert statements
    for (const statement of actorInsertStatements) {
        try {
            await connection.execute(statement);
            console.log(`Data Inserted for: ${statement}`);
        } catch (err) {
            console.error(`Error inserting data: ${statement}`, err);
        }
      }
    
     // Insert statements for Director
    const directorInsertStatements = [
        "INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography) VALUES (1, 'Christopher', 'Nolan', TO_DATE('1970-07-30', 'YYYY-MM-DD'), 'British-American', 'Tenet, Interstellar, Inception')",
        "INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography) VALUES (2, 'James', 'Cameron', TO_DATE('1954-08-16', 'YYYY-MM-DD'), 'Canadian-American', 'Titanic, Avatar: The Way of Water, Terminator 2: Judgement Day')",
        "INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography) VALUES (3, 'Brad', 'Bird', TO_DATE('1957-09-24', 'YYYY-MM-DD'), 'American', 'The Incredibles, Ratatouille, Cars')",
        "INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography) VALUES (4, 'Alfonso', 'Cuaron', TO_DATE('1961-11-08', 'YYYY-MM-DD'), 'Mexican', 'Gravity, Roma, A Little Princess')",
        "INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography) VALUES (5, 'Quentin', 'Tarantino', TO_DATE('1963-03-27', 'YYYY-MM-DD'), 'American', 'Pulp Fiction, Kill Bill, Django Unchained')",
        "INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography) VALUES (6, 'Steven', 'Spielberg', TO_DATE('1946-12-18', 'YYYY-MM-DD'), 'American', 'Jurassic Park, E.T. the Extra-Terrestrial, Schindler''s List')",
        "INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography) VALUES (7, 'Lana', 'Wachowski', TO_DATE('1965-06-21', 'YYYY-MM-DD'), 'American', 'The Matrix, Cloud Atlas, Sense8')",
        "INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography) VALUES (8, 'Robert', 'Zemeckis', TO_DATE('1951-05-14', 'YYYY-MM-DD'), 'American', 'Forrest Gump, Back to the Future, Cast Away')",
        "INSERT INTO Director (director_id, first_name, last_name, birthdate, nationality, filmography) VALUES (9, 'Frank', 'Darabont', TO_DATE('1959-01-28', 'YYYY-MM-DD'), 'American', 'The Shawshank Redemption, The Green Mile, The Mist')",
      ];

       // Execute Director insert statements
       for (const statement of directorInsertStatements) {
        try {
            await connection.execute(statement);
            console.log(`Data Inserted for: ${statement}`);
        } catch (err) {
            console.error(`Error inserting data: ${statement}`, err);
        }
      }

       // Insert statements for Producer
    const producerInsertStatements = [
        "INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography) VALUES (1, 'Emma', 'Thomas', TO_DATE('1971-12-09', 'YYYY-MM-DD'), 'British', 'Inception, Interstellar, Dunkirk')",
        "INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography) VALUES (2, 'Edward', 'Furlong', TO_DATE('1977-08-02', 'YYYY-MM-DD'), 'American', 'Living & Dying, Heart of a Champion, Matt''s Chance')",
        "INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography) VALUES (3, 'Bryan', 'Burk', TO_DATE('1968-12-30', 'YYYY-MM-DD'), 'American', 'Mission: Impossible - Rogue Nation, Star Trek Into Darkness, The Cloverfield Paradox')",
        "INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography) VALUES (4, 'Kathleen', 'Kennedy', TO_DATE('1953-06-05', 'YYYY-MM-DD'), 'American', 'Jurassic Park, E.T. the Extra-Terrestrial, Star Wars: The Force Awakens')",
        "INSERT INTO Producer (producer_id, first_name, last_name, birthdate, nationality, filmography) VALUES (5, 'Jerry', 'Bruckheimer', TO_DATE('1945-09-21', 'YYYY-MM-DD'), 'American', 'Pirates of the Caribbean, Top Gun, Armageddon')",
      ];

        // Execute Producer insert statements
        for (const statement of producerInsertStatements) {
            try {
                await connection.execute(statement);
                console.log(`Data Inserted for: ${statement}`);
            } catch (err) {
                console.error(`Error inserting data: ${statement}`, err);
            }
          }

      // Insert statements for TheUser
    const userInsertStatements = [
        "INSERT INTO TheUser(user_id, first_name, last_name, username, email, password) VALUES (1, 'Anmol', 'Panchal', 'IwasHuman', 'anmol.panchal@torontomu.ca', 'Admin1')",
        "INSERT INTO TheUser(user_id, first_name, last_name, username, email, password) VALUES (2, 'Deep', 'Patel', 'Deep Studios', 'deep.c.patel@torontomu.ca', 'Admin2')",
        "INSERT INTO TheUser(user_id, first_name, last_name, username, email, password) VALUES (3, 'Aryan', 'Patel', 'Rayna', 'aryan.patel@torontomu.ca', 'Admin3')",
        "INSERT INTO TheUser(user_id, first_name, last_name, username, email, password) VALUES (4, 'John', 'Doe', 'JohnDoe123', 'john.doe@gmail.com', 'ilovemovies')",
        "INSERT INTO TheUser(user_id, first_name, last_name, username, email, password) VALUES (5, 'Emma', 'Smithson', 'harrypotterfan450', 'emma.smithson@gmail.com', 'voldemortthedark')",
        "INSERT INTO TheUser(user_id, first_name, last_name, username, email, password) VALUES (6, 'Daniel', 'Mosfet', '007Lover', 'daniel.mosfet@007.com', '007SecretAgent')",
        "INSERT INTO TheUser(user_id, first_name, last_name, username, email, password) VALUES (7, 'System', 'Admin', 'AdminSir', 'sytem_admin@dbms.com', 'AdminMaster')",
      ];

        // Execute TheUser insert statements
        for (const statement of userInsertStatements) {
            try {
                await connection.execute(statement);
                console.log(`Data Inserted for: ${statement}`);
            } catch (err) {
                console.error(`Error inserting data: ${statement}`, err);
            }
          }
  
      // Insert statements for Studio
    const studioInsertStatements = [
        "INSERT INTO Studio(studio_id, name, owner, location, credits) VALUES (1, 'Universal Studios', 'Mark Woodbury', 'Universal City, California', 'Fast X, The Super Mario Bros, Jurrasic World: Dominion')",
        "INSERT INTO Studio(studio_id, name, owner, location, credits) VALUES (2, 'Warner Bros', 'David Zaslav', 'Burbank, California', 'Tenet, Inception, Shazam')",
        "INSERT INTO Studio(studio_id, name, owner, location, credits) VALUES (3, 'Paramount Pictures', 'Brian Robbins', 'Los Angeles, California', 'Scream, Shrek Forever After, Top Gun: Maverick')",
        "INSERT INTO Studio(studio_id, name, owner, location, credits) VALUES (4, 'Sony Pictures Entertainment', 'Tony Vinciquerra', 'Culver City, California', 'Spider-Man: No Way Home, Venom: Let There Be Carnage, Ghostbusters: Afterlife')",
        "INSERT INTO Studio(studio_id, name, owner, location, credits) VALUES (5, '20th Century Studios', 'Dana Walden', 'Century City, California', 'Deadpool, The Martian, Logan')",
        "INSERT INTO Studio(studio_id, name, owner, location, credits) VALUES (6, 'New Line Cinema', 'Ann Sarnoff', 'Burbank, California', 'The Lord of the Rings: The Fellowship of the Ring, A Nightmare on Elm Street, The Conjuring')",
      ];

      // Execute Studio insert statements
      for (const statement of studioInsertStatements) {
        try {
            await connection.execute(statement);
            console.log(`Data Inserted for: ${statement}`);
        } catch (err) {
            console.error(`Error inserting data: ${statement}`, err);
        }
      }

      // Insert statements for Receiver
    const receiverInsertStatements = [
        "INSERT INTO Receiver(receiver_id, theName, theDate) VALUES (1, 'Harry Potter and The Philosopher''s Stone', TO_DATE('2018-03-13', 'YYYY-MM-DD'))",
        "INSERT INTO Receiver(receiver_id, theName, theDate) VALUES (2, 'Steve Hamilton', TO_DATE('2019-05-18', 'YYYY-MM-DD'))",
        "INSERT INTO Receiver(receiver_id, theName, theDate) VALUES (3, 'Dwayne Johnson', TO_DATE('2012-01-11', 'YYYY-MM-DD'))",
        "INSERT INTO Receiver(receiver_id, theName, theDate) VALUES (4, 'Interstellar', TO_DATE('2023-02-17', 'YYYY-MM-DD'))",
        "INSERT INTO Receiver(receiver_id, theName, theDate) VALUES (5, 'Inception', TO_DATE('2010-07-08', 'YYYY-MM-DD'))",
        "INSERT INTO Receiver(receiver_id, theName, theDate) VALUES (6, 'Jodie Foster', TO_DATE('2013-03-02', 'YYYY-MM-DD'))",
      ];

       // Execute Receiver insert statements
       for (const statement of receiverInsertStatements) {
        try {
            await connection.execute(statement);
            console.log(`Data Inserted for: ${statement}`);
        } catch (err) {
            console.error(`Error inserting data: ${statement}`, err);
        }
      }

      // Insert statements for Film
    const filmInsertStatements = [
        "INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast) VALUES (1, 'Oppenheimer', 180, 2023, 1, 'Cillian Murphy, Robert Downey Jr., Matt Damon')",
        "INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast) VALUES (2, 'Terminator 2: Judgement Day', 137, 1991, 2, 'Arnold Schwarznegger, Linda Hamilton, Edward Furlong')",
        "INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast) VALUES (3, 'Mission: Impossible - Ghost Protocol', 172, 2011, 3, 'Tom Cruise, Jeremy Renner, Simon Pegg')",
        "INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast) VALUES (4, 'Harry Potter and The Prizoner of Azkaban', 139, 2004, 4, 'Daniel Radcliffe, Rupert Grint, Emma Watson')",
        "INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast) VALUES (5, 'Dunkirk', 106, 2017, 1, 'Tom Hardy, Cillian Murphy, Harry Styles')",
        "INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast) VALUES (6, 'Pulp Fiction', 154, 1994, 5, 'John Travolta, Samuel L. Jackson, Uma Thurman')",
        "INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast) VALUES (7, 'Jurassic Park', 127, 1993, 6, 'Sam Neill, Laura Dern, Jeff Goldblum')",
        "INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast) VALUES (8, 'The Matrix', 136, 1999, 8, 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss')",
        "INSERT INTO Film(film_id, title, runtime, release_year, director_id, theCast) VALUES (9, 'Forrest Gump', 142, 1994, 9, 'Tom Hanks, Robin Wright, Gary Sinise')",
      ];

      // Execute Film insert statements
      for (const statement of filmInsertStatements) {
        try {
            await connection.execute(statement);
            console.log(`Data Inserted for: ${statement}`);
        } catch (err) {
            console.error(`Error inserting data: ${statement}`, err);
        }
      }

      // Insert statements for Awards
    const awardsInsertStatements = [
        "INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type) VALUES (1, 'Best Film', 'Academy Awards', '2022', 1, 'Film')",
        "INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type) VALUES (2, 'Best Actor', 'Oscars Ceremony', '2023', 2, 'Person')",
        "INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type) VALUES (3, 'Best Director', 'Academy Awards', '2014', 3, 'Person')",
        "INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type) VALUES (4, 'Best Actress', 'Academy Awards', '2018', 2, 'Person')",
        "INSERT INTO Awards(award_id, theName, presenter, year_of_win, receiver_id, winner_type) VALUES (5, 'Best Original Score', 'Grammy Awards', '2022', 1, 'Film')",
      ];

      // Execute Awards insert statements
      for (const statement of awardsInsertStatements) {
        try {
            await connection.execute(statement);
            console.log(`Data Inserted for: ${statement}`);
        } catch (err) {
            console.error(`Error inserting data: ${statement}`, err);
        }
      }
       // Insert statements for Review
    const reviewInsertStatements = [
        "INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate) VALUES (1, 3, 2, 'This movie was action-packed with my favorite action hero Arnold!', 4, TO_DATE('2023-07-03', 'YYYY-MM-DD'))",
        "INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate) VALUES (2, 2, 3, 'The iconic run of Tom Cruise made this movie epic to watch.', 4, TO_DATE('2023-05-16', 'YYYY-MM-DD'))",
        "INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate) VALUES (3, 1, 1, 'Amazing cinematics from Nolan once again. Pristine performance!', 5, TO_DATE('2023-06-21', 'YYYY-MM-DD'))",
        "INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate) VALUES (4, 4, 6, 'An unforgettable cinematic experience! Tarantino''s masterpiece.', 5, TO_DATE('2023-09-12', 'YYYY-MM-DD'))",
        "INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate) VALUES (5, 5, 7, 'A thrilling adventure with dinosaurs! Spielberg''s classic.', 4, TO_DATE('2023-08-21', 'YYYY-MM-DD'))",
        "INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate) VALUES (6, 6, 5, 'Dunkirk is a masterpiece! Nolan''s direction is beyond excellence.', 5, TO_DATE('2023-07-30', 'YYYY-MM-DD'))",
        "INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate) VALUES (7, 7, 8, 'Forrest Gump is a heartwarming journey of life. Tom Hanks nailed it!', 5, TO_DATE('2023-05-03', 'YYYY-MM-DD'))",
        "INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate) VALUES (8, 1, 9, 'The Matrix revolutionized the sci-fi genre. Keanu Reeves is iconic!', 5, TO_DATE('2023-08-15', 'YYYY-MM-DD'))",
        "INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate) VALUES (9, 2, 4, 'Harry Potter and The Prizoner of Azkaban is magical! A must-watch.', 4, TO_DATE('2023-06-02', 'YYYY-MM-DD'))",
        "INSERT INTO Review(review_id, user_id, film_id, theDescription, rating, theDate) VALUES (10, 3, 3, 'Mission: Impossible - Ghost Protocol is a rollercoaster of action!', 4, TO_DATE('2023-09-25', 'YYYY-MM-DD'))",
        ];

    // Execute Review insert statements
    for (const statement of reviewInsertStatements) {
        try {
            await connection.execute(statement);
            console.log(`Data Inserted for: ${statement}`);
        } catch (err) {
            console.error(`Error inserting data: ${statement}`, err);
        }
      }

    await connection.execute("COMMIT")
    //res.status(200).json(result.rows); */
  } catch (err) {
    console.error(err);
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error(err);
      }
    }
  }
}

populatetables();

module.exports = populatetables;