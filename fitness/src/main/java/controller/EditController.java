package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EditDAO;
import model.Edit;

@WebServlet("/project/edit")
public class EditController extends HttpServlet {
	private EditDAO editDAO;

	public void init() {
		editDAO = new EditDAO();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 요청 인코딩을 UTF-8로 설정
	    response.setContentType("text/html; charset=UTF-8"); // 응답 인코딩을 UTF-8로 설정
	    HttpSession session = request.getSession();
	    String loginId = (String) session.getAttribute("userId");
	    String userRole = (String) session.getAttribute("userRole");
	    if(userRole == null) {
	    	response.sendRedirect("error.jsp");
	    	return;
	    }
	    String pwd = request.getParameter("pwd");
	    String phone = request.getParameter("phone");
	    String email = request.getParameter("email");
	    String field = request.getParameter("field");
		
		try {
			if(phone != null && email != null) {
				Edit editInfo = new Edit(loginId, pwd, phone, email, field);
				String message = editDAO.Edit(editInfo);
				request.setAttribute("message", message);
			}
			if(userRole.equals("TEACHER")) {				
				List<Edit> fieldList = editDAO.Field();
				request.setAttribute("fieldList", fieldList);
			}
			Edit loginInfo = editDAO.Search(loginId);
			request.setAttribute("loginInfo", loginInfo);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/project/edit.jsp");
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}