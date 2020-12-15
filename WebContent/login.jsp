<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login page</title>
	</head>

<body>

<h3>Login</h3>


<form method="post" action="showLogged.jsp">
	<table>
	<tr><td>
  <label for="username">Username:</label><br>
  <input type="text" id="username" name="username"><br>
  </td></tr>
  
  <tr><td>
  <label for="password">Password:</label><br>
  <input type="password" id="password" name="password"> 
  </td></tr>
  
  <tr><td>
  <label for="userType">Check here if you are a Customer Representative or Administrator</label>
  <input type="checkbox" id="userType" name="userType" value="true">
  <label for="userType">Yes</label><br>
  </td></tr>
  
  <tr><td>
  
  <input type="submit" value="LOGIN">
  </td></tr>
</table>  
</form>

<h4><a href='index.jsp'>Go to welcome page</a></h4> 
</body>

</html>