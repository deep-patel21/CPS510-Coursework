const oracledb = require('oracledb');

async function dropviews() {
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

    const dropViewStatements = ["DROP VIEW Film_View_without_Director",
                                "DROP VIEW Actor_Notable_Works",
                                "DROP VIEW Anonymous_Ratings"];

    
    for (const statement of dropViewStatements) {
      try {
        await connection.execute(statement);
        console.log(`View Dropped: ${statement}`);
      } catch (err) {
        console.error(`Error Dropping View: ${statement}`, err);
      }
    }

    console.log("All views dropped successfully.")

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

dropviews();

module.exports = dropviews;