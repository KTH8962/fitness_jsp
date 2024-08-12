package model;

public class Login {
	private String userId;
	private String pwd;
	
	public Login(String userId, String pwd) {
		this.userId = userId;
		this.pwd = pwd;
	}

	public Login() {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public String getPwd() {
		return pwd;
	}
}
