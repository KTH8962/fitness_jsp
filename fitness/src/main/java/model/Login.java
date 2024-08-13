package model;

public class Login {
	private String userId;
	private String pwd;
	private String userRole;
	private String name;
	private String message;
	
	public Login(String userId, String pwd) {
		this.userId = userId;
		this.pwd = pwd;
	}

	public Login(String userId, String name, String userRole) {
		this.userId = userId;
		this.name = name;
		this.userRole = userRole;
	}
	
	public Login(String message) {
		this.message = message;
	}

	public String getUserId() {
		return userId;
	}

	public String getPwd() {
		return pwd;
	}

	public String getUserRole() {
		return userRole;
	}

	public String getName() {
		return name;
	}

	public String getMessage() {
		return message;
	}
}
