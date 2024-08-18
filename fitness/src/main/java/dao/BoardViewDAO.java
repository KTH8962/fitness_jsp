package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.BoardView;

public class BoardViewDAO {
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
    
    // 게시글보기
    public BoardView viewSearch(String boardNo) throws SQLException {
    	BoardView viewing = new BoardView();
        String sql = "SELECT * FROM tbl_board B INNER JOIN tbl_user U ON B.USERID = U.USERID INNER JOIN tbl_class C ON B.BOARDNO = C.CLASSNO WHERE boardNo = '" + boardNo + "'";
             
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            if(rs.next()) {
            	String name = rs.getString("name");
            	String title = rs.getString("title");
            	String contents = rs.getString("contents");
            	String hit = rs.getString("hit");
            	String cDate = rs.getString("cdatetime");
            	String uDate = rs.getString("udatetime");
            	String cNum = rs.getString("class_num");
            	String cNumCnt = rs.getString("class_num_cnt");
            	viewing = new BoardView(boardNo, name, title, contents, hit, cDate, uDate, cNum, cNumCnt);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return viewing;
    }
    
    //게시글 삭제
    public void deletePage(String boardNo) throws SQLException {
    	String sql = "DELETE FROM tbl_board WHERE boardNo = '" + boardNo +"'";
    	String sql2 = "DELETE FROM tbl_class WHERE classNo = '" + boardNo +"'";
    	try {
    		connect();
    		Statement statement = jdbcConnection.createStatement();
    		Statement statement2 = jdbcConnection.createStatement();
    		statement.executeUpdate(sql);
    		statement2.executeUpdate(sql2);
    		statement.close();
    		statement2.close();
    	} catch (Exception e) {
        	e.printStackTrace();
        }
    	disconnect();
    }
}
