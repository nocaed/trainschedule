<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
</head>
<body>


<% 
if(session.getAttribute("user")==null){
%>

You are not logged in<br/>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>

<center><h1>Welcome to the Administrator's profile</h1>	
	<br>
	<h2>Tools:</h2>
	<!-- comment -->
	<!-- comment2 -->
	<% 
	/*
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	Statement st = con.createStatement();
	ResultSet rs;
	*/
	%>
	
	<br><a href='manage.jsp'>Manage Customer Representatives</a>
	<br><br><a href='sales.jsp'>Sales Report by month</a>
	<br><br><a href='bytransit'>List of Reservations by Transit Line</a>
	<br><br><a href='bycustomer'>List of Reservations by Customer Name</a>
	<br><br><a href='transitRev'>List of Revenue per Transit Line</a>
	<br><br><a href='customerRev'>List of Revenue per Customer Name</a>
	<br><br><a href='logout.jsp'>Logout</a>
	
	<% 
	} 
	%>

</center>
</body>
</html>