<%@page import="com.entity.Contact"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Contact Page</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("user");
	if (u == null) {
		session.setAttribute("invalidMsg", "Login Please ...");

		response.sendRedirect("login.jsp");
	}
	%>

	<div class="container-fluid mt-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h1 class="text-center text-success">Edit Contact....</h1>

						<%
						String fail = (String) session.getAttribute("fail");
						
						if (fail != null) {
						%>
						<p class="text-danger text-center"><%=fail%></p>

						<%
						session.removeAttribute("fail");

						}
						%>


						<form action="updateContact" method="post">

							<%
							int cid = Integer.parseInt(request.getParameter("cid"));

							ContactDAO dao = new ContactDAO(DBConnect.getConn());
							Contact c = dao.getContactById(cid);
							%>
			<input type="hidden" value="<%=cid %>" name="cid">
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Enter
									Name</label> <input type="text" class="form-control" name="name"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=c.getName()%>">

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=c.getEmail()%>" name="email">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Enter
									Phone No.</label> <input type="number" class="form-control"
									name="number" id="exampleInputPassword1"
									value="<%=c.getphno()%>">
							</div>
							<div class="form-group">

								<textarea required rows="6" cols="" name="about"
									class="form-control"><%=c.getAbout()%></textarea>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary mt-2">Update
									Contact</button>

							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>