<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ask a Question</title>
</head>
<body>
		<%
		// get username from session
		String username = session.getAttribute("user").toString();
		// get question from input form
		String q = request.getParameter("question");
		// prepare and execute query
		CustomerSupportHandler csh = new CustomerSupportHandler();
		csh.askNewQuestion(username, q);
		// display success message and redirect user to question homepage
		out.println("<h1>Success!</h1><br><a href='customerquestions.jsp'>Return to customer service page</a>");
		%>
</body>
</html>