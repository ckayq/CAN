package post;

public interface PostDAO {
	public boolean insertPost(Post post);
	
	public Post editPost(int postID, String postTitle, String postBody);
	
	public boolean deletePost(int postID);
}
