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

import dao.AdminDAO;
import model.Admin;

@WebServlet("/project/admin")
public class AdminController extends HttpServlet {
	private AdminDAO adminDAO;

	public void init() {
		adminDAO = new AdminDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String snb = request.getParameter("snb") == null ? "user" : request.getParameter("snb");
		
		try {
			if(snb.equals("user")) {
				List<Admin> userList = adminDAO.userPage();
				request.setAttribute("userList", userList);
			} else if(snb.equals("board")) {
				List<Admin> boardList = adminDAO.boardPage();
				request.setAttribute("boardList", boardList);
			} else if(snb.equals("class")) {
				List<Admin> classList = adminDAO.classPage();
				request.setAttribute("classList", classList);
			} else if(snb.equals("enroll")) {
				List<Admin> enrollList = adminDAO.enrollPage();
				request.setAttribute("enrollList", enrollList);
			} else if(snb.equals("program")) {
				List<Admin> programList = adminDAO.programPage();
				request.setAttribute("programList", programList);
			} else if(snb.equals("room")) {
				List<Admin> roomList = adminDAO.roomPage();
				request.setAttribute("roomList", roomList);
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/project/admin.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}