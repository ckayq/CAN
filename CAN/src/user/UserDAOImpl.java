package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbConnection.ConnectionProvider;

public class UserDAOImpl implements UserDAO {

	static Connection con;
	static PreparedStatement preparedStmt;
	
	@Override
	public int insertUser(User user) {
		int status = 0;
		
		try {
			con = ConnectionProvider.getConnection();
			
			String insertStmt = "INSERT INTO user VALUES(?, ?, ?, ?, ?, ?, ?);";
			
			preparedStmt = con.prepareStatement(insertStmt);
			
			preparedStmt.setString(1, user.getEmail());
			preparedStmt.setString(2, user.getPhoneNumber());
			preparedStmt.setString(3, user.getFirstName());
			preparedStmt.setString(4, user.getLastName());
			preparedStmt.setString(5, "");
			preparedStmt.setDouble(6, 0);
			preparedStmt.setString(7, user.getPassword());
			
			status = preparedStmt.executeUpdate();
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return status;
	}

	@Override
	public User getUser(String email, String password, String firstName) {
		User user = new User();
		
		try {
			con = ConnectionProvider.getConnection();
			
			String selectStmt = "SELECT * FROM user WHERE Email_ID=? AND Password=?;";
			
			preparedStmt = con.prepareStatement(selectStmt);
			
			preparedStmt.setString(1, email);
			preparedStmt.setString(2, password);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				user.setEmail(resultSet.getString(1));
				user.setPassword(resultSet.getString(2));
				user.setFirstName(resultSet.getString(3));
			}
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return user;
	}

	@Override
	public User resetUserPassword(String email, String firstName, String lastName, String phoneNumber, String newPassword) {
		User user = new User();
		
		try {
			con = ConnectionProvider.getConnection();
			
			String selectStmt = "SELECT * FROM user WHERE Email_ID=? AND FirstName=? AND LastName=? AND PhoneNumber=?;";
			
			preparedStmt = con.prepareStatement(selectStmt);
			
			preparedStmt.setString(1, email);
			preparedStmt.setString(2, firstName);
			preparedStmt.setString(3, lastName);
			preparedStmt.setString(4, phoneNumber);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				user.setEmail(resultSet.getString(1));
				user.setFirstName(resultSet.getString(3));
				user.setLastName(resultSet.getString(4));
				user.setPhoneNumber(resultSet.getString(2));
			}
			
			String updateStmt = "UPDATE user SET Password=? WHERE Email_ID=? AND FirstName=? AND LastName=? AND PhoneNumber=?;";
			
			preparedStmt = con.prepareStatement(updateStmt);
			
			preparedStmt.setString(1, newPassword);
			preparedStmt.setString(2, email);
			preparedStmt.setString(3, firstName);
			preparedStmt.setString(4, lastName);
			preparedStmt.setString(5, phoneNumber);
			
			int result = preparedStmt.executeUpdate();
			
			if(result > 0) {
				user.setPassword(resultSet.getString(1));
			}		
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return user;
	}
}
