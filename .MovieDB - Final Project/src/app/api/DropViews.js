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
      DROP VIEW Film_View_without_Director; \
      DROP VIEW Actor_Notable_Works; \
      DROP VIEW Anonymous_Ratings; ");
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
