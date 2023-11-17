const oracledb = require('oracledb');

async function query3() {
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
      let query3 = await connection.execute('SELECT first_name, last_name, username, password FROM TheUser ORDER BY password');
      console.log("Query Result 3:", query3.rows);
      return query3.rows;
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

query3();

module.exports = query3;
