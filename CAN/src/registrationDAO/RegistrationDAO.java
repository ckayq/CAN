package registrationDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import user.User;

public class RegistrationDAO {
	private String url = "jdbc:mysql://localhost:3306/can";
	private String user = "root";
	private String password = "";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		Connection conn = null; 
		
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;	
	}
	
	public String createUser(User user) {
		loadDriver(dbDriver);
		
		Connection conn = getConnection();
		
		String insertStmt = "INSERT INTO user VALUES(?, ?, ?, ?, ?, ?, ?)";
		String result = "Success";
		
		try {
			PreparedStatement preparedStmt = conn.prepareStatement(insertStmt);
			preparedStmt.setString(1, user.getEmail());
			preparedStmt.setString(2, user.getPhoneNumber());
			preparedStmt.setString(3, user.getFirstName());
			preparedStmt.setString(4, user.getLastName());
			preparedStmt.setString(5, "");
			preparedStmt.setDouble(6, 0);
			preparedStmt.setString(7, user.getPassword());
			
			preparedStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			result = "Fail";
		}
		
		return result;
	}
}
