package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FindDAO;
import model.Find;

@WebServlet("/project/pwdFind")
public class PwdFindController extends HttpServlet {
	private FindDAO idFindDAO;

	public void init() {
		idFindDAO = new FindDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Find idFind = new Find(userId, name, email);
		try {
			String findId = idFindDAO.PwdFind(idFind);
			request.setAttribute("idFind", findId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/project/pwdFind_result.jsp");
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}