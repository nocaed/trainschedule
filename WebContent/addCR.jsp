<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h2>Add Information for New Customer Representative</h2>
<table>
<form method="post" action="addCRS.jsp">
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
		<td><input type="submit" value="Register Customer Representative"></td>
	</tr></form></table>
	


<% } %>

</body>
</html>