//package dao;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//
//import javax.servlet.ServletException;
//
//import model.Login;
//
//public class LoginDAO {
//	private String jdbcURL = "jdbc:mysql://localhost:3306/fitness";
//    private String jdbcUsername = "root";
//    private String jdbcPassword = "test1234";
//    private Connection jdbcConnection;
//
//    // 데이터베이스 연결
//    protected void connect() throws SQLException {
//        if (jdbcConnection == null || jdbcConnection.isClosed()) {
//            try {
//                Class.forName("com.mysql.jdbc.Driver");
//            } catch (ClassNotFoundException e) {
//                throw new SQLException(e);
//            }
//            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
//        }
//    }
//
//    // 데이터베이스 연결 해제
//    protected void disconnect() throws SQLException {
//        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
//            jdbcConnection.close();
//        }
//    }
//
//    // tbl_user 테이블의 모든 사용자 가져오기
//    public boolean Login(Login login) throws SQLException {
//    	boolean isValid = false;
//        String sql = "SELECT * FROM tbl_user WHERE userId = '" + login.getUserId() + "' AND pwd = '" + login.getPwd() + "'";
//
//        try {
//        	connect();
//        	
//        } catch (Exception e) {
//        	e.printStackTrace();
//        }
//
//        Statement statement = jdbcConnection.createStatement();
//        ResultSet rs = statement.executeQuery(sql);
//
//        if(rs.next()) {
//        	isValid = true;
//        }
//        rs.close();
//        statement.close();
//        disconnect();       
//
//        System.out.println(isValid);
//        return isValid;
//    }
//}
