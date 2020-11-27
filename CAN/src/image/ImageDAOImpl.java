package image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbConnection.ConnectionProvider;

public class ImageDAOImpl {
	static Connection con;
	static PreparedStatement preparedStmt;
	
	public List<Image> getAllImage() {
		List<Image> imageList = new ArrayList<>();
		
		try {
			con = ConnectionProvider.getConnection();
			
			String getStmt = "SELECT * FROM product";
			
			preparedStmt = con.prepareStatement(getStmt);
			
			ResultSet resultSet = preparedStmt.executeQuery();
			
			while(resultSet.next()) {
				int imageID = resultSet.getInt("ProductID");
				String productName = resultSet.getString("ProductName");
				String imageURL = resultSet.getString("ImageURL");
				int unitPrice = resultSet.getInt("UnitPrice");
				int StockAmt = resultSet.getInt("StockAmt");
				
				Image image = new Image(imageID, productName, imageURL, unitPrice, StockAmt);
				
				
				imageList.add(image);
			}
			
			con.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return imageList;
	}
}
