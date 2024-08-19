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

import dao.BoardDAO;
import model.Board;

@WebServlet("/project/admin")
public class AdminController extends HttpServlet {
	private BoardDAO boardDAO;

	public void init() {
		boardDAO = new BoardDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/project/admin.jsp");
		dispatcher.forward(request, response);
//		try {
//
//		} catch (SQLException e) {
//			throw new ServletException(e);
//		}
	}
}