package member.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.time.LocalDate;

import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
	@NotEmpty(message = "아이디를 입력하세요")
	@Size(max = 10, message = "10글자이하로 입력하세요")
	private String member_id;
	
	@NotEmpty(message = "비밀번호를 입력하세요")
	private String password;
	
	private String passwordcheck;
	 
	@NotEmpty(message = "이름을 입력하세요")
	@Size(max = 3, message = "3글자이하로 입력하세요")
	private String name;
	
	@NotEmpty(message = "전화번호를 입력하세요")
	@Pattern(regexp = "^[0-9]+$", message = "숫자만 입력가능")
	private String phone;
	
	@NotEmpty(message = "이메일을 입력하세요")
	private String email;
	
	@NotEmpty(message = "주소를 입력하세요")
	private String address1;
	
	@NotEmpty(message = "상세주소를 입력하세요")
	private String address2;
	
	@NotEmpty(message = "생년월일을 입력하세요")
	private String birth;
	
	@NotNull(message = "성별을 선택하세요")
	private String gender;
	
	@NotEmpty(message = "닉네임을 입력하세요")
	@Size(max = 6, message = "6글자이하로 입력하세요")
	private String nickname;
	
	@NotNull(message = "인증번호를 입력하세요")
	@Size(min = 4, message = "인증번호를 입력하세요")
	private String verificationCode;
	
	@NotEmpty(message = "키 입력")
	@Pattern(regexp = "^[0-9]+$", message = "숫자만 입력가능")
	private String height;
	
	@NotEmpty(message = "몸무게 입력")
	@Pattern(regexp = "^[0-9]+$", message = "숫자만 입력가능")
	private String weight;
	
	private String social;

	private int ban_count;
	private LocalDate ban_expiration;

	public MemberBean() {
		super();
	}

	public MemberBean(String member_id, String password, String name, String phone, String email, String address1,
			String address2, String birth, String gender, String nickname, String height, String weight,
			String social) {
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
