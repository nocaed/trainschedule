<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Find Train Stops</title>
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

<!-- train stops -->
		
			<!-- a user should be able to see all 
			the stops a train will make -->
			<h3>See Train Stops</h3>
    	
			<form action="stops.jsp" method="post">	
				<table>
				<tr>
				<td>
				<label for="origin">Origin:</label></td>
				<td>
  				<input name="origin" type="text"/></td>
  				</tr>
  				<tr>
  				<td>
  				<label for="dest">Destination:</label></td>
  				<td>
  				<input name="dest" type="text"/></td>
  				</tr>
  				<tr>
  				<td>
  				<label for="transit_name">Transit Name:</label></td>
  				<td>
				<input name="transit_name" type="text"/></td>
				</tr>
				<tr><td></td>
				<td>
				<button>Search</button>
				</td></tr>
			</table>
			</form>
		<br>
		<button onclick="window.location.href='customer.jsp';">Return to Homepage</button>
<%} %>
</div>
</body>


</html>