package user;

public interface UserDAO {
	public int insertUser(User user);
	
	public User getUser(String email, String password, String firstName);
	
	public User resetUserPassword(String email, String firstName, String lastName, String phoneNumber, String newPassword);
}
