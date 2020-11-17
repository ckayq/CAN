package post;

import java.sql.*;

public class Post {
	private int postID;
	private String postAuthorEmail;
	private Timestamp postCreationDate;
	private String postTitle;
	private String postBody;
	private int postLikes;
	
	public Post() {
		super();
	}

	public Post(String postAuthorEmail, Timestamp postCreationDate, String postTitle, String postBody) {
		super();
		
		this.postAuthorEmail = postAuthorEmail;
		this.postCreationDate = postCreationDate;
		this.postTitle = postTitle;
		this.postBody = postBody;
	}
	
	public Post(int postID, String postAuthorEmail, Timestamp postCreationDate, String postTitle, String postBody) {
		super();
		
		this.postID = postID;
		this.postAuthorEmail = postAuthorEmail;
		this.postCreationDate = postCreationDate;
		this.postTitle = postTitle;
		this.postBody = postBody;
	}

	public int getPostID() {
		return postID;
	}
	
	public void setPostID(int postID) {
		this.postID = postID;
	}
	
	public String getPostAuthorEmail() {
		return postAuthorEmail;
	}
	
	public void setPostAuthorEmail(String postAuthorEmail) {
		this.postAuthorEmail = postAuthorEmail;
	}
	
	public Timestamp getPostCreationDate() {
		return postCreationDate;
	}
	
	public void setPostCreationDate(Timestamp postCreationDate) {
		this.postCreationDate = postCreationDate;
	}
	
	public String getPostTitle() {
		return postTitle;
	}
	
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	
	public String getPostBody() {
		return postBody;
	}
	
	public void setPostBody(String postBody) {
		this.postBody = postBody;
	}
	
	public int getPostLikes() {
		return postLikes;
	}
	
	public void setPostLikes(int postLikes) {
		this.postLikes = postLikes;
	}	
}