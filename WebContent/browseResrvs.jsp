<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Browse Reservations</title>
</head>
<body>

	<div>
  		<%
    		if(session.getAttribute("user") == null) {
  		%>
  		<h3>You are not logged in</h3>
  		<a href='index.jsp'>Login</a>
  		<%
    		} else {
  		%>
		<a href='currentResrv.jsp'>Current Reservations</a><br>
		<a href='pastResrv.jsp'>Past Reservations</a>
  	<%}%>
  	</div>

</body>
</html>