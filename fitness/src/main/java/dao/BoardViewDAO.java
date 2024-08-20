package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
        System.out.println(sql);
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
            	String status = rs.getString("status");
            	viewing = new BoardView(boardNo, name, title, contents, hit, cDate, uDate, cNum, cNumCnt, status);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }        
        disconnect();
        return viewing;
    }
    
    // 버튼
    public String viewBtn(String boardNo, String userId) throws SQLException {
    	String viewing = null;
        String sql = "SELECT * FROM tbl_enroll WHERE classNo = '" + boardNo + "' AND userId = '" + userId + "'";
             
        try {
        	connect();
        	Statement statement = jdbcConnection.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            if(rs.next()) {
            	viewing = rs.getString("userId");
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
    
    //강의 등록
    public BoardView enrollPage(String boardNo, String userId) throws SQLException {
    	BoardView message = new BoardView();
    	String selSql = "SELECT * FROM tbl_enroll WHERE classNo = " + boardNo + " AND userId = '" + userId + "'";
    	try {
    		connect();
    		Statement selStatement = jdbcConnection.createStatement();
    		ResultSet rs = selStatement.executeQuery(selSql);
    		if(rs.next()) {
    			 message = new BoardView("이미 등록되었습니다.");
    		} else {
    			if(userId.equals("admin")) message = new BoardView("관리자는 등록이 불가합니다.");
    			else {    				
    				String sql = "INSERT INTO tbl_enroll VALUES(NULL, '" + userId + "', " + boardNo + ", NOW())";
    				String sql2 = "UPDATE tbl_class SET class_num_cnt = class_num_cnt + 1 WHERE classNo = " + boardNo;
    				Statement statement = jdbcConnection.createStatement();
    				Statement statement2 = jdbcConnection.createStatement();
    				statement.executeUpdate(sql);
    				statement2.executeUpdate(sql2);
    				statement.close();
    				statement2.close();
    				message = new BoardView("등록이 완료되었습니다.");
    			}
    		}
    		rs.close();
    		selStatement.close();
    	} catch (Exception e) {
        	e.printStackTrace();
        }
    	disconnect();
    	return message;
    }
    
    //강의 취소
    public BoardView cancelPage(String boardNo, String userId) throws SQLException {
    	BoardView message = new BoardView();
    	String selSql = "SELECT * FROM tbl_enroll WHERE classNo = " + boardNo + " AND userId = '" + userId + "'";
    	try {
    		connect();
    		Statement selStatement = jdbcConnection.createStatement();
    		ResultSet rs = selStatement.executeQuery(selSql);
    		if(rs.next()) {
    			String sql = "DELETE FROM tbl_enroll WHERE classNo = " + boardNo + " AND userId = '" + userId + "'";
        		String sql2 = "UPDATE tbl_class SET class_num_cnt = class_num_cnt - 1 WHERE classNo = " + boardNo;
        		Statement Statement = jdbcConnection.createStatement();
        		Statement Statement2 = jdbcConnection.createStatement();
        		Statement.executeUpdate(sql);
        		Statement.executeUpdate(sql2);
    			Statement.close();
    			Statement2.close();
    			message = new BoardView("취소 되었습니다.");
    		} else {
    			message = new BoardView("등록된 정보가 없습니다.");
    		}
    		
    	} catch (Exception e) {
        	e.printStackTrace();
        }
    	disconnect();
    	return message;
    }
}
