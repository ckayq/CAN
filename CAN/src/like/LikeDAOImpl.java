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
	public boolean insertLike(double likes, String email) {
		boolean isInserted = false;
		
		try {
			con = ConnectionProvider.getConnection();
			
			double coins = likes * 1.5;
			
			String fmtEmail = email.trim();

			String updateStmt = "UPDATE user SET Coins = ? WHERE Email_ID=?";

			preparedStmt = con.prepareStatement(updateStmt);
			
			preparedStmt.setDouble(1, coins);
			preparedStmt.setString(2, fmtEmail);
			
			preparedStmt.executeUpdate();
			
			isInserted = true; 
			
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return isInserted;
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