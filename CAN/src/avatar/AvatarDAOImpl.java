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
	ResultSet resultSet;
	
	public AvatarDAOImpl() {}
	
    public AvatarDAOImpl(Connection con) {
        this.con = con;
    }
    
	public List<Avatar> getAllAvatars(String email) {
		List<Avatar> AvatarList = new ArrayList<>();
		
		try {
			con = ConnectionProvider.getConnection();
			
			int productID = 0;
			String avatarName = "";
			String avatarImageURL = "";
			
			String getStmt = "SELECT ProductID, ProductName, ImageURL FROM user_buys_product WHERE Email_ID=?;";
			
			preparedStmt = con.prepareStatement(getStmt);
			
			preparedStmt.setString(1, email);
			
			resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				productID = resultSet.getInt(1);
				avatarName = resultSet.getString(2);
				avatarImageURL = resultSet.getString(3);
				
				if(productID < 9) {
					Avatar avatar = new Avatar(avatarName, avatarImageURL);

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
