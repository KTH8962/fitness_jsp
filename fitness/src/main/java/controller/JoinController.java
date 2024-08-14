package controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.JoinDAO;
import model.Join;

@WebServlet("/project/join")
public class JoinController extends HttpServlet {
	private JoinDAO joinDAO;

	public void init() {
		joinDAO = new JoinDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 요청 인코딩을 UTF-8로 설정
	    response.setContentType("text/html; charset=UTF-8"); // 응답 인코딩을 UTF-8로 설정
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String userRole = request.getParameter("userRole");
		String field = request.getParameter("field");
		Join join = new Join(userId, pwd, name, birth, phone, email, userRole, field);
		
		try {
			Join id = joinDAO.Join(join);
			request.setAttribute("joinInfo", id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/project/join_result.jsp");
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}