<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Sign up page</title>
	</head>

<body>
<div>

<h3>Sign up here:</h3>

<form method="post" action="showSigned.jsp">
<table>

<tr><td> 
  <label for="username">Username:</label>
  <input type="text" id="username" name="username"></td></tr>
 <tr><td> 
  <label for="password">Password:</label>
  <input type="password" id="password" name="password"> </td></tr>
 <tr><td> 
  <label for="firstname">First name:</label>
  <input type="text" id="firstname" name="firstname"></td></tr>
 <tr><td> 
  <label for="lastname">Last name:</label>
  <input type="text" id="lastname" name="lastname"> </td></tr>
 <tr><td> 
  <label for="email">Email:</label>
  <input type="text" id="email" name="email"></td></tr>
 <tr><td> 
  <label for="disabled">Check here if you are disabled</label>
  <input type="checkbox" id="disabled" name="disabled" value="true">
  <label for="disabled"> Yes</label></td></tr>
  <tr><td> 
  <label for="start">Date of Birth (format: yyyy-mm-dd):</label>

	<input type="date" id="dob" name="dob"
       
       min="1969-01-01" max="2077-12-31">
  </td></tr>
  <tr><td>      
  <input type="submit" value="SIGN IN"></td></tr>
  </table>
</form>

 <h4><a href='index.jsp'>Go back to welcome page</a></h4>
</div>
</body>

</html>