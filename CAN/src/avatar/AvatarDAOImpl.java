package avatar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import dbConnection.ConnectionProvider;

public class AvatarDAOImpl {

	static Connection con;
	static PreparedStatement preparedStmt;
	
	public AvatarDAOImpl() {}
	
    public AvatarDAOImpl(Connection con) {
        this.con = con;
    }
    
	public List<Avatar> getAllAvatar(String email) {
		List<Avatar> AvatarList = new ArrayList<>();
		
		try {
			con = ConnectionProvider.getConnection();
			
			String getStmt = "SELECT imageURL, ProductID FROM user_buys_product WHERE Email_ID=?;";
			
			preparedStmt = con.prepareStatement(getStmt);
			
			preparedStmt.setString(1, email);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				String avatarSet = resultSet.getString("ImageURL");
				int avatarID = resultSet.getInt("ProductID");
				if(avatarID < 9) {
				Avatar avatar = new Avatar(avatarSet);

				AvatarList.add(avatar);
				}
			}
			
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return AvatarList;
	}

    
    
}
