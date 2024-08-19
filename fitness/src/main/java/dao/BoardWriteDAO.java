package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.BoardWrite;

public class BoardWriteDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/fitness";
    private String jdbcUsername = "root";
    private String jdbcPassword = "test1234";
    private Connection jdbcConnection;

    // 데이터베이스 연결
    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    // 데이터베이스 연결 해제
    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }
    
    
    public void boardWrite(BoardWrite boardInfo) throws SQLException {
    	String title = boardInfo.getTitle();
    	String instructorId = boardInfo.getInstructorId();
    	String programNo = boardInfo.getProgramNo();
    	String roomNo = boardInfo.getRoomNo();
    	String classNum = boardInfo.getClassNum();
    	String sDate = boardInfo.getsDate();
    	String eDate = boardInfo.geteDate();
    	String contents = boardInfo.getContents();
    	String boardNo = boardInfo.getBoardNo();
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
        	Statement statement2 = jdbcConnection.createStatement();
        	String sql, sql2;
        	if(boardNo != null) {
        		sql = "UPDATE tbl_board SET "
        				+ "title = '" + title + "', " + "contents = '" + contents + "', "
        				+ "userId = '" + instructorId +"', udatetime = NOW() WHERE boardNo = '" + boardNo + "'";
        		statement.executeUpdate(sql);
        		sql2 = "UPDATE tbl_class SET "
        				+ "programNo = '" + programNo + "', roomNo = '" + roomNo + "',"
        				+ "class_num = '" + classNum + "', "
        				+ "start_day_time = '" + sDate + "', end_day_time = '" + eDate + "',"
        				+ "instructor_id = '" + instructorId + "' WHERE classNo = '" + boardNo +"'";
        		statement2.executeUpdate(sql2);
        	} else {        		
        		sql = "INSERT INTO tbl_board "
        				+ "VALUES(NULL, '"+ instructorId +"', '" + title + "', '" + contents +"', 0, NOW(), NOW())";
        		statement.executeUpdate(sql);
        		sql2 = "INSERT INTO tbl_class "
        				+ "VALUES(NULL,'" + programNo + "', '" + roomNo + "', '" 
        				+ classNum + "', 0, '" + sDate + "', '" + eDate + "', '" + instructorId + "', 'F')";
        		statement2.executeUpdate(sql2);
        	}
            statement.close();
            statement2.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();    	
    }
    // 강사 조회
    public List<BoardWrite> instructorSelect() throws SQLException {
    	List<BoardWrite> instructorList = new ArrayList<>();
    	String sql = "SELECT * FROM tbl_user WHERE USER_ROLE = 'TEACHER'";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
        	ResultSet rs = statement.executeQuery(sql);
        	
        	while(rs.next()) {
        		String instructorId = rs.getString("userId");
        		String instructorName = rs.getString("name");
        		BoardWrite boardView = new BoardWrite(instructorId, instructorName);
        		instructorList.add(boardView);
        	}
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return instructorList;
    }
    
    // 강의 조회
    public List<BoardWrite> programSelect() throws SQLException {
    	List<BoardWrite> programList = new ArrayList<>();
    	String sql = "SELECT * FROM tbl_program";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
        	ResultSet rs = statement.executeQuery(sql);
        	
        	while(rs.next()) {
        		String programNo = rs.getString("programNo");
        		String programName = rs.getString("program_Name");
        		BoardWrite boardView = new BoardWrite(programNo, programName);
        		programList.add(boardView);
        	}
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return programList;
    }
    
    // 강의실 조회
    public List<BoardWrite> roomSelect() throws SQLException {
    	List<BoardWrite> roomList = new ArrayList<>();
    	String sql = "SELECT * FROM tbl_room";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
        	ResultSet rs = statement.executeQuery(sql);
        	
        	while(rs.next()) {
        		String roomNo = rs.getString("roomNo");
        		String roomName = rs.getString("roomName");
        		BoardWrite boardView = new BoardWrite(roomNo, roomName);
        		roomList.add(boardView);
        	}
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return roomList;
    }
    
    public BoardWrite boardSelect(String boardNo) throws SQLException {
    	BoardWrite writeList = new BoardWrite();
    	String sql = "SELECT * FROM tbl_board T "
    			+ "INNER JOIN tbl_class C ON T.boardNo = C.classNo "
    			+ "WHERE boardNo = '" + boardNo + "'";
    	try {
    		connect();
    		Statement statement = jdbcConnection.createStatement();
        	ResultSet rs = statement.executeQuery(sql);
        	if(rs.next()) {
        		String title = rs.getString("title");
        		String instructorId = rs.getString("instructor_id");
        		String programNo = rs.getString("programNo");
        		String roomNo = rs.getString("roomNo");
        		String classNum = rs.getString("class_num");
        		String sDate = rs.getString("start_day_time");
        		String eDate = rs.getString("end_day_time");
        		String contents = rs.getString("contents");
        		writeList = new BoardWrite(title, instructorId, programNo, roomNo, classNum, sDate, eDate, contents);
        	}
        	rs.close();
        	statement.close();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return writeList;
    }
}
