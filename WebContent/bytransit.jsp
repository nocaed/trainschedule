<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservations by Transit line</title>
</head>
<% 
if(session.getAttribute("user")==null){
%>

You are not logged in<br/>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>
<body>



<% } %>
</body>
</html>