package style.model;

public class StyleBean {
	private int style_number;
	private String image;
	private String title;
	private String content;
	private int read_count;
	private int recommend_count;
	private String write_date;
	private int ref;
	private int re_step;
	private int re_level;
	private String ip;
	private int product_number;
	private String member_id;
	
	public StyleBean() {
		super();
	}
	public StyleBean(int style_number, String image, String title, String content, int read_count, int recommend_count,
			String write_date, int ref, int re_step, int re_level, String ip, int product_number, String member_id) {
		super();
		this.style_number = style_number;
		this.image = image;
		this.title = title;
		this.content = content;
		this.read_count = read_count;
		this.recommend_count = recommend_count;
		this.write_date = write_date;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
		this.ip = ip;
		this.product_number = product_number;
		this.member_id = member_id;
	}
	public int getStyle_number() {
		return style_number;
	}
	public void setStyle_number(int style_number) {
		this.style_number = style_number;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
