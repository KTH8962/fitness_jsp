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

@WebServlet("/project/find")
public class FindController extends HttpServlet {
	private FindDAO idFindDAO;

	public void init() {
		idFindDAO = new FindDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		Find Find = new Find();
		try {
			String find;
			if(userId == null) {
				Find = new Find(name, email);
				find = idFindDAO.IdFind(Find);
			} else {			
				Find = new Find(userId, name, email);
				find = idFindDAO.PwdFind(Find);
			}
			request.setAttribute("find", find);
			request.setAttribute("name", name);
			request.setAttribute("userId", userId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/project/find_result.jsp");
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}