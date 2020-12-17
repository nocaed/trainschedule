<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Browse and Search</title>
</head>


<body><div>

<% 
if(session.getAttribute("user")==null){
%>
<div>
<h3>You are not logged in</h3>
<a href='index.jsp'>Login</a>
</div>
<% 
} else { 
%>
	
		<h2>Browse and Search Train Schedules</h2>
		
		<br><br><a href='trainSched_dir.jsp'>Search Train Schedules</a>
		<br><br><a href='trainSort_dir.jsp'>Sort All Trains</a>
		<br><br><a href='stops_dir.jsp'>See All Stops of a Train</a>
		<br><br><a href='customer.jsp'>Return to Customer Profile Homepage</a>
		<br><br><a href='logout.jsp'>Logout</a>
		
		 
		<br><br>
		
		 
<%
	
//comment
}
%>

</div></body>
</html>