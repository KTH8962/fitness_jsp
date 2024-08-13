package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Find;

public class FindDAO {
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
    
    public String IdFind(Find idFind) throws SQLException {
    	String idInfo = "";
        String sql = "SELECT * FROM tbl_user WHERE name = '" + idFind.getName() + "' AND email = '" + idFind.getEmail() + "'";
        System.out.println(sql);
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            if(rs.next()) {
            	idInfo = rs.getString("userId");
            } else {
            	idInfo = "";
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return idInfo;
    }
    
    public String PwdFind(Find pwdFind) throws SQLException {
    	String pwdInfo = "";
        String sql = "SELECT * FROM tbl_user WHERE userid = '" + pwdFind.getUserId() + "' AND name = '" + pwdFind.getName() + "' AND email = '" + pwdFind.getEmail() + "'";
        System.out.println(sql);
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            if(rs.next()) {
            	pwdInfo = rs.getString("pwd");
            } else {
            	pwdInfo = "";
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return pwdInfo;
    }
}
