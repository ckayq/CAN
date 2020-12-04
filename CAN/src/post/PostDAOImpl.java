package post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dbConnection.ConnectionProvider;

public class PostDAOImpl implements PostDAO {

	static Connection con;
	static PreparedStatement preparedStmt;
	
	public PostDAOImpl() {}
	
    public PostDAOImpl(Connection con) {
        this.con = con;
    }
	
	// Post Creation
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
		}
		
		return flag;
	}
	
	// Getting all the posts
	public List<Post> getAllPosts() {
		List<Post> postList = new ArrayList<>();
		
		try {
			con = ConnectionProvider.getConnection();
			
			String getStmt = "SELECT * FROM post ORDER BY CreationDate ASC";
			
			preparedStmt = con.prepareStatement(getStmt);
			
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
	public Post editPost(int postID, String postTitle, String postBody) {
		Post post = new Post();
		
		try {
			con = ConnectionProvider.getConnection();
			
			String updateStmt = "UPDATE post SET PostTitle=?, PostBody=? WHERE PostID=?";
			
			preparedStmt = con.prepareStatement(updateStmt);
			
			preparedStmt.setString(1, postTitle);
			preparedStmt.setString(2, postBody);
			preparedStmt.setInt(3, postID);
			
			int resultSet = preparedStmt.executeUpdate();
			
			if(resultSet > 0) {
				post.setPostTitle(postTitle);
				post.setPostBody(postBody);
			}
			
			System.out.println(postTitle + "\n" + postBody);
			
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return post;
	}
}
