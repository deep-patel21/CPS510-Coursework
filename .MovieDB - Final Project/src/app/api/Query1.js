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
      //let query2 = await connection.execute('SELECT first_name, last_name FROM Actor');
      //let query3 = await connection.execute('SELECT first_name, last_name, username, password FROM TheUser ORDER BY password');
      //let query4 = await connection.execute('SELECT a.theName, a.presenter, a.year_of_win, r.theName FROM Awards a JOIN Receiver r ON a.receiver_id = r.receiver_id WHERE a.year_of_win > 2021');
      console.log("Query Result 1:", query1.rows);
      //console.log("Query Result 2:", query2.rows);
      //console.log("Query Result 3:", query3.rows);
      //console.log("Query Result 4:", query4.rows);
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