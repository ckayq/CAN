package dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider implements DbConnection {
	static Connection con = null;
	
	public static Connection getConnection() {
		try {
			Class.forName(dbDriver);
			
			con = DriverManager.getConnection(url, user, password);
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return con;
	}
}
