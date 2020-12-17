<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Reservations</title>
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
  <div>
  	<h1>Reservations</h1>
		<a href = 'addResrvSched.jsp'>Make a reservation</a> <br>
		<a href = 'browseResrvs.jsp'>Browse reservations</a>

		<%
		Object username = session.getAttribute("user");
		if(username == null) {
			out.println("<h1>You are not logged in.</h1><br>");
			out.println("<a href='index.jsp'>Login</a>");
		} else {
			int age = Integer.parseInt(session.getAttribute("age").toString());
			double discount = Double.parseDouble(session.getAttribute("discount").toString());
		}
		%>
	

  <%}%>
  </div>
</body>
</html>