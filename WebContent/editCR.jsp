<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Edit Customer Representative</title>
</head>
<% if(session.getAttribute("user")==null){ %>
You are not logged in<br/>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>
<body>
<div>
<h2>Edit Existing Customer Representative Data </h2>

	<table>
		<tr>
		<td>Enter SSN of Customer Representative you want to edit:</td>
		<td><input type="text" name="SSN"></td>
		</tr>
		
	
	<tr>
	<td>Select feature to edit:</td>
	<td><select name="action" size=1>
		<option value="1">SSN</option>
		<option value="2">Username</option>
		<option value="3">Password</option>
		<option value="4">First Name</option>
		<option value="5">Last Name</option>
	</select>&nbsp;</td>
	</tr>
	
	
		<tr>
		<td>Enter New Value:</td>
		<td><input type="text" name="newVal"></td>
		</tr>
		
		<tr> <td></td>
		<td><form method="post" action="editCRS.jsp">
		<input type="submit" value="UPDATE">
		</form></td>
		<td>
		<form method = "post" action="admin.jsp">
		<input type="submit" value="CANCEL">
		</form></td></tr>
	</table>	
<%} %>
</div>
</body>
</html>