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

import dao.BoardViewDAO;
import model.BoardView;

@WebServlet("/project/classView")
public class BoardViewController extends HttpServlet {
	private BoardViewDAO boardViewDAO;

	public void init() {
		boardViewDAO = new BoardViewDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardNo = request.getParameter("boardNo");

		try {
			BoardView searchPage = boardViewDAO.viewSearch(boardNo);
			request.setAttribute("boardView", searchPage);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/project/classView.jsp");
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}