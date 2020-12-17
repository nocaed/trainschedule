<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Customer Support</title>
</head>
<body>
	<div>
		<h1>Welcome to Customer Support!</h1><br>
		<%
		if(session.getAttribute("user")==null){
		%>
		<h3>You are not logged in</h3>
		<a href='index.jsp'>Login</a>
		<%
		} else { 
		%>
		<a href='browsequestions.jsp'>Browse All Questions and Answers</a><br>
		<a href='customerquestionkeyword.jsp'>Browse Questions and Answers By Keyword</a><br>
		<a href='askquestionform.jsp'>Ask a Question</a><br>
		<a href='customer.jsp'>Back to home page</a><br>
		<a href='logout.jsp'>Logout</a>
		<%}%>
	</div>
</body>
</html>