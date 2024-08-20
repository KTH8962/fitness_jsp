package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Admin;

public class AdminDAO {
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
    
    // 유저 정보 조회
    public List<Admin> userPage() throws SQLException {
    	List<Admin> userList = new ArrayList<>();
        String sql = "SELECT * FROM tbl_user";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);  
            while(rs.next()) {
            	String userId = rs.getString("userId");
            	String pwd = rs.getString("pwd");
            	String pwdChagned = rs.getString("pwd_changed");
            	String name = rs.getString("name");
            	String birth = rs.getString("birth");
            	String phone = rs.getString("phone");
            	String email = rs.getString("email");
            	String loginCnt = rs.getString("login_cnt");
            	String createDay = rs.getString("create_day");
            	String isActive = rs.getString("is_active");
            	String userRole = rs.getString("user_role");
            	String field = rs.getString("field") == null ? "없음" : rs.getString("field");
            	Admin user = new Admin(userId, pwd, pwdChagned, name, birth, phone, email, loginCnt, createDay, isActive, userRole, field);
            	userList.add(user);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return userList;
    }
    
    // 강의 목록 조회
    public List<Admin> boardPage() throws SQLException {
    	List<Admin> classList = new ArrayList<>();
        String sql = "SELECT * FROM tbl_board ORDER BY BOARDNO DESC";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);  
            while(rs.next()) {
            	String boardNo = rs.getString("boardNo");
            	String userId = rs.getString("userId");
            	String title = rs.getString("title");
            	String contents = rs.getString("contents");
            	String hit = rs.getString("hit");
            	String cdatetime = rs.getString("cdatetime");
            	String udatetime = rs.getString("udatetime");
            	Admin board = new Admin(boardNo, userId, title, contents, hit, cdatetime, udatetime);
            	classList.add(board);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return classList;
    }
    
    // 강의 정보 조회
    public List<Admin> classPage() throws SQLException {
    	List<Admin> classList = new ArrayList<>();
        String sql = "SELECT * FROM "
        		+ "tbl_class C "
        		+ "INNER JOIN tbl_user U ON C.INSTRUCTOR_ID = U.USERID "
        		+ "INNER JOIN tbl_program P ON C.PROGRAMNO = P.PROGRAMNO "
        		+ "INNER JOIN tbl_room R ON C.ROOMNO = R.ROOMNO "
        		+ "ORDER BY CLASSNO DESC;";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);  
            while(rs.next()) {
            	String classNo = rs.getString("classNo");
            	String programName = rs.getString("program_name");
            	String roomName = rs.getString("roomName");
            	String classNum = rs.getString("class_num");
            	String classNumCnt = rs.getString("class_num_cnt");
            	String sDate = rs.getString("start_day_time");
            	String eDate = rs.getString("end_day_time");
            	String name = rs.getString("name");
            	String status = rs.getString("status");
            	Admin board = new Admin(classNo, programName, roomName, classNum, classNumCnt, sDate, eDate, name, status);
            	classList.add(board);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return classList;
    }
    
    // 강의 신청 조회
    public List<Admin> enrollPage() throws SQLException {
    	List<Admin> enrollList = new ArrayList<>();
        String sql = "SELECT * FROM "
        		+ "tbl_enroll E "
        		+ "INNER JOIN tbl_user U ON E.USERID = U.USERID";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);  
            while(rs.next()) {
            	String enrollNo = rs.getString("enrollNo");
            	String name = rs.getString("name");
            	String classNo = rs.getString("classNo");
            	String enrollDate = rs.getString("enroll_date");
            	Admin enroll = new Admin(enrollNo, name, classNo, enrollDate);
            	enrollList.add(enroll);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return enrollList;
    }
    
    // 강의실 조회
    public List<Admin> programPage() throws SQLException {
    	List<Admin> programList = new ArrayList<>();
        String sql = "SELECT * FROM tbl_program";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);  
            while(rs.next()) {
            	String programNo = rs.getString("programNo");
            	String programName = rs.getString("program_name");
            	String programEname = rs.getString("program_ename");
            	Admin program = new Admin(programNo, programName, programEname);
            	programList.add(program);
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
    public List<Admin> roomPage() throws SQLException {
    	List<Admin> roomList = new ArrayList<>();
        String sql = "SELECT * FROM tbl_room";
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);  
            while(rs.next()) {
            	String roomNo = rs.getString("roomNo");
            	String roomName = rs.getString("roomName");
            	String location = rs.getString("location");
            	Admin room = new Admin(roomNo, roomName, location);
            	roomList.add(room);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return roomList;
    }
}
