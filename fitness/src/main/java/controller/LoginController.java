package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import model.Login;

@WebServlet("/project/login")
public class LoginController extends HttpServlet {
	private LoginDAO loginDAO;

	public void init() {
		loginDAO = new LoginDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		Login login = new Login(userId, pwd);
		try {
			Login loinInfo = loginDAO.Login(login);
			if (loinInfo.getMessage() == null) {
				HttpSession session = request.getSession();
				session.setAttribute("userId", loinInfo.getUserId());
				session.setAttribute("name", loinInfo.getName());
				session.setAttribute("userRole", loinInfo.getUserRole());
				RequestDispatcher dispatcher = request.getRequestDispatcher("/project/index.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("loginAlert", loinInfo.getMessage());
				RequestDispatcher dispatcher = request.getRequestDispatcher("/project/login.jsp");
				dispatcher.forward(request, response);				
			}

		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}