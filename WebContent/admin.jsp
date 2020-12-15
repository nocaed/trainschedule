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
<h3>You are not logged in</h3>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>

<center><h1>Welcome to the Administrator's profile</h1>	
	<br>
	<h2>Tools:</h2>
	<br><a href='addCR.jsp'>Add Representative</a>
	<br><br><a href='editCR.jsp'>Edit Existing Representative</a>
	<br><br><a href='deleteCR.jsp'>Delete Existing Representative</a>
	<br><br><a href='sales.jsp'>Sales Report by month</a>
	<br><br><a href='bytransit.jsp'>List of Reservations by Transit Line</a>
	<br><br><a href='bycustomer.jsp'>List of Reservations by Customer Name</a>
	<br><br><a href='transitRev.jsp'>List of Revenue per Transit Line</a>
	<br><br><a href='customerRev.jsp'>List of Revenue per Customer Name</a>
	<br><br><a href='bestcustomer.jsp'>Best Customer</a>
	<br><br><a href='logout.jsp'>Logout</a>
	
	<% 
	} 
	%>

</center>
</body>
</html>