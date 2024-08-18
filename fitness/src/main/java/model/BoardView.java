package model;

public class BoardView {
	private String boardNo;
	private String name;
	private String title;
	private String contents;
	private String hit;
	private String cDate;
	private String uDate;
	private String cNum;
	private String cNumCnt;
	
	public BoardView() {
	}
	
	public BoardView(String boardNo, String name, String title, String contents, String hit, String cDate, String uDate, String cNum, String cNumCnt) {
		this.boardNo = boardNo;
		this.name = name;
		this.title = title;
		this.contents = contents;
		this.hit = hit;
		this.cDate = cDate;
		this.uDate = uDate;
		this.cNum = cNum;
		this.cNumCnt = cNumCnt;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public String getName() {
		return name;
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

	public String getcDate() {
		return cDate;
	}

	public String getuDate() {
		return uDate;
	}

	public String getcNum() {
		return cNum;
	}

	public String getcNumCnt() {
		return cNumCnt;
	}
}
