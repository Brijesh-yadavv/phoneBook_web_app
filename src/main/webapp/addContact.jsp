<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Contact</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("user");
	if (u == null) {
		session.setAttribute("invalidMsg", "Please Login ...");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid mt-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h1 class="text-center text-success">Add Contact Name</h1>

						<%
						String succ = (String) session.getAttribute("succ");
						String fail = (String) session.getAttribute("fail");
						if (succ != null) {
						%>
						<p class="text-success text-center"><%=succ%></p>

						<%
						session.removeAttribute("succ");
						}
						if (fail != null) {
						%>
						<p class="text-danger text-center"><%=fail%></p>

						<%
						session.removeAttribute("fail");

						}
						%>


						<form action="addContact" method="post">
							<%
							if (u != null) {
							%>
							<input type="hidden" name="id" value="<%=u.getId()%>">

							<%
							}
							%>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Enter
									Name</label> <input type="text" class="form-control" name="name"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Name">

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Email" name="email">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Enter
									Phone No.</label> <input type="number" class="form-control"
									name="number" id="exampleInputPassword1"
									placeholder="Enter Number">
							</div>
							<div class="form-group">

								<textarea required rows="6" cols="" name="about"
									class="form-control" placeholder="Enter About"></textarea>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary mt-2">Add
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