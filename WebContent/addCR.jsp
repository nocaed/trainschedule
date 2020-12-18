<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Add Customer Representative</title>
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
<h2>Add Information for New Customer Representative</h2>
<table>
<tr>

	
		<td><label for="ssn">SSN in Format ###-##-####:</label></td>
		<td><input type="text" id="ssn" name="ssn"></td>
	</tr>
	<tr>
		<td><label for="first">First Name:</label></td>
		<td><input type="text" id="first" name="first"></td>
	</tr>
	<tr>
		<td><label for="last">Last Name:</label></td>
		<td><input type="text" id="last" name="last"></td>
	</tr>
	<tr>
		<td><label for="username">Username:</label></td>
		<td><input type="text" id="username" name="username"></td>
	</tr>
	<tr>
		<td><label for="password">Password:</label></td>
		<td><input type="password" id="pwd" name="pwd"></td>
	</tr>
	<tr>
		<td></td>
		<td>
		<form method="post" action="addCRS.jsp">
		<input type="submit" value="Register Customer Representative"></form>
		</td>
		
		<td>
		<form method = "post" action="admin.jsp">
		<input type="submit" value="Cancel"></form>
		</td>
		</tr>
		</table>
	


<% } %>
</div>
</body>
</html>