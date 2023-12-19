<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img {
	background: url("images/phon.jpeg");
	width: 100%;
	height: 85vh;
	background-position: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img text-center text-success">
		<h1>Welcome to PhoneBook App</h1>


	</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>