<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Browse</title>
</head>
<body>
<% 
if(session.getAttribute("user")==null){
%>

You are not logged in<br/>
<a href='index.jsp'>Login</a>
<% } else { %>

	<h1>This is the browsing page!</h1>
<%
	
//comment
}
%>
</body>
</html>