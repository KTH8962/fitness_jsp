package model;

public class BoardWrite {
	private String title;
	private String instructorId;
	private String programNo;
	private String roomNo;
	private String classNum;
	private String sDate;
	private String eDate;
	private String contents;
	private String boardNo;
	private String temp;
	private String temp2;
	
	public BoardWrite() {
	}
	
	public BoardWrite(String temp, String temp2) {
		this.temp = temp;
		this.temp2 = temp2;
	}
	
	public BoardWrite(String title, String instructorId, String programNo, String roomNo, String classNum , String sDate, String eDate, String contents) {
		this.title = title;
		this.instructorId = instructorId;
		this.programNo = programNo;
		this.classNum = classNum;
		this.roomNo = roomNo;
		this.sDate = sDate;
		this.eDate = eDate;
		this.contents = contents;
	}
	
	public BoardWrite(String boardNo, String title, String instructorId, String programNo, String roomNo, String classNum , String sDate, String eDate, String contents) {
		this.boardNo = boardNo;
		this.title = title;
		this.instructorId = instructorId;
		this.programNo = programNo;
		this.classNum = classNum;
		this.roomNo = roomNo;
		this.sDate = sDate;
		this.eDate = eDate;
		this.contents = contents;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public String getTitle() {
		return title;
	}

	public String getInstructorId() {
		return instructorId;
	}

	public String getProgramNo() {
		return programNo;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public String getClassNum() {
		return classNum;
	}

	public String getsDate() {
		return sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public String getContents() {
		return contents;
	}

	public String getTemp() {
		return temp;
	}
	
	public String getTemp2() {
		return temp2;
	}

}
