<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ask a Question</title>
</head>
<body>
	<div>
		<h1>Ask a Question</h1>
		<form method="post" action="askQuestion.jsp">
		  	<label for="question">Question (Max 255 characters):</label><br>
  			<input type="text" id="question" name="question" maxlength="255"><br>
  			<input type="submit" value="Submit">
		</form>
	</div>
</body>
</html>