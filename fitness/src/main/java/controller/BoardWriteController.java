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

import dao.BoardWriteDAO;
import model.BoardWrite;

@WebServlet("/project/classWrite")
public class BoardWriteController extends HttpServlet {
	private BoardWriteDAO boardWriteDAO;

	public void init() {
		boardWriteDAO = new BoardWriteDAO();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 요청 인코딩을 UTF-8로 설정
	    response.setContentType("text/html; charset=UTF-8"); // 응답 인코딩을 UTF-8로 설정
	    
		String title = request.getParameter("title");
		String instructorId = request.getParameter("instructorId");
		String programNo = request.getParameter("programNo");
		String roomNo = request.getParameter("roomNo");
		String classNum = request.getParameter("classNum");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String contents = request.getParameter("contents");
		String boardNo = request.getParameter("boardNo");
		try {
			List<BoardWrite> instructorList = boardWriteDAO.instructorSelect();
			request.setAttribute("instructorList", instructorList);
			List<BoardWrite> programList = boardWriteDAO.programSelect();
			request.setAttribute("programList", programList);
			List<BoardWrite> roomList = boardWriteDAO.roomSelect();
			request.setAttribute("roomList", roomList);
			BoardWrite boardWrite = new BoardWrite();
			if(boardNo != null) {
				BoardWrite writeList = boardWriteDAO.boardSelect(boardNo);
				request.setAttribute("writeList", writeList);					
			} 
			if (title != null) {
				if(boardNo != null) {
					boardWrite = new BoardWrite(boardNo, title, instructorId, programNo, roomNo, classNum, sDate, eDate, contents);
					boardWriteDAO.boardWrite(boardWrite);
					response.sendRedirect("/fitness/project/classView?boardNo=" + boardNo);
				} else {
					boardWrite = new BoardWrite(title, instructorId, programNo, roomNo, classNum, sDate, eDate, contents);
					boardWriteDAO.boardWrite(boardWrite);
					response.sendRedirect("/fitness/project/class");
				}
				return;
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/project/classWrite.jsp");
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}