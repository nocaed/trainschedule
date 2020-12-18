<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Delete Customer Representative</title>
</head>

<body><div>
<% if(session.getAttribute("user")==null){ %>
<h3>You are not logged in</h3><br/>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>
<h2>Delete Existing Employee</h2>

	<table>
	<form method="post" action="deleteCRS.jsp">
		<tr>
		<td>Enter SSN of Customer Representative you want to Delete:</td>
		<td><input type="text" name="SSN"></td>
		</tr> 
		<tr><td></td>
		<td>
		<input type="submit" value="DELETE">
		</td>
		</form>
		<td>
		<form method = "post" action="admin.jsp">
		<input type="submit" value="CANCEL">
		</form></td></tr>
		</table>
		
<%} %>

</div>
</body>
</html>