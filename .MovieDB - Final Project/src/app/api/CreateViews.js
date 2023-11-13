const oracledb = require('oracledb');

async function run() {
  let connection;

  try {
    connection = await oracledb.getConnection({
      user: 'dcpatel',
      password: '06210050',
      connectString: 'dcpatel/06210050@oracle.scs.ryerson.ca:1521/orcl',
    });

    const result = await connection.execute(" \
      CREATE VIEW Film_View_without_Director AS \
      SELECT title, runtime, release_year, theCast \
      FROM Film \
      WHERE release_year > 2003; \
      CREATE VIEW Actor_Notable_Works AS \
      SELECT first_name, last_name, filmography \
      FROM Actor \
      WHERE EXTRACT(YEAR FROM birthdate) > 1969; \
      CREATE VIEW Anonymous_Ratings AS \
      SELECT film_id, theDescription, rating, theDate \
      FROM Review; \ ");
    res.status(200).json(result.rows);

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

run();
