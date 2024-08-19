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

import dao.BoardViewDAO;
import model.BoardView;

@WebServlet("/project/classView")
public class BoardViewController extends HttpServlet {
	private BoardViewDAO boardViewDAO;

	public void init() {
		boardViewDAO = new BoardViewDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String boardNo = request.getParameter("boardNo");
		String action = request.getParameter("action");
		BoardView message = new BoardView();
		RequestDispatcher dispatcher;
		try {
			if("delete".equals(action)) {
				boardViewDAO.deletePage(boardNo);
				return;
			} else if("enroll".equals(action)) {				
				message = boardViewDAO.enrollPage(boardNo, userId);
				request.setAttribute("message", message.getMessage());
				dispatcher = request.getRequestDispatcher("/project/classView.jsp");
			} else if("cancel".equals(action)) {				
				message = boardViewDAO.cancelPage(boardNo, userId);
				request.setAttribute("message", message.getMessage());
				dispatcher = request.getRequestDispatcher("/project/classView.jsp");
			} else {
				BoardView searchPage = boardViewDAO.viewSearch(boardNo);
				request.setAttribute("boardView", searchPage);
				String searchBtn = boardViewDAO.viewBtn(boardNo, userId);
				request.setAttribute("btnView", searchBtn);
				dispatcher = request.getRequestDispatcher("/project/classView.jsp");
			}
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}