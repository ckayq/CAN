package user;

public class User {
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNumber;
	private String password;
	private double coins;
	private String status;
	private String bio;
	
	public User() {
		super();
	}

	public User(String newFirstName, String newLastName, String newEmail, String newPhoneNumber, String newPassword) {
		super();
		
		this.firstName = newFirstName;
		this.lastName = newLastName;
		this.email = newEmail;
		this.phoneNumber = newPhoneNumber;
		this.password = newPassword;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public double getCoins() {
		return coins;
	}

	public void setCoins(double coins) {
		this.coins = coins;
	}
	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}
	
}
