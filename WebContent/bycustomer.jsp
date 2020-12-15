<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservations by Customer Username</title>
</head>
<% if(session.getAttribute("user")==null){ %>
<h3>You are not logged in</h3>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>
<body>
<h2>
		Please enter the Customer's unique and identifying UserName:
	</h2>
<table>
			<form method="post" action="bycustomerList.jsp">
			<tr>
				<td>Customer Username:</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
			<td>
			</td>
			<td>
			<input type="submit" value="SUBMIT">
			</td>
			</tr></form>
			<tr>
			<td>
			</td>
			<td><form method="post" action="admin.jsp">
			<input type="submit" value="CANCEL">
			</form> </td>
			</tr>
			
		</table>



<% } %>

</body>
</html>