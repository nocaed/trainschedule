<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browse Questions By Keyword</title>
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
		<h1>Enter Search Keyword</h1>
		<form method="post" action="browseByKeyword.jsp">
		  	<label for="keyword">Keyword:</label><br>
  			<input type="text" id="keyword" name="keyword"><br>
  			<input type="submit" value="Search">
		</form>
		<a href='customer.jsp'>Back to home page</a><br>
		<a href='logout.jsp'>Logout</a>
	<%}%>
	</div>
</body>
</html>