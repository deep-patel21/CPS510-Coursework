const oracledb = require('oracledb');

async function droptables() {
  let connection;

  try {
    
    // oracledb.initOracleClient({ libDir: "C:/Users/pra_d/OneDrive/Desktop/Anmol/Ryerson/instantclient-basic-windows.x64-21.12.0.0.0dbru/instantclient_21_12" });
    // connection = await oracledb.getConnection({
    //   user: 'appancha',
    //   password: '11157696',
    //   connectString: '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))',
    // }); 

     oracledb.initOracleClient({ libDir:  "d:/instantclient_21_12"});
     connection = await oracledb.getConnection({
       user: 'dcpatel',
       password: '06210050',
       connectString: '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))',
     });

    const dropTableStatements = ["DROP TABLE Actor CASCADE CONSTRAINTS",
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

    for (const statement of dropTableStatements) {
      try {
        await connection.execute(statement);
        console.log(`Table dropped: ${statement}`);
      } catch (err) {
        console.error(`Error dropping table: ${statement}`, err);
      }
    }

    console.log("All tables dropped successfully.")

    //const result = await connection.execute(statements)
    // res.status(200).json(result.rows);
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

droptables();

module.exports = droptables