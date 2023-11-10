import cx_Oracle

class create_tables:

    def __init__(self):
        dsn = cx_Oracle.makedsn('oracle.scs.ryerson.ca', '1521', 'orcl')
        #Password hidden since the repository is public
        self.conn = cx_Oracle.connect(user=r'dcpatel', password='samplepassword', dsn=dsn)

    def run(self):
        c = self.conn.cursor()
        try:
            commands = """
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

"""
            for command in commands.replace('\n','').replace('    ','').split(';'):
                if command != '':
                    c.execute(command)

            self.conn.commit()
            self.conn.close()
            #columns = [col[0] for col in c.description]
            #rows = [[cell for cell in row] for row in c]
        except Exception as e:
            error_obj, = e.args
            self.conn.rollback()
            self.conn.close()
            return ("Error: " + error_obj.message)
        return "Successfully created all 16 tables"