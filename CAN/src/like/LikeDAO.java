package like;

public interface LikeDAO {
	public int insertLike(int postID, String email_ID);
	
	public int countLikesOnPost(int postID);
	
	public boolean postIsLiked(int postID, String email_ID);
	
	public boolean deleteLike(int postID, String email_ID);
}