const oracledb = require('oracledb');

async function queries() {
  let connection;

  try {
    oracledb.initOracleClient({ libDir: "d:/instantclient_21_12" });
    connection = await oracledb.getConnection({
      user: 'dcpatel',
      password: '06210050',
      connectString: '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))',
    });

    try {
      const systemTestQuery = await connection.execute('SELECT SYSDATE FROM DUAL');
      console.log("Rows: ", systemTestQuery.rows);
      console.log(" ");
      const query1 = await connection.execute('SELECT f.title AS title, f.runtime AS RUNTIME, d.first_name || \' \' || d.last_name AS DIRECTOR_and_MOVIE FROM Film f JOIN Director d ON f.director_id = d.director_id WHERE runtime > 120 ORDER BY first_name');
      console.log(query1.rows)

    } catch (err) {
      console.log(err);
    }
   
    //res.status(200).json(result.rows);

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

queries();
