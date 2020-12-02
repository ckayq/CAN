package image;

public class Image {
	private int imageID;
	private int unitPrice;
	private String productName;
	private String imageURL;

	public Image() {
		super();
	}
	
	public Image(int imageID, String productName, String imageURL, int unitPrice) {
		super();
		
		this.setImageID(imageID);
		this.setProductName(productName);
		this.setImageURL(imageURL);
		this.setUnitPrice(unitPrice);
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getImageID() {
		return imageID;
	}

	public void setImageID(int imageID) {
		this.imageID = imageID;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	
}