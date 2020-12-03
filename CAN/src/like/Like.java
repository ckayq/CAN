package like;

public class Like {
	private int postID;
	private String postAuthorEmail;
	private double postLikes;
	
	public Like() {
		super();
	}

	public Like(int postID, String postAuthorEmail, double postLikes) {
		super();
		
		this.postID = postID;
		this.postAuthorEmail = postAuthorEmail;
		this.postLikes = postLikes;
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

	public double getPostLikes() {
		return postLikes;
	}

	public void setPostLikes(double postLikes) {
		this.postLikes = postLikes;
	}
}
