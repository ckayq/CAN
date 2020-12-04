package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import dbConnection.ConnectionProvider;
import post.Post;

public class UserDAOImpl implements UserDAO {

	static Connection con;
	static PreparedStatement preparedStmt;
	
	@Override
	public int insertUser(User user) {
		int status = 0;
		
		try {
			con = ConnectionProvider.getConnection();
			
			String insertStmt = "INSERT INTO user VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);";
			
			preparedStmt = con.prepareStatement(insertStmt);
			
			preparedStmt.setString(1, user.getEmail());
			preparedStmt.setString(2, user.getPhoneNumber());
			preparedStmt.setString(3, user.getFirstName());
			preparedStmt.setString(4, user.getLastName());
			preparedStmt.setString(5, "This user has not set a bio");
			preparedStmt.setDouble(6, 0);
			preparedStmt.setString(7, "Default");
			preparedStmt.setString(8, user.getPassword());
			preparedStmt.setString(9, "images/default.jpg");
			
			status = preparedStmt.executeUpdate();
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return status;
	}
	
	@Override
	public User getUser(String email, String password, String firstName, String lastName, double coins, String bio) {
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
				user.setPhoneNumber(resultSet.getString(2));
				user.setFirstName(resultSet.getString(3));
				user.setLastName(resultSet.getString(4));
				user.setBio(resultSet.getString(5));
				user.setCoins(Double.parseDouble(resultSet.getString(6)));
				user.setPassword(resultSet.getString(7));
			}
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return user;
	}
	
	@Override
	public String getUserFirstName(String email) {
		User user = new User();
		
		String firstName = "";
		
		try {
			con = ConnectionProvider.getConnection();
			
			String selectStmt = "SELECT FirstName FROM user WHERE Email_ID=?;";
			
			preparedStmt = con.prepareStatement(selectStmt);
			
			preparedStmt.setString(1, email);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				user.setFirstName(resultSet.getString(1));
			}
			
			firstName = user.getFirstName();
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return firstName;
	}
	
	@Override
	public String getUserLastName(String email) {
		User user = new User();
		
		String lastName = "";
		
		try {
			con = ConnectionProvider.getConnection();
			
			String selectStmt = "SELECT LastName FROM user WHERE Email_ID=?;";
			
			preparedStmt = con.prepareStatement(selectStmt);
			
			preparedStmt.setString(1, email);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				user.setLastName(resultSet.getString(1));
			}
			
			lastName = user.getLastName();
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return lastName;
	}
	
	@Override
	public String getUserCoins(String email) {
		User user = new User();
		
		double coins = 0;
		String fmtCoins = "";
		
		try {
			con = ConnectionProvider.getConnection();
			
			String selectStmt = "SELECT Coins FROM user WHERE Email_ID=?;";
			
			preparedStmt = con.prepareStatement(selectStmt);
			
			preparedStmt.setString(1, email);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				user.setCoins(Double.parseDouble(resultSet.getString(1)));
			}
			
			coins = user.getCoins();
			
			fmtCoins = String.valueOf(coins);
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return fmtCoins;
	}
	
	@Override
	public String getUserStatus(String email) {
		User user = new User();
		
		String status = "";
		
		
		try {
			con = ConnectionProvider.getConnection();
			
			String selectStmt = "SELECT Status FROM user WHERE Email_ID=?;";
			
			preparedStmt = con.prepareStatement(selectStmt);
			
			preparedStmt.setString(1, email);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				user.setStatus(resultSet.getString(1));
			}
			
			status = user.getStatus();
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return status;
	}
	
	@Override
	public User getUserBio(String email) {
		User user = new User();
		
		try {
			con = ConnectionProvider.getConnection();
			
			String selectStmt = "SELECT Bio FROM user WHERE Email_ID=?;";
			
			preparedStmt = con.prepareStatement(selectStmt);
			
			preparedStmt.setString(1, email);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				user.setBio(resultSet.getString(1));
			}
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}

		return user;
	}
	
	@Override
	public User getUserPhoneNumber(String email) {
		User user = new User();
		
		try {
			con = ConnectionProvider.getConnection();
			
			String selectStmt = "SELECT PhoneNumber FROM user WHERE Email_ID=?;";
			
			preparedStmt = con.prepareStatement(selectStmt);
			
			preparedStmt.setString(1, email);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				user.setPhoneNumber(resultSet.getString(1));
			}
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return user;
	}
	
	// Getting all the user's posts
	@Override
	public List<Post> getUserPosts(String email) {
		List<Post> postList = new ArrayList<>();
		
		try {
			con = ConnectionProvider.getConnection();
			
			String getStmt = "SELECT * FROM post WHERE Email_ID=? ORDER BY CreationDate DESC;";
			
			preparedStmt = con.prepareStatement(getStmt);
			
			preparedStmt.setString(1, email);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				int postID = resultSet.getInt("PostID");
				String postAuthorEmail = resultSet.getString("Email_ID");
				Timestamp postCreationDate = resultSet.getTimestamp("CreationDate");
				String postTitle = resultSet.getString("PostTitle");
				String postBody = resultSet.getString("PostBody");
				
				Post post = new Post(postID, postAuthorEmail, postCreationDate, postTitle, postBody);
				
				postList.add(post);
			}
			
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return postList;
	}
	
	@Override
	public User userBuysStatus(String email, int statusID, int statusPrice, String statusURL, double userCoins) {
		User user = new User();
		
		try {
			con = ConnectionProvider.getConnection();
			
			String fmtEmail = email.trim();
			String userStatus = "";
			int checkUserStatus = 0;
			
			String checkStmt = "SELECT * FROM user_buys_product WHERE ProductID=? AND Email_ID=?;";
			
			preparedStmt = con.prepareStatement(checkStmt);
			
			preparedStmt.setInt(1, statusID);
			preparedStmt.setString(2, fmtEmail);
			
			ResultSet isBought = preparedStmt.executeQuery();
			
			int count = 0;
			
			while(isBought.next()) {
				count = isBought.getInt(1);
			} 
			
			if(count == 0) {
				String checkedStmt = "SELECT ProductID FROM user_buys_product WHERE Email_ID=?;";
				
				preparedStmt = con.prepareStatement(checkedStmt);
				
				preparedStmt.setString(1, email);
				
				ResultSet resultSet = preparedStmt.executeQuery();
				
				while(resultSet.next()) {
					user.setProductID(resultSet.getInt(1));
					
					checkUserStatus = user.getProductID();
				}
				if(statusID > checkUserStatus) {
				String insertStmt = "INSERT INTO user_buys_product(ProductID, UnitPrice, ImageURL, Email_ID) VALUES(?, ?, ?, ?);";
				
				preparedStmt = con.prepareStatement(insertStmt);
				
				preparedStmt.setInt(1, statusID);
				preparedStmt.setInt(2, statusPrice);
				preparedStmt.setString(3, statusURL);
				preparedStmt.setString(4, fmtEmail);
				
				preparedStmt.executeUpdate();
				
				String selectStmt = "SELECT ProductName FROM product WHERE ProductID=?;";
				
				preparedStmt = con.prepareStatement(selectStmt);
				
				preparedStmt.setInt(1, statusID);
				
				resultSet = preparedStmt.executeQuery();
				
				while(resultSet.next()) {
					user.setStatus(resultSet.getString(1));
					
					userStatus = user.getStatus();
				}
				
				String updateStmt = "UPDATE user SET Coins=?, Status=? WHERE Email_ID=?;";
				
				double updatedUserCoins = userCoins - statusPrice;
				
				preparedStmt = con.prepareStatement(updateStmt);
				
				preparedStmt.setDouble(1, updatedUserCoins);
				preparedStmt.setString(2, userStatus);
				preparedStmt.setString(3, fmtEmail);
				
				int result = preparedStmt.executeUpdate();
				
				if(result > 0) {
					user.setStatus(userStatus);
					System.out.println("User purchased " + userStatus + " status!");
				}
			} else {
				System.out.println("User already has this status!");
				return null;
			}
			}
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return user;
	}

	@Override
	public User userBuysAvatar(String email, int avatarID, int avatarPrice, String avatarURL, double userCoins) {
		User user = new User();
		
		try {
			con = ConnectionProvider.getConnection();
			
			String fmtEmail = email.trim();
			
			String checkStmt = "SELECT * FROM user_buys_product WHERE ProductID=? AND Email_ID=?;";
			
			preparedStmt = con.prepareStatement(checkStmt);
			
			preparedStmt.setInt(1, avatarID);
			preparedStmt.setString(2, fmtEmail);
			
			ResultSet isBought = preparedStmt.executeQuery();
			
			int count = 0;
			
			while(isBought.next()) {
				count = isBought.getInt(1);
			} 
			
			if(count == 0) {
				String insertStmt = "INSERT INTO user_buys_product(ProductID, UnitPrice, ImageURL, Email_ID) VALUES(?, ?, ?, ?);";
				
				preparedStmt = con.prepareStatement(insertStmt);
				
				preparedStmt.setInt(1, avatarID);
				preparedStmt.setInt(2, avatarPrice);
				preparedStmt.setString(3, avatarURL);
				preparedStmt.setString(4, fmtEmail);
				
				preparedStmt.executeUpdate();
				
				String updateStmt = "UPDATE user SET Coins=? WHERE Email_ID=?;";
				
				double updatedUserCoins = userCoins - avatarPrice;
				
				preparedStmt = con.prepareStatement(updateStmt);
				
				preparedStmt.setDouble(1, updatedUserCoins);
				preparedStmt.setString(2, fmtEmail);
				
				int result = preparedStmt.executeUpdate();
				
				if(result > 0) {
					System.out.println("User purchased an avatar!");
				}
			} else {
				System.out.println("User already has this avatar!");
				return null;
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
				user.setPhoneNumber(resultSet.getString(2));
				user.setFirstName(resultSet.getString(3));
				user.setLastName(resultSet.getString(4));
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
	@Override
	public User updateAccountDetails(String email, String firstName, String lastName, String phoneNumber, String bio,String newPassword, String imageURL) {
		User user = new User();
		
		try {
			con = ConnectionProvider.getConnection();
			
			String fmtEmail = email.trim();
			
			String updateStmt = "UPDATE user SET PhoneNumber=?, FirstName=?, LastName=?, Bio=?, Password=?, avatarUsing=? WHERE Email_ID=?;";
			
			preparedStmt = con.prepareStatement(updateStmt);
			
			preparedStmt.setString(1, phoneNumber);
			preparedStmt.setString(2, firstName);
			preparedStmt.setString(3, lastName);
			preparedStmt.setString(4, bio);
			preparedStmt.setString(5, newPassword);
			preparedStmt.setString(6, imageURL);
			preparedStmt.setString(7, fmtEmail);
			
			int result = preparedStmt.executeUpdate();		
			
			if(result > 0) {
				user.setFirstName(firstName);
				user.setLastName(lastName);
				user.setBio(bio);
				user.setPhoneNumber(phoneNumber);
				user.setPassword(newPassword);
				user.setAvatar(imageURL);
			}
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return user;
	}

	@Override
	public String getAvatar(String email) {
		User user = new User();
		
		String avatar = "";
		
		try {
			con = ConnectionProvider.getConnection();
			
			String selectStmt = "SELECT avatarUsing FROM user WHERE Email_ID=?;";
			
			preparedStmt = con.prepareStatement(selectStmt);
			
			preparedStmt.setString(1, email);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				user.setAvatar(resultSet.getString(1));
			}
			
			avatar = user.getAvatar();
			
			con.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return avatar;
	}
	

	
}
