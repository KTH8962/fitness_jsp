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

import dao.BoardWriteDAO;
import model.BoardWrite;

@WebServlet("/project/classWrite")
public class BoardWriteController extends HttpServlet {
	private BoardWriteDAO boardWriteDAO;

	public void init() {
		boardWriteDAO = new BoardWriteDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			List<BoardWrite> instructorList = boardWriteDAO.instructorSelect();
			request.setAttribute("instructorList", instructorList);
			List<BoardWrite> programList = boardWriteDAO.programSelect();
			request.setAttribute("programList", programList);
			List<BoardWrite> roomList = boardWriteDAO.roomSelect();
			request.setAttribute("roomList", roomList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/project/classWrite.jsp");
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}