const oracledb = require('oracledb');

async function query1() {
  let connection;

  try {
    // oracledb.initOracleClient({ libDir: "C:/Users/pra_d/OneDrive/Desktop/Anmol/Ryerson/instantclient-basic-windows.x64-21.12.0.0.0dbru/instantclient_21_12" });
    // connection = await oracledb.getConnection({
    //   user: 'appancha',
    //   password: '11157696',
    //   connectString: '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))',
    // });

    oracledb.initOracleClient({ libDir: "d:/instantclient_21_12" });
    connection = await oracledb.getConnection({
      user: 'dcpatel',
      password: '06210050',
      connectString: '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))',
    });

    try {
      const systemTestQuery = await connection.execute('SELECT SYSDATE FROM DUAL');
      console.log(" ");

      console.log("Rows: ", systemTestQuery.rows);
      let query1 = await connection.execute('SELECT f.title AS title, d.first_name || \' \' || d.last_name AS DIRECTOR_and_MOVIE FROM Film f JOIN Director d ON f.director_id = d.director_id ORDER BY first_name');
      console.log("Query Result 1:", query1.rows);
      return query1.rows;

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

query1();

module.exports = query1;