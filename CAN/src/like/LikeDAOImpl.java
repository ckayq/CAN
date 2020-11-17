package like;

import java.sql.*;

import dbConnection.ConnectionProvider;

public class LikeDAOImpl implements LikeDAO {

	static Connection con;
	static PreparedStatement preparedStmt;
	
    public LikeDAOImpl(Connection con) {
        this.con = con;
    }
	
	@Override
	public int insertLike(int postID, String email_ID) {
		int status = 0;
		
		try {
			con = ConnectionProvider.getConnection();
			
			String insertStmt = "INSERT INTO user_post_likes(PostID, Email_ID) VALUES(?, ?)";
			
			preparedStmt = con.prepareStatement(insertStmt);
			
			preparedStmt.setInt(1, postID);
			preparedStmt.setString(2, email_ID);
			
			status = preparedStmt.executeUpdate();
			
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return status;
	}

	@Override
	public int countLikesOnPost(int postID) {
		int count = 0;
		
		try {
			con = ConnectionProvider.getConnection();
			
			String countLikesStmt = "SELECT COUNT(*) FROM user_post_likes WHERE PostID=?";
			
			preparedStmt = con.prepareStatement(countLikesStmt);
			
			preparedStmt.setInt(1, postID);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			if(resultSet.next()) {
				count = resultSet.getInt("COUNT(*)");
			}
			
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return count;
	}
	
	@Override
	public boolean postIsLiked(int postID, String email_ID) {
		boolean isLiked = false;
		
		try {
			con = ConnectionProvider.getConnection();
			
			String selectStmt = "SELECT * FROM user_post_likes WHERE PostID=? AND Email_ID=?";
			
			preparedStmt = con.prepareStatement(selectStmt);
			
			preparedStmt.setInt(1, postID);
			preparedStmt.setString(2, email_ID);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			if(resultSet.next()) {
				isLiked = true;
			}
			
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return isLiked;
	}
	
	@Override
	public boolean deleteLike(int postID, String email_ID) {
		boolean isDeleted = false;
		
		try {
			con = ConnectionProvider.getConnection();
			
			String deleteStmt = "DELETE FROM user_post_likes WHERE PostID=? AND Email_ID=?";
			
			preparedStmt = con.prepareStatement(deleteStmt);
			
			preparedStmt.setInt(1, postID);
			preparedStmt.setString(2, email_ID);

			preparedStmt.executeUpdate();

			isDeleted = true;
			
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return isDeleted;
	}
}