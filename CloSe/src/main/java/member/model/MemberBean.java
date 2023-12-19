package member.model;

<<<<<<< HEAD
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
=======
import java.time.LocalDate;
>>>>>>> refs/remotes/origin/wook

import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
<<<<<<< HEAD
	@NotEmpty(message = "���̵� �Է��ϼ���")
	@Size(max = 10, message = "10�������Ϸ� �Է��ϼ���")
=======
	@NotEmpty(message = "���̵� �Է��ϼ���")
>>>>>>> refs/remotes/origin/wook
	private String member_id;
	
<<<<<<< HEAD
	@NotEmpty(message = "��й�ȣ�� �Է��ϼ���")
=======
	@NotEmpty(message = "�Է��ϼ���")
>>>>>>> refs/remotes/origin/wook
	private String password;
	
	private String passwordcheck;
	 
<<<<<<< HEAD
	@NotEmpty(message = "�̸��� �Է��ϼ���")
	@Size(max = 3, message = "3�������Ϸ� �Է��ϼ���")
=======
	@NotEmpty(message = "�Է��ϼ���")
>>>>>>> refs/remotes/origin/wook
	private String name;
	
<<<<<<< HEAD
	@NotEmpty(message = "��ȭ��ȣ�� �Է��ϼ���")
	@Pattern(regexp = "^[0-9]+$", message = "���ڸ� �Է°���")
	private String phone;
=======
	@NotEmpty(message = "�Է��ϼ���")
	private String hp1;
>>>>>>> refs/remotes/origin/wook
	
<<<<<<< HEAD
	@NotEmpty(message = "�̸����� �Է��ϼ���")
	private String email;
=======
	@NotEmpty(message = "�Է��ϼ���")
	private String hp2;
>>>>>>> refs/remotes/origin/wook
	
<<<<<<< HEAD
	@NotEmpty(message = "�ּҸ� �Է��ϼ���")
=======
	@NotEmpty(message = "�Է��ϼ���")
	private String hp3;
	
	@NotEmpty(message = "�Է��ϼ���")
>>>>>>> refs/remotes/origin/wook
	private String address1;
	
<<<<<<< HEAD
	@NotEmpty(message = "���ּҸ� �Է��ϼ���")
=======
	@NotEmpty(message = "�Է��ϼ���")
>>>>>>> refs/remotes/origin/wook
	private String address2;
	
	@NotEmpty(message = "��������� �Է��ϼ���")
	private String birth;
	
	@NotNull(message = "������ �����ϼ���")
	private String gender;
	
<<<<<<< HEAD
	@NotEmpty(message = "�г����� �Է��ϼ���")
	@Size(max = 6, message = "6�������Ϸ� �Է��ϼ���")
=======
	@NotEmpty(message = "�г����� �Է��ϼ���")
>>>>>>> refs/remotes/origin/wook
	private String nickname;
	
	@NotNull(message = "������ȣ�� �Է��ϼ���")
	@Size(min = 4, message = "������ȣ�� �Է��ϼ���")
	private String verificationCode;
	
	@NotEmpty(message = "Ű �Է�")
	@Pattern(regexp = "^[0-9]+$", message = "���ڸ� �Է°���")
	private String height;
	
	@NotEmpty(message = "������ �Է�")
	@Pattern(regexp = "^[0-9]+$", message = "���ڸ� �Է°���")
	private String weight;
	
	private String social;
	
	private int ban_count;
	private LocalDate ban_expiration;
	
	public MemberBean() {
		super();
	}
<<<<<<< HEAD
	public MemberBean(String member_id, String password, String name, String phone, String email,
			String address1, String address2, String birth, String gender, String nickname, String height, String weight, String social) {
=======

	public MemberBean(String member_id, String password, String name, String hp1, String hp2, String hp3,
			String address1, String address2, String birth, String gender, String nickname, int height, int weight,
			int ban_count, LocalDate ban_expiration) {
>>>>>>> refs/remotes/origin/wook
		super();
		this.member_id = member_id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address1 = address1;
		this.address2 = address2;
		this.birth = birth;
		this.gender = gender;
		this.nickname = nickname;
		this.height = height;
		this.weight = weight;
<<<<<<< HEAD
		this.social = social;
	}
	
	public String getSocial() {
		return social;
	}
	public void setSocial(String social) {
		this.social = social;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswordcheck() {
		return passwordcheck;
	}
	public void setPasswordcheck(String passwordcheck) {
		this.passwordcheck = passwordcheck;
	}
	public String getVerificationCode() {
		return verificationCode;
	}
	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
=======
		this.ban_count = ban_count;
		this.ban_expiration = ban_expiration;
	}

	public int getBan_count() {
		return ban_count;
	}
	public void setBan_count(int ban_count) {
		this.ban_count = ban_count;
	}
	public LocalDate getBan_expiration() {
		return ban_expiration;
	}
	public void setBan_expiration(LocalDate ban_expiration) {
		this.ban_expiration = ban_expiration;
>>>>>>> refs/remotes/origin/wook
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
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	
	
	
}
