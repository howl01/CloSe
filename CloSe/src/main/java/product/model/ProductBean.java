package product.model;

public class ProductBean {
	private int product_number;
	private String product_name;
	private String image;
	private int price;
	private String content;
	private int temperature;
	private String product_size;
	private int stock;
	private String smallcategory_name;
	
	public ProductBean() {
		super();
	}
	public ProductBean(int product_number, String product_name, String image, int price, String content,
			int temperature, String product_size, int stock, String smallcategory_name) {
		super();
		this.product_number = product_number;
		this.product_name = product_name;
		this.image = image;
		this.price = price;
		this.content = content;
		this.temperature = temperature;
		this.product_size = product_size;
		this.stock = stock;
		this.smallcategory_name = smallcategory_name;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTemperature() {
		return temperature;
	}
	public void setTemperature(int temperature) {
		this.temperature = temperature;
	}
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getSmallcategory_name() {
		return smallcategory_name;
	}
	public void setSmallcategory_name(String smallcategory_name) {
		this.smallcategory_name = smallcategory_name;
	}
	
	
	
}