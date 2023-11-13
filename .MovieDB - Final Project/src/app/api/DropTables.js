const oracledb = require('oracledb');

async function run() {
  let connection;

  try {
    await oracledb.initOracleClient({ libDir: "d:/instantclient_21_12"});
    connection = await oracledb.getConnection({
      user: 'dcpatel',
      password: '06210050',
      connectString: '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))',
    });

    const statements = [ "DROP TABLE Actor CASCADE CONSTRAINTS",
                        "DROP TABLE Director CASCADE CONSTRAINTS",
                        "DROP TABLE Producer CASCADE CONSTRAINTS",
                        "DROP TABLE TheUser CASCADE CONSTRAINTS",
                        "DROP TABLE Studio CASCADE CONSTRAINTS",
                        "DROP TABLE Receiver CASCADE CONSTRAINTS",
                        "DROP TABLE Film CASCADE CONSTRAINTS",
                        "DROP TABLE Review CASCADE CONSTRAINTS",
                        "DROP TABLE Awards CASCADE CONSTRAINTS",
                        "DROP TABLE Actor_Acts_In_Film CASCADE CONSTRAINTS",
                        "DROP TABLE Director_Directs_Film CASCADE CONSTRAINTS",
                        "DROP TABLE Producer_Produces_Film CASCADE CONSTRAINTS",
                        "DROP TABLE Studio_Owns_Film CASCADE CONSTRAINTS",
                        "DROP TABLE Awards_Given_To_Film CASCADE CONSTRAINTS",
                        "DROP TABLE TheUser_Creates_Review CASCADE CONSTRAINTS",
                        "DROP TABLE Review_Rates_Film CASCADE CONSTRAINTS"];

    const options = {
      autoCommit: true
    }

    for (const statement of statements) {
      try {
        await connection.execute(statement);
      } catch (err) {
          console.log(err);
      }
    }

    //const result = await connection.execute(statements)
   // res.status(200).json(result.rows);

    await connection.close()
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
