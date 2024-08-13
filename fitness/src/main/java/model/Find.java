package model;

public class Find {
	private String name;
	private String email;
	private String userId;
	

	public Find(String name, String email) {
		this.name = name;
		this.email = email;
	}

	public Find(String id, String name, String email) {
		this.userId = id;
		this.name = name;
		this.email = email;
	}

	public String getUserId() {
		return userId;
	}

	public String getName() {
		return name;
	}


	public String getEmail() {
		return email;
	}
}
