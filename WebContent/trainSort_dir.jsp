<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Sort All Trains</title>
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
<!-- sort trains -->
		
			<!-- sort by different criteria 
			(by arrival time, departure time, 
			origin, destination, fare)  -->
			<h3>Sort All Trains</h3>
			<form action="trainSort.jsp" method="post">
				
				<label for="sortType">Sort by:</label>

				<select name="sortType">
  					<option value="arrival time">Arrival Time</option>
 					<option value="departure time">Departure Time</option>
  					<option value="origin">Origin</option>
 					<option value="destination">Destination</option>
 					<option value="fare">Fare</option>
				</select>
				
				<label for="sortOrder">Order:</label>

				<select name="sortOrder">
  					<option value="ascending">Ascending</option>
 					<option value="descending">Descending</option>
				</select>
				<br>
				<button>Search</button>
			
			</form>
		
		<br>
		<button onclick="window.location.href='customer.jsp';">Return to Homepage</button>
<%} %>
</div>
</body>


</html>