package product.model;

import org.springframework.web.multipart.MultipartFile;

public class ProductBean {
	private int product_number;
	private String product_name;
	private String image;
	private int price;
	private String content;
	private int temperature;
	private int s_stock;
	private int m_stock;
	private int l_stock;
	private int xl_stock;
	private String smallcategory_name;
	
	private MultipartFile pImage; //상품사진
	private MultipartFile pContent; //설명사진
	
	public MultipartFile getpImage() {
		System.out.println("getpImage");
		return pImage;
	}
	public void setpImage(MultipartFile pImage) {
		this.pImage = pImage;
		System.out.println("setpImage");
		if(this.pImage != null) { // 
			System.out.println(pImage.getName()); //upload
			System.out.println(pImage.getOriginalFilename()); 
			image = pImage.getOriginalFilename();
		}
	}
	public MultipartFile getpContent() {
		System.out.println("getpContent");
		return pContent;
	}
	public void setpContent(MultipartFile pContent) {
		this.pContent = pContent;
		System.out.println("setpContent");
		if(this.pContent != null) { 
			System.out.println(pContent.getName()); //upload
			System.out.println(pContent.getOriginalFilename()); 
			content = pImage.getOriginalFilename();
		}
	}
	
	
	
	public ProductBean() {
		super();
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
	public String getSmallcategory_name() {
		return smallcategory_name;
	}
	public void setSmallcategory_name(String smallcategory_name) {
		this.smallcategory_name = smallcategory_name;
	}
	
	public int getS_stock() {
		return s_stock;
	}
	public void setS_stock(int s_stock) {
		this.s_stock = s_stock;
	}
	public int getM_stock() {
		return m_stock;
	}
	public void setM_stock(int m_stock) {
		this.m_stock = m_stock;
	}
	public int getL_stock() {
		return l_stock;
	}
	public void setL_stock(int l_stock) {
		this.l_stock = l_stock;
	}
	public int getXl_stock() {
		return xl_stock;
	}
	public void setXl_stock(int xl_stock) {
		this.xl_stock = xl_stock;
	}
	
}