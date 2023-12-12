package style.model;

public class StyleBean {
	private int style_number;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private String title;
	private String content;
	private int read_count;
	private int recommend_count;
	private String write_date;
	private int product_number1;
	private int product_number2;
	private int product_number3;
	private int product_number4;
	private String member_id;

	public StyleBean() {
		super();
	}

	public StyleBean(int style_number, String image1, String image2, String image3, String image4, String image5,
			String title, String content, int read_count, int recommend_count, String write_date, int product_number1,
			int product_number2, int product_number3, int product_number4, String member_id) {
		super();
		this.style_number = style_number;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
		this.title = title;
		this.content = content;
		this.read_count = read_count;
		this.recommend_count = recommend_count;
		this.write_date = write_date;
		this.product_number1 = product_number1;
		this.product_number2 = product_number2;
		this.product_number3 = product_number3;
		this.product_number4 = product_number4;
		this.member_id = member_id;
	}

	public int getStyle_number() {
		return style_number;
	}

	public void setStyle_number(int style_number) {
		this.style_number = style_number;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage5() {
		return image5;
	}

	public void setImage5(String image5) {
		this.image5 = image5;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public int getRecommend_count() {
		return recommend_count;
	}

	public void setRecommend_count(int recommend_count) {
		this.recommend_count = recommend_count;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public int getProduct_number1() {
		return product_number1;
	}

	public void setProduct_number1(int product_number1) {
		this.product_number1 = product_number1;
	}

	public int getProduct_number2() {
		return product_number2;
	}

	public void setProduct_number2(int product_number2) {
		this.product_number2 = product_number2;
	}

	public int getProduct_number3() {
		return product_number3;
	}

	public void setProduct_number3(int product_number3) {
		this.product_number3 = product_number3;
	}

	public int getProduct_number4() {
		return product_number4;
	}

	public void setProduct_number4(int product_number4) {
		this.product_number4 = product_number4;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
