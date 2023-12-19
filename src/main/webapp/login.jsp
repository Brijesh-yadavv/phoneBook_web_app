<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register User</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body style="background-color: #f7faf8">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid mt-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h1 class="text-center text-success">Login Page</h1>
						<%
						String invalidMsg = (String) session.getAttribute("invalidMsg");
						if (invalidMsg != null) {
						%>
						<p class="text-danger text-center"><%=invalidMsg%></p>

						<%
						session.removeAttribute("invalidMsg");
						}
						%>

						<%
						String logMsg = (String) session.getAttribute("logMsg");
						if (logMsg != null) {
						%>
						<p class="text-success text-center"><%=logMsg%></p>

						<%
						session.removeAttribute("logMsg");
						}
						%>
						<form action="login" method="post">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Email" name="email">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" name="password"
									id="exampleInputPassword1" placeholder="Enter Password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary mt-2">Login</button>

							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 270px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>