package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

    public boolean idCheck(Login login) throws SQLException {
    	boolean isValid = false;
        String sql = "SELECT * FROM tbl_user WHERE userId = '" + login.getUserId() + "'";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            if(rs.next()) {
            	isValid = true;
            } else {
            	isValid = false;
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return isValid;
    }
    
    public boolean Login(Login login) throws SQLException {
    	boolean isValid = false;
        String sql = "SELECT * FROM tbl_user WHERE userId = '" + login.getUserId() + "'";
        //+ "' AND pwd = '" + login.getPwd() 
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            if(rs.next()) {
            	String pwd = rs.getString("pwd");
            	int loginCnt = rs.getInt("LOGIN_CNT");
            	if(loginCnt >= 5) {
            		isValid = false;
            	} else {
            		if(login.getPwd().equals(pwd)) {
            			PwdReset(login);
            			isValid = true;            		
            		} else {
            			PwdLong(login);
            			isValid = false;
            		}
            	}
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return isValid;
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
