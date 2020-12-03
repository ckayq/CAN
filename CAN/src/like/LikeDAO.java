package like;

public interface LikeDAO {
	public Like insertLike(int postID, String postAuthorEmail, String userWhoLiked, int like);
	
	public int countLikesOnPost(int postID);
	
	public boolean postIsLiked(int postID, String email_ID);
	
	public boolean deleteLike(int postID, String email_ID);
}
