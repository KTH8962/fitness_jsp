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

@WebServlet("/project/idFind")
public class IdFindController extends HttpServlet {
	private FindDAO idFindDAO;

	public void init() {
		idFindDAO = new FindDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Find idFind = new Find(name, email);
		try {
			String id = idFindDAO.IdFind(idFind);
			request.setAttribute("idFind", id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/project/idFind_result.jsp");
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}