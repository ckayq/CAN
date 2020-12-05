package avatar;

import java.sql.*;

public class Avatar {
	private String avatar;
	private String avatarName;
	private String avatarImageURL;
	
	
	public Avatar() {
		super();
	}
	
	public Avatar(String avatarName, String avatarImageURL) {
		super();
		
		this.avatarName = avatarName;
		this.avatarImageURL = avatarImageURL;
	}

	public Avatar(String avatarName) {
		super();
		
		this.avatarName = avatarName;
	}

	public String getAvatarName() {
		return avatarName;
	}

	public void setAvatarName(String avatarName) {
		this.avatarName = avatarName;
	}

	public String getAvatarImageURL() {
		return avatarImageURL;
	}

	public void setAvatarImageURL(String avatarImageURL) {
		this.avatarImageURL = avatarImageURL;
	}
}
