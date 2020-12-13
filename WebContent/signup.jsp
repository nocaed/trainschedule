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

<h3>Sign up</h3>

<form method="post" action="showSigned.jsp">
  <label for="username">Username:</label><br>
  <input type="text" id="username" name="username"><br>
  <label for="password">Password:</label><br>
  <input type="password" id="password" name="password"> <br>
  <label for="firstname">First name:</label><br>
  <input type="text" id="firstname" name="firstname"> <br>
  <label for="lastname">Last name:</label><br>
  <input type="text" id="lastname" name="lastname"> <br>
  <label for="email">Email:</label><br>
  <input type="text" id="email" name="email"> <br>
  <label for="disabled">Are you disabled?</label><br>
  <input type="checkbox" id="disabled" name="disabled" value="yes">
  <label for="disabled"> I am disabled</label><br>
  
  <label for="start">Start date:</label>

	<input type="date" id="dob" name="dob"
       
       min="1969-01-01" max="2077-12-31">
       
  <input type="submit" value="Log in">
</form>

 <a href='index.jsp'>Go to welcome page</a>

</body>

</html>