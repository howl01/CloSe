package popular.model;

public class PopularBean {
	private String popular_word;
	private int popular_count;

	public PopularBean() {
		super();
	}

	public PopularBean(String popular_word, int popular_count) {
		super();
		this.popular_word = popular_word;
		this.popular_count = popular_count;
	}

	public String getPopular_word() {
		return popular_word;
	}

	public void setPopular_word(String popular_word) {
		this.popular_word = popular_word;
	}

	public int getPopular_count() {
		return popular_count;
	}

	public void setPopular_count(int popular_count) {
		this.popular_count = popular_count;
	}

}
