<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Home Page</title>
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
	%>
		<h1>Welcome Customer Representative!</h1><br>
		<a href='answerquestions.jsp'>Answer Customer Questions</a><br>
		<a href='schedulebystation.jsp'>View Train Schedules by Station</a><br>
		<a href='customersbyreservationform.jsp'>Find Customers By Transit Line and Reservation Date</a><br>
		<a href='logout.jsp'>Logout</a>
		<%}%>
	</div>
</body>
</html>