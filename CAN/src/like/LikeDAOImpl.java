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
		
		try {
			con = ConnectionProvider.getConnection();
			
			double likeToCoinsRate = 0;
			double coins = 0;
			String fmtPostAuthorEmail = postAuthorEmail.trim();
			String fmtUserWhoLiked = userWhoLiked.trim();
			
			//Select Status From user Table
			String checkStmt = "SELECT Status FROM user WHERE Email_ID=?";
			
			preparedStmt = con.prepareStatement(checkStmt);
			
			preparedStmt.setString(1, fmtUserWhoLiked);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			String status = "";
			
			while(resultSet.next()) {
				status = resultSet.getString(1);
				System.out.println(status);
			} 
			
			if(status.equals("none")) {
				likeToCoinsRate = 1;
			} else if(status.equals("Bronze")) {
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
			
			coins = like * likeToCoinsRate;
			//

			//Update user Table
			String updateStmt = "UPDATE user SET Coins=? WHERE Email_ID=?";

			preparedStmt = con.prepareStatement(updateStmt);
			
			preparedStmt.setDouble(1, coins);
			preparedStmt.setString(2, fmtPostAuthorEmail);
			
			preparedStmt.executeUpdate();
			//
			
			//Update post Table
			String updatePostStmt = "UPDATE post SET Likes=? WHERE PostID=? AND Email_ID=?";

			preparedStmt = con.prepareStatement(updatePostStmt);
			
			preparedStmt.setDouble(1, like);
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
			
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return likeObj;
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