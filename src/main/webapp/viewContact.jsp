<%@page import="java.util.List"%>
<%@page import="com.entity.Contact"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Contact</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #b8c2c2;
}
</style>

</head>
<body style="background-color: #a9ebea">
	<%@include file="all_component/navbar.jsp"%>


	<%
	User u = (User) session.getAttribute("user");
	if (u == null) {
		session.setAttribute("invalidMsg", "Login Please ...");

		response.sendRedirect("login.jsp");
	}
	%>




	<%
	if (u != null) {
	%>
	<h1 class="text-center text-success">
		Hey,
		<%=u.getName()%>
		your Contacts are:----
	</h1>
	<%
	}
	%>


	<%
	String succ = (String) session.getAttribute("succ");
	String fail = (String) session.getAttribute("fail");
	if (succ != null) {
	%>
	<div class="alert alert-success text-center" role="alert"><%=succ%></div>
	<%
	session.removeAttribute("succ");
	}
	%>
	<%
	if (fail != null) {
	%>
	<p class="text-danger text-center"><%=fail%></p>

	<%
	session.removeAttribute("fail");

	}
	%>

	<div class="container">
		<div class="row p-5">
			<%
			if (u != null) {
				ContactDAO dao = new ContactDAO(DBConnect.getConn());
				List<Contact> cont = dao.getAllContact(u.getId());
				for (Contact c : cont) {
			%>
			<div class="col-md-3">

				<div class="card crd-ho ">
					<div class="card-body">
						<h5>
							Name:
							<%=c.getName()%></h5>
						<p>
							Email:
							<%=c.getEmail()%></p>
						<p>
							Phone NO:
							<%=c.getphno()%></p>
						<p>
							About:
							<%=c.getAbout()%></p>
						<div class="text-center">
							<a href="editContact.jsp?cid=<%=c.getId()%>"
								class="btn btn-success btn-sm text-white">Edit</a> <a
								href="delete?cid=<%=c.getId()%>"
								class="btn btn-danger  btn-sm text-white">Delete</a>

						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>




		</div>

	</div>
</body>
</html>