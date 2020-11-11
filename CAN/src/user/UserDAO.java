package user;

public interface UserDAO {
	public int insertUser(User user);
	
	public User getUser(String email, String password, String firstName);
}
