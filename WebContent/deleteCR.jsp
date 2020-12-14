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
<% if(session.getAttribute("user")==null){ %>
You are not logged in<br/>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>
<body>
<h2>Delete Existing Employee</h2>
<form method="post" action="deleteCRS.jsp">
	<table>
		<tr>
		<td>Enter SSN of Customer Representative you want to Delete:</td>
		<td><input type="text" name="SSN"></td>
		</tr> 
		<tr><td></td>
		<td><input type="submit" value="DELETE"></td>
		</form>
		<td>
		<form method = "post" action="admin.jsp">
		<input type="submit" value="CANCEL">
		</form></td></tr>
		</table>
		
<%} %>


</body>
</html>