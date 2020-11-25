package like;

public interface LikeDAO {
	public boolean insertLike(double coins, String phoneNumber);
	
	public int countLikesOnPost(int postID);
	
	public boolean postIsLiked(int postID, String email_ID);
	
	public boolean deleteLike(int postID, String email_ID);
}
