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
    
    public List<BoardWrite> AllBoardView(String category) throws SQLException {
    	List<BoardWrite> BoardViewList = new ArrayList<>();
        String sql = null;
        if(category.equals("ALL")) {
        	sql = "SELECT * FROM "
            		+ "tbl_BoardView B "
            		+ "INNER JOIN tbl_class C ON B.BoardViewNO = C.CLASSNO "
            		+ "INNER JOIN tbl_program P ON C.PROGRAMNO = P.PROGRAMNO "
            		+ "ORDER BY START_DAY_TIME DESC";
        } else {
        	sql = "SELECT * FROM "
            		+ "tbl_BoardView B "
            		+ "INNER JOIN tbl_class C ON B.BoardViewNO = C.CLASSNO "
            		+ "INNER JOIN tbl_program P ON C.PROGRAMNO = P.PROGRAMNO "
            		+ "WHERE STATUS = '" + category + "' "
            		+ "ORDER BY START_DAY_TIME DESC";
        }
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);  
            while(rs.next()) {
            	String BoardViewNo = rs.getString("BoardViewNo");
            	String title = rs.getString("title");
            	String sDate = rs.getString("start_day_time");
            	String eDate = rs.getString("end_day_time");
            	String eNameClass = rs.getString("program_ename");
//            	BoardView BoardView = new BoardView(BoardViewNo, title, sDate, eDate, eNameClass);
//            	BoardViewList.add(BoardView);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return BoardViewList;
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
    
//    public void PwdLong(BoardView login) throws SQLException {
//    	String sql = "UPDATE tbl_user SET LOGIN_CNT = LOGIN_CNT + 1 WHERE userId = ''";
//        try {
//        	connect();
//        	Statement statement = jdbcConnection.createStatement();
//            statement.executeUpdate(sql);
//            statement.close();
//        } catch (Exception e) {
//        	e.printStackTrace();
//        }        
//        disconnect();
//    }
    
}
