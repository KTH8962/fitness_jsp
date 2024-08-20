package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Edit;

public class EditDAO {
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
    
    // 분야 조회
    public List<Edit> Field() throws SQLException {
    	List<Edit> fieldList = new ArrayList<>();
    	String sql = "SELECT * FROM tbl_program";
    	try {
			connect();
			Statement statement = jdbcConnection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				String programName = rs.getString("program_name");
				String programEname = rs.getString("program_ename");
				Edit field = new Edit(programName, programEname);
				fieldList.add(field);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	disconnect();
		return fieldList;    	
    }
    
    // 회원정보 조회
    public Edit Search(String loginId) throws SQLException {
    	Edit editInfo = new Edit();
    	String sql = "SELECT * FROM tbl_user U "
    			+ "LEFT JOIN tbl_program P ON U.FIELD = P.PROGRAM_ENAME "
    			+ "WHERE USERID='" + loginId + "'";
    	try {
			connect();
			Statement statement = jdbcConnection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			if(rs.next()) {
				String userId = rs.getString("userId");
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String field = rs.getString("field");
				editInfo = new Edit(userId, name, birth, phone, email, field);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	disconnect();
    	return editInfo;
    }
    
    // 정보 수정
    public String Edit(Edit editInfo) throws SQLException {
    	String message = null;
    	String userId = editInfo.getUserId();
    	String pwd = editInfo.getPwd().equals("") ? "": ", pwd = '" + editInfo.getPwd() + "'";
    	String phone = editInfo.getPhone();
    	String email = editInfo.getEmail();
    	String field = editInfo.getField() == null ? "NULL" : "'" + editInfo.getField() + "'";
    	try {
    		String sql = "UPDATE tbl_user SET "
    				+ "phone = '" + phone + "', email = '" + email + "', "
    				+ "field = " + field + " " + pwd + " WHERE userId = '" + userId + "'";
    		System.out.println(sql);
			connect();
			Statement statement = jdbcConnection.createStatement();
			statement.executeUpdate(sql);
			statement.close();
			message = "변경되었습니다.";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
    }
}
