package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Login;

public class LoginDAO {
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
    
    public Login Login(Login login) throws SQLException {
    	Login loinInfo = null;
        String sql = "SELECT * FROM tbl_user WHERE userId = '" + login.getUserId() + "'";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            if(rs.next()) {
            	String pwd = rs.getString("pwd");
            	String name = rs.getString("name");
                String userRole = rs.getString("user_role");
            	int loginCnt = rs.getInt("LOGIN_CNT");
            	boolean isActive = rs.getBoolean("is_active");
            	if(loginCnt >= 5) {
            		loinInfo = new Login("비밀번호 횟수 초과상태입니다. 고객센터에 문의해주세요.");
            	} else {
            		if(isActive) {
            			if(login.getPwd().equals(pwd)) {
            				PwdReset(login);            			
            				loinInfo = new Login(login.getUserId(), name, userRole);
            			} else {
            				PwdLong(login);
            				loinInfo = new Login("비밀번호가 틀렸습니다.");
            			}
            		} else {
            			loinInfo = new Login("심사대기중인 아이디입니다. 고객센터에 문의해주세요.");
            		}
            	}
            } else {
            	loinInfo = new Login("아이디가 없습니다.");
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return loinInfo;
    }
    
    public void PwdReset(Login login) throws SQLException {
    	String sql = "UPDATE tbl_user SET LOGIN_CNT = 0 WHERE userId = '" + login.getUserId() + "'";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            statement.executeUpdate(sql);
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
    }
    
    public void PwdLong(Login login) throws SQLException {
    	String sql = "UPDATE tbl_user SET LOGIN_CNT = LOGIN_CNT + 1 WHERE userId = '" + login.getUserId() + "'";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            statement.executeUpdate(sql);
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
    }
    
}
