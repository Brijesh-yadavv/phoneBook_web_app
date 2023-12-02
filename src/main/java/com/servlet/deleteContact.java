package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.ContactDAO;

@WebServlet("/delete")
public class deleteContact extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cid=Integer.parseInt(req.getParameter("cid"));
		ContactDAO dao=new ContactDAO(DBConnect.getConn());
		boolean f=dao.deleteContactById(cid);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("succ", "Contact Deleted Successfully");
			resp.sendRedirect("viewContact.jsp");
		}
		else {
			session.setAttribute("fail", "Something Went Wrong on server.....");
			resp.sendRedirect("viewContact.jsp");
		}
	}

}
