<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answer Submission</title>
</head>
<body>
	<div>
		<%
		// Get question and answer from input form
		String answer = request.getParameter("answer").toString();
		String question = request.getParameter("questionRadios").toString();
		// Get username
		String username = session.getAttribute("user").toString();
		
		// Establish db connection
		Connection conn = new ApplicationDB().getConnection();
		ResultSet rs = conn.createStatement().executeQuery("select ssn from Employee where username='" + username + "';");
		// update database if employeee exists in database and answer is not empty
		if(rs.next() && !answer.replace(" ", "").equals("")) {
			// Get ssn of employee
			String ssn = rs.getString(1);
			// update in db
			CustomerSupportHandler csh = new CustomerSupportHandler();
			csh.answerQuestion(question, answer, ssn);
			// display success message and redirect user to question homepage
			out.println("<h1>Success!</h1><br><a href='answerquestions.jsp'>Back</a>");
		} else {
			out.println("<h1>Error, please try again.</h1><br><a href='answerquestions.jsp'>Back</a>");
		}
		%>
	</div>
</body>
</html>