package user;

public interface UserDAO {
	public int insertUser(User user);
	
	public User getUser(String email, String password, String firstName, String lastName, double coins, String bio);
	
	public User resetUserPassword(String email, String firstName, String lastName, String phoneNumber, String newPassword);
}
