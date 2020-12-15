<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browse Questions and Answers</title>
</head>
<body>
	<div>
		<h1>This is the customer support page!</h1><br>
		<table width="100%">
		<tr>
			<th>Asked By</th>
			<th>Question</th>
			<th>Answer</th>
		</tr>
		<%
		// check if user is logged in
		Object username = session.getAttribute("user");
		if(username == null) {
			out.println("<h1>You are not logged in.</h1><br>");
			out.println("<a href='index.jsp'>Login</a>");
		} else {
			// abstraction of customer support object
			CustomerSupportHandler csh = new CustomerSupportHandler();
			// get all questions in database
			ResultSet questions = csh.getQuestions();
			// go through every question and insert it as a new row into the database
			while(questions.next()) {
				// get individual values
				String question = questions.getString(1);
				String answer = questions.getString(2) == null ? "Unresolved" : questions.getString(2);
				String user = questions.getString(4);
				// create tablel row
				out.println("<tr>" + 
				"<td>" + user + "</td>" +
				"<td>" + question + "</td>" +
				"<td>" + answer + "</td>" +
				"</tr>");
			}
		}
		%>
		</table>
	</div>
</body>
</html>