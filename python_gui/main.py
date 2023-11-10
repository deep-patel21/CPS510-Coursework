import cx_Oracle
from Frontend.app import FRONTEND

if __name__ == "__main__":
    cx_Oracle.init_oracle_client(lib_dir="d:\instantclient_21_12")
    Frontend = FRONTEND()
    Frontend.createMainWindow()