package model;

public class Board {
	private String boardNo;
	private String title;
	private String sDate;
	private String eDate;
	private String eNameClass;
	private String status;
	
	public Board() {
	}
	
	public Board(String boardNo, String title, String sDate, String eDate, String eNameClass) {
		this.boardNo = boardNo;
		this.title = title;
		this.sDate = sDate;
		this.eDate = eDate;
		this.eNameClass = eNameClass;
	}
	
	public Board(String boardNo, String title, String sDate, String eDate, String eNameClass, String status) {
		this.boardNo = boardNo;
		this.title = title;
		this.sDate = sDate;
		this.eDate = eDate;
		this.eNameClass = eNameClass;
		this.status = status;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public String getTitle() {
		return title;
	}

	public String getsDate() {
		return sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public String geteNameClass() {
		return eNameClass;
	}

	public String getStatus() {
		return status;
	}
}
