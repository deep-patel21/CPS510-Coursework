const oracledb = require('oracledb');

async function run() {
  let connection;

  try {
    connection = await oracledb.getConnection({
      user: 'dcpatel',
      password: '06210050',
      connectString: 'dcpatel/06210050@oracle.scs.ryerson.ca:1521/orcl',
    });

    const result = await connection.execute('SELECT * FROM Film');
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
