package user;

public interface UserDAO {
	public int insertUser(User user);
	
	public User getUser(String email, String password, String firstName, String lastName, double coins, String bio);
	
	public User getUserBio(String email);
	
	public User getUserPhoneNumber(String email);
	
	public String getUserFirstName(String email);
	
	public String getUserLastName(String email);
	
	public String getUserCoins(String email);
	
	public User resetUserPassword(String email, String firstName, String lastName, String phoneNumber, String newPassword);
	
	public User updateAccountDetails(String email, String firstName, String lastName, String phoneNumber, String bio,String newPassword);
}
