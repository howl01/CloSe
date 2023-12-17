package style.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class StyleBean {
	private int style_number;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private String title;
	private String content;
	private String style;
	private int read_count;
	private int recommend_count;
	private String write_date;
	private Integer product_number1;
	private Integer product_number2;
	private Integer product_number3;
	private Integer product_number4;
	private String member_id;
	private List<MultipartFile> images;

	StyleBean() {
		super();
	}

	StyleBean(int style_number, String image1, String image2, String image3, String image4, String image5, String title,
			String content, String style, int read_count, int recommend_count, String write_date,
			Integer product_number1, Integer product_number2, Integer product_number3, Integer product_number4,
			String member_id, List<MultipartFile> images) {
		super();
		this.style_number = style_number;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
		this.title = title;
		this.content = content;
		this.style = style;
		this.read_count = read_count;
		this.recommend_count = recommend_count;
		this.write_date = write_date;
		this.product_number1 = product_number1;
		this.product_number2 = product_number2;
		this.product_number3 = product_number3;
		this.product_number4 = product_number4;
		this.member_id = member_id;
		this.images = images;
	}

	public List<MultipartFile> getImages() {
		return images;
	}

	public void setImages(List<MultipartFile> images) {
		this.images = images;
		for (int i = 1; i < images.size() + 1; i++) {
			switch (i) {
			case 1:
				setImage1(images.get(i - 1).getOriginalFilename());
				break;
			case 2:
				setImage2(images.get(i - 1).getOriginalFilename());
				break;
			case 3:
				setImage3(images.get(i - 1).getOriginalFilename());
				break;
			case 4:
				setImage4(images.get(i - 1).getOriginalFilename());
				break;
			case 5:
				setImage5(images.get(i - 1).getOriginalFilename());
				break;
			default:
				break;
			}
		}
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

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
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

	public Integer getProduct_number1() {
		return product_number1;
	}

	public void setProduct_number1(Integer product_number1) {
		this.product_number1 = product_number1;
	}

	public Integer getProduct_number2() {
		return product_number2;
	}

	public void setProduct_number2(Integer product_number2) {
		this.product_number2 = product_number2;
	}

	public Integer getProduct_number3() {
		return product_number3;
	}

	public void setProduct_number3(Integer product_number3) {
		this.product_number3 = product_number3;
	}

	public Integer getProduct_number4() {
		return product_number4;
	}

	public void setProduct_number4(Integer product_number4) {
		this.product_number4 = product_number4;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
