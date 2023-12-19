package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/register")
public class Register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String pass=req.getParameter("password");
		
		User u=new User(name,email,pass);
		UserDAO dao=new UserDAO(DBConnect.getConn());
		boolean bol=dao.userRegister(u);
		HttpSession session=req.getSession();
		
		if(bol) {
//			System.out.println("registered success");
			session.setAttribute("succMsg", "User Registered successfully..........");
			resp.sendRedirect("register.jsp");

		}
		else {
//			System.out.println("erroe occured");
			session.setAttribute("errorMsg", "Something Went Wrong");
			resp.sendRedirect("register.jsp");


		}
		
		
	}
}
