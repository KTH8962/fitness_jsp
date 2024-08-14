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
    
    public BoardView viewSearch(String boardNo) throws SQLException {
    	BoardView viewing = new BoardView();
        String sql = "SELECT * FROM tbl_board B INNER JOIN tbl_user U ON B.USERID = U.USERID WHERE boardNo = '" + boardNo + "'";
             
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
            	viewing = new BoardView(boardNo, name, title, contents, hit, cDate, uDate);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return viewing;
    }
    
}
