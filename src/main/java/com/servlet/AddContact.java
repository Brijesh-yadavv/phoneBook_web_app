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
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContact extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phno = req.getParameter("number");
		String about = req.getParameter("about");
		
		Contact c=new Contact(name,email,phno,about,id);
		
		ContactDAO dao=new ContactDAO(DBConnect.getConn());
		boolean f=dao.saveContact(c);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("succ", "Your Contact Saved..");
			resp.sendRedirect("addContact.jsp");
		}
		else {
			session.setAttribute("fail", "Failed Saving Contact...Something went wrong on server");
			
			resp.sendRedirect("addContact.jsp");
		}

	}

}
