package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Board;

public class BoardDAO {
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
    
    public List<Board> AllBoard(String category) throws SQLException {
    	List<Board> boardList = new ArrayList<>();
        String sql = null;
        if(category.equals("ALL")) {
        	sql = "SELECT * FROM "
            		+ "tbl_board B "
            		+ "INNER JOIN tbl_class C ON B.BOARDNO = C.CLASSNO "
            		+ "INNER JOIN tbl_program P ON C.PROGRAMNO = P.PROGRAMNO "
            		+ "ORDER BY START_DAY_TIME DESC";
        } else {
        	sql = "SELECT * FROM "
            		+ "tbl_board B "
            		+ "INNER JOIN tbl_class C ON B.BOARDNO = C.CLASSNO "
            		+ "INNER JOIN tbl_program P ON C.PROGRAMNO = P.PROGRAMNO "
            		+ "WHERE STATUS = '" + category + "' "
            		+ "ORDER BY START_DAY_TIME DESC";
        }
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);  
            while(rs.next()) {
            	String boardNo = rs.getString("boardNo");
            	String title = rs.getString("title");
            	String sDate = rs.getString("start_day_time");
            	String eDate = rs.getString("end_day_time");
            	String eNameClass = rs.getString("program_ename");
            	Board board = new Board(boardNo, title, sDate, eDate, eNameClass);
            	boardList.add(board);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return boardList;
    }
}
