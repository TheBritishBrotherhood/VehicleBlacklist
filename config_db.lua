--[ If you dont want to use MYSQL-ASYNC just change the driver to "none" as shown below]

db = {
    --driver = "none", << Like this.
	driver = "mysql-async",

	
	sql_host = "127.0.0.1",
	sql_database = "your-database-here",
	sql_user = "root",
	sql_password = "password"
}
