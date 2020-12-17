<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Browse Questions and Answers</title>
</head>
<body>
	<div>
		<h1>View All Questions and Answers</h1><br>
		<%
		// check if user is logged in
		Object username = session.getAttribute("user");
		if(username == null) {
			out.println("<h1>You are not logged in.</h1><br>");
			out.println("<a href='index.jsp'>Login</a>");
		} else {
			out.println("<table width='100%'><tr><th>Asked By</th><th>Question</th><th>Answer</th></tr>");
			// abstraction of customer support object
			CustomerSupportHandler csh = new CustomerSupportHandler();
			// get all questions in database
			ResultSet questions = csh.getQuestions();
			// go through every question and insert it as a new row into the database
			while(questions.next()) {
				// get individual values
				String question = questions.getString(1);
				String answer = questions.getString(2) == null ? "Unresolved" : questions.getString(2);
				String user = questions.getString(3);
				// create tablel row
				out.println("<tr>" + 
				"<td>" + user + "</td>" +
				"<td>" + question + "</td>" +
				"<td>" + answer + "</td>" +
				"</tr>");
			}
			out.println("</table>");
			out.println("<a href='customer.jsp'>Back to home page</a><br>");
			out.println("<a href='logout.jsp'>Logout</a>");
		}
		%>
	</div>
</body>
</html>