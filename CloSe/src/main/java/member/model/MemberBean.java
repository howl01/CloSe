package member.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
	@NotEmpty(message = "���̵� �Է��ϼ���")
	private String member_id;
	
	@NotEmpty(message = "��й�ȣ�� �Է��ϼ���")
	private String password;
	 
	@NotEmpty(message = "�̸��� �Է��ϼ���")
	private String name;
	
	@NotEmpty(message = "��ȭ��ȣ�� �Է��ϼ���")
	private String phone;
	
	@NotEmpty(message = "�ּҸ� �Է��ϼ���")
	private String address1;
	
	@NotEmpty(message = "���ּҸ� �Է��ϼ���")
	private String address2;
	
	@NotEmpty(message = "��������� �Է��ϼ���")
	private String birth;
	
	@NotNull(message = "������ �����ϼ���")
	private String gender;
	
	@NotEmpty(message = "�г����� �Է��ϼ���")
	private String nickname;
	private int height;
	private int weight;
	
	public MemberBean() {
		super();
	}
	public MemberBean(String member_id, String password, String name, String phone,
			String address1, String address2, String birth, String gender, String nickname, int height, int weight) {
		super();
		this.member_id = member_id;
		this.password = password;
		this.name = name;
		this.phone = phone;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
