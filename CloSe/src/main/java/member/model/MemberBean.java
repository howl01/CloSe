package member.model;

import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
	@NotEmpty(message = "아이디를 입력하세요")
	private String member_id;
	
	@NotEmpty(message = "입력하세요")
	private String password;
	 
	@NotEmpty(message = "입력하세요")
	private String name;
	
	@NotEmpty(message = "입력하세요")
	private String hp1;
	
	@NotEmpty(message = "입력하세요")
	private String hp2;
	
	@NotEmpty(message = "입력하세요")
	private String hp3;
	
	@NotEmpty(message = "입력하세요")
	private String address1;
	
	@NotEmpty(message = "입력하세요")
	private String address2;
	
	private String birth;
	
	
	private String gender;
	
	@NotEmpty(message = "닉네임을 입력하세요")
	private String nickname;
	private int height;
	private int weight;
	
	public MemberBean() {
		super();
	}
	public MemberBean(String member_id, String password, String name, String hp1, String hp2, String hp3,
			String address1, String address2, String birth, String gender, String nickname, int height, int weight) {
		super();
		this.member_id = member_id;
		this.password = password;
		this.name = name;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.address1 = address1;
		this.address2 = address2;
		this.birth = birth;
		this.gender = gender;
		this.nickname = nickname;
		this.height = height;
		this.weight = weight;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	
	
}
