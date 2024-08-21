package model;

public class Admin {
	private String userId;
	private String pwd;
	private String pwdChanged;
	private String name;
	private String birth;
	private String phone;
	private String email;
	private String loginCnt;
	private String createDay;
	private String isActive;
	private String userRole;
	private String field;
	private String boardNo;
	private String title;
	private String contents;
	private String hit;
	private String cdatetime;
	private String udatetime;
	private String classNo;
	private String classNum;
	private String classNumCnt;
	private String sDate;
	private String eDate;
	private String status;
	private String enrollNo;
	private String enrollDate;
	private String programName;
	private String roomName;
	private String temp1;
	private String temp2;
	private String temp3;
	
	public Admin() {
	}
	
	public Admin(String temp1, String temp2, String temp3) {
		this.temp1 = temp1;
		this.temp2 = temp2;
		this.temp3 = temp3;
	}
	
	public Admin(String enrollNo, String name, String programName, String enrollDate) {
		this.enrollNo = enrollNo;
		this.name = name;
		this.programName = programName;
		this.enrollDate = enrollDate;
	}
	
	public Admin(String boardNo, String userId, String title, String contents, String hit, String cdatetime, String udatetime) {
		this.boardNo = boardNo;
		this.userId = userId;
		this.title = title;
		this.contents = contents;
		this.hit = hit;
		this.cdatetime = cdatetime;
		this.udatetime = udatetime;
	}
	
	public Admin(String classNo, String programName, String roomName, String classNum, String classNumCnt, String sDate, String eDate, String name, String status) {
		this.classNo = classNo;
		this.programName = programName;
		this.roomName = roomName;
		this.classNum = classNum;
		this.classNumCnt = classNumCnt;
		this.sDate = sDate;
		this.eDate = eDate;
		this.name = name;
		this.status = status;
	}
	
	public Admin(String userId, String pwd, String pwdChanged, String name, String birth, String phone, String email, String loginCnt, String createDay, String isActive, String userRole, String field) {
		this.userId = userId;
		this.pwd = pwd;
		this.pwdChanged = pwdChanged;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.loginCnt = loginCnt;
		this.createDay = createDay;
		this.isActive = isActive;
		this.userRole = userRole;
		this.field = field;
	}

	public String getUserId() {
		return userId;
	}

	public String getPwd() {
		return pwd;
	}

	public String getPwdChanged() {
		return pwdChanged;
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

	public String getLoginCnt() {
		return loginCnt;
	}

	public String getCreateDay() {
		return createDay;
	}

	public String getIsActive() {
		return isActive;
	}

	public String getUserRole() {
		return userRole;
	}

	public String getField() {
		return field;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public String getTitle() {
		return title;
	}

	public String getContents() {
		return contents;
	}

	public String getHit() {
		return hit;
	}

	public String getCdatetime() {
		return cdatetime;
	}

	public String getUdatetime() {
		return udatetime;
	}

	public String getClassNo() {
		return classNo;
	}

	public String getClassNum() {
		return classNum;
	}

	public String getClassNumCnt() {
		return classNumCnt;
	}

	public String getsDate() {
		return sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public String getStatus() {
		return status;
	}

	public String getEnrollNo() {
		return enrollNo;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public String getProgramName() {
		return programName;
	}

	public String getRoomName() {
		return roomName;
	}

	public String getTemp1() {
		return temp1;
	}

	public String getTemp2() {
		return temp2;
	}

	public String getTemp3() {
		return temp3;
	}
}