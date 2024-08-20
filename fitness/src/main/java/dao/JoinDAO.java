package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import model.Join;

public class JoinDAO {
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
    
    // 회원가입
    public Join Join(Join join) throws SQLException {
    	Join joinInfo = new Join();
    	String userId = join.getUserId();
    	String pwd = join.getPwd();
    	String name = join.getName();
    	String birth = join.getBirth();
    	String phone = join.getPhone();
    	String email = join.getEmail();
    	String userRole = join.getUserRole();
    	String field = join.getField();
    	Boolean isActive = userRole.equals("MEMBER") ? true : false;
    	String sql;
    	if(userRole.equals("MEMBER")) {
    		sql = "INSERT INTO tbl_user VALUES('" + userId + "', '" + pwd + "', NOW() , '" + name + "', '" + birth + "', '" + phone + "', '" + email + "', 0, NOW(), " + isActive + ", '" + userRole + "', NULL)";
    	} else {
    		sql = "INSERT INTO tbl_user VALUES('" + userId + "', '" + pwd + "', NOW() , '" + name + "', '" + birth + "', '" + phone + "', '" + email + "', 0, NOW(), " + isActive + ", '" + userRole + "', '" + field + "')";
    	}
    	
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            statement.executeUpdate(sql);
            joinInfo = new Join(userId, name, userRole);
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return joinInfo;
    }
}
