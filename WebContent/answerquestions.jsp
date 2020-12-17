<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answer Questions</title>
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
		<h1>Unanswered Questions:</h1><br>
		<form method='post' action='processAnswers.jsp' name='answerForm'>
		<%
			// fetch all unanswered questions
			CustomerSupportHandler csh = new CustomerSupportHandler();
			ResultSet rs = csh.allUnansweredQuestions();
			// generate a list of radio buttons with said questions, customer rep selects one to answer
			int i = 0;
			while(rs.next()) {
				String question = rs.getString(1);
				String user = rs.getString(3);
				out.println("<input type='radio' id='" + i + "' name=questionRadios value='" + question + "' " + (i == 0 ? "checked" : "") + ">");
				out.println("<label for='" + i + "'>" + question + "</label><br>");
				i++;
			}
		%>
		<label for='answer'>Answer:</label><br>
		<input type='text' id='answer' name='answer' maxlength='255'><br>
		<input type='submit' id='ansSubmit' value='Answer Question'>
		<%
			// do not allow form submission if no questions are loaded
			if(i == 0) {
		%>
		<script>
			document.getElementById("ansSubmit").disabled = true;
		</script>
		<%
			}
		%>
		</form>
		<a href='customerrep.jsp'>Back to home page</a><br>
		<a href='logout.jsp'>Logout</a>
	<%}%>
	</div>
</body>
</html>