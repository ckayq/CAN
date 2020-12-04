package like;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;
import java.text.DecimalFormat;

import dbConnection.ConnectionProvider;

public class LikeDAOImpl implements LikeDAO {

	static Connection con;
	static PreparedStatement preparedStmt;
	
	public LikeDAOImpl() {}
	
    public LikeDAOImpl(Connection con) {
        this.con = con;
    }
	
	@Override
	public Like insertLike(int postID, String postAuthorEmail, String userWhoLiked, int like) {
		boolean isLiked = false;
		
		Like likeObj = new Like();
		
		ResultSet resultSet;
		
		try {
			con = ConnectionProvider.getConnection();
			
			double likeToCoinsRate = 0;
			double updatedCoins = 0;
			String fmtPostAuthorEmail = postAuthorEmail.trim();
			String fmtUserWhoLiked = userWhoLiked.trim();
			
			//Check if the post was liked
			String checkLikeStmt = "SELECT isLiked FROM user_likes_post WHERE PostID=? AND Email_ID=?";
			
			preparedStmt = con.prepareStatement(checkLikeStmt);
			
			preparedStmt.setInt(1, postID);
			preparedStmt.setString(2, fmtUserWhoLiked);
			
			
			resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				isLiked = resultSet.getBoolean(1);
			} 
			
			if(!isLiked) {
				//Select Status From user Table
				String checkStmt = "SELECT Coins, Status FROM user WHERE Email_ID=?";
				
				preparedStmt = con.prepareStatement(checkStmt);
				
				preparedStmt.setString(1, fmtPostAuthorEmail);
				
				resultSet = preparedStmt.executeQuery();
				
				String status = "";
				int userCoins = 0; 
				
				while(resultSet.next()) {
					userCoins = resultSet.getInt(1);
					status = resultSet.getString(2);
				} 
				
				if(status.equals("Bronze")) {
					likeToCoinsRate = 1.5;
				} else if(status.equals("Silver")) {
					likeToCoinsRate = 2;
				} else if(status.equals("Gold")) {
					likeToCoinsRate = 2.5;
				} else if(status.equals("Platinum")) {
					likeToCoinsRate = 3.5;
				} else if(status.equals("Diamond")) {
					likeToCoinsRate = 4;
				} else {
					likeToCoinsRate = 1;
				}
				
				updatedCoins = userCoins + likeToCoinsRate;
				//
	
				//Update user Table
				String updateStmt = "UPDATE user SET Coins=? WHERE Email_ID=?";
	
				preparedStmt = con.prepareStatement(updateStmt);
				
				preparedStmt.setDouble(1, updatedCoins);
				preparedStmt.setString(2, fmtPostAuthorEmail);
				
				preparedStmt.executeUpdate();
				//
				
				//Select Likes From post Table
				String selectLikesStmt = "SELECT Likes From post WHERE PostID=? AND Email_ID=?";
				
				preparedStmt = con.prepareStatement(selectLikesStmt);
				
				preparedStmt.setInt(1, postID);
				preparedStmt.setString(2, fmtPostAuthorEmail);
				
				resultSet = preparedStmt.executeQuery();
				
				int postLikes = 0; 
				
				while(resultSet.next()) {
					postLikes = resultSet.getInt(1);
				}
				
				postLikes++;
				//
				
				//Update post Table
				String updatePostStmt = "UPDATE post SET Likes=? WHERE PostID=? AND Email_ID=?";
	
				preparedStmt = con.prepareStatement(updatePostStmt);
				
				preparedStmt.setDouble(1, postLikes);
				preparedStmt.setInt(2, postID);
				preparedStmt.setString(3, fmtPostAuthorEmail);
				
				preparedStmt.executeUpdate();
				//
				
				//Insert into user_likes_post Table
				isLiked = true; 
				
				String insertStmt = "INSERT INTO user_likes_post(PostID, Email_ID, isLiked) VALUES(?, ?, ?)";
	
				preparedStmt = con.prepareStatement(insertStmt);
				
				preparedStmt.setInt(1, postID);
				preparedStmt.setString(2, fmtUserWhoLiked);
				preparedStmt.setBoolean(3, isLiked);
				
				preparedStmt.executeUpdate();
				//
			} else {
				System.out.println("User has already liked this post");
			}
			
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return likeObj;
	}

	@Override
	public int countLikesOnPost(int postID, String postAuthorEmail) {
		int count = 0;
		
		try {
			con = ConnectionProvider.getConnection();
			
			String fmtPostAuthorEmail = postAuthorEmail.trim();
			
			String countLikesStmt = "SELECT Likes FROM post WHERE PostID=? AND Email_ID=?";
			
			preparedStmt = con.prepareStatement(countLikesStmt);
			
			preparedStmt.setInt(1, postID);
			preparedStmt.setString(2, fmtPostAuthorEmail);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			if(resultSet.next()) {
				count = resultSet.getInt(1);
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
	public boolean deleteLike(int postID, String postAuthorEmail) {
		boolean isDeleted = false;
		
		try {
			con = ConnectionProvider.getConnection();
			
			String deleteStmt = "DELETE FROM user_post_likes WHERE PostID=? AND Email_ID=?";
			
			preparedStmt = con.prepareStatement(deleteStmt);
			
			preparedStmt.setInt(1, postID);
			preparedStmt.setString(2, postAuthorEmail);

			preparedStmt.executeUpdate();

			isDeleted = true;
			
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return isDeleted;
	}
}