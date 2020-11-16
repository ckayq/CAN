package post;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dbConnection.ConnectionProvider;

public class PostDAOImpl implements PostDAO {

	static Connection con;
	static PreparedStatement preparedStmt;
	
	@Override
	public boolean insertPost(Post post) {
		boolean flag = false;
		
		try {
			con = ConnectionProvider.getConnection();
			
			String insertStmt = "INSERT INTO post(Email_ID, CreationDate, PostTitle, PostBody, Likes) VALUES(?, ?, ?, ?, ?);";
			
			preparedStmt = con.prepareStatement(insertStmt);
			
			preparedStmt.setString(1, post.getPostAuthorEmail());
			preparedStmt.setTimestamp(2, post.getPostCreationDate());
			preparedStmt.setString(3, post.getPostTitle());
			preparedStmt.setString(4, post.getPostBody());
			preparedStmt.setInt(5, 0);
			
			preparedStmt.executeUpdate();
			
			flag = true;
			
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Here");
		}
		
		return flag;
	}

}
