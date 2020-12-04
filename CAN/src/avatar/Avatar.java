package avatar;

import java.sql.*;

public class Avatar {
	private String avatar;
	
	
	public Avatar() {
		super();
	}
	
	public Avatar(String imageURL) {
		super();
		
		this.avatar = imageURL;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	

}
