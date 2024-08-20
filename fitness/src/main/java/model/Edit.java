package model;

public class Edit {
	private String userId;
	private String pwd;
	private String name;
	private String birth;
	private String phone;
	private String email;
	private String field;
	private String programName;
	private String programEname;
	private String message;

	public Edit() {}
	
	public Edit(String message) {
		this.message = message;
	}
	
	public Edit(String programName, String programEname) {
		this.programName = programName;
		this.programEname = programEname;
	}
	
	public Edit(String userId, String pwd, String phone, String email, String field) {
		this.userId = userId;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
		this.field = field;
	}
	
	public Edit(String userId, String name, String birth, String phone, String email, String field) {
		this.userId = userId;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.field = field;
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

	public String getField() {
		return field;
	}

	public String getProgramName() {
		return programName;
	}

	public String getProgramEname() {
		return programEname;
	}

	public String getMessage() {
		return message;
	}
	
}
