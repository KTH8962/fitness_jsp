package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;

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
            // 모든 사용자 정보를 가져옴
            boolean loginUser = loginDAO.Login(login);
            if(loginUser) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/project/join.jsp");
                dispatcher.forward(request, response);
            } else {
            	RequestDispatcher dispatcher = request.getRequestDispatcher("/project/login.jsp");
                dispatcher.forward(request, response);
            }
            
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}