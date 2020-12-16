<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Homepage</title>
</head>
<body>
	<div>
	<%
	if(session.getAttribute("user")==null){
	%>
		<h3>You are not logged in</h3>
		<a href='index.jsp'>Login</a>
	<%
	} else {
		out.println("<h1>Welcome " + session.getAttribute("name") +"!</h1><br>");
	%>
		<a href='browsing.jsp'>Browse Schedules</a><br>
		<a href='reservations.jsp'>Make a Reservation</a><br>
		<a href='customerquestions.jsp'>Ask/Search Questions</a><br>
		<a href='logout.jsp'>Logout</a>
	<%}%>
	</div>
</body>
</html>