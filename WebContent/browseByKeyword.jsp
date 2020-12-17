<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Keyword Results</title>
</head>
<body>
	<div>
		<%
		// get username from session
		String username = session.getAttribute("user").toString();
		// get question from input form
		String k = request.getParameter("keyword");
		out.println("<h1>Results from keyword " + k + ":</h1>");
		// fetch all questions that contain the keyword
		CustomerSupportHandler csh = new CustomerSupportHandler();
		ResultSet questions = csh.searchByKeyword(k);
		%>
		<table width='100%'>
			<tr>
				<th>Asked By</th>
				<th>Question</th>
				<th>Answer</th>
			</tr>
			<%
				while(questions.next()) {
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
			%>
		</table>
		<a href='customer.jsp'>Back to home page</a><br>
		<a href='logout.jsp'>Logout</a>
	</div>
</body>
</html>