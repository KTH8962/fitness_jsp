package model;

public class Join {
	private String userId;
	private String pwd;
	private String name;
	private String birth;
	private String phone;
	private String email;
	private String userRole;
	private String field;
	private boolean isActive;

	public Join() {
		
	}
	
	public Join(String userId, String pwd, String name, String birth, String phone, String email, String userRole, String field) {
		this.userId = userId;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.userRole = userRole;
		this.field = field;
	}
	
	public Join(String userId, String name, String userRole) {
		this.userId = userId;
		this.name = name;
		this.userRole = userRole;
	}

	public String getUserId() {
		return userId;
	}

	public String getPwd() {
		return pwd;
	}

	public String getName() {
		return name;
	}

	public String getBirth() {
		return birth;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getUserRole() {
		return userRole;
	}
	
	public String getField() {
		return field;
	}

	public boolean isActive() {
		return isActive;
	}
}
