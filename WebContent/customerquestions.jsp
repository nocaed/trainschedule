<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Support</title>
</head>
<body>
	<div>
		<h1>This is the customer support page!</h1><br>
		<%
		Object username = session.getAttribute("user");
		if(username == null) {
			out.println("<h1>You are not logged in.</h1><br>");
			out.println("<a href='index.jsp'>Login</a>");
		} else {
			out.println("<a href='browsequestions.jsp'>Browse Questions and Answers</a><br>");
			out.println("<a href='askquestionform.jsp'>Ask a Question</a>");
		}
		%>
	</div>
</body>
</html>