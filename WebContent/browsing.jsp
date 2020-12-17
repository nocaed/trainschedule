%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Browse and Search</title>
</head>

<% 
if(session.getAttribute("user")==null){
%>
<h3>You are not logged in</h3>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>

<body><div>
	
		<h2>Browse and Search</h2>
		
		<!-- train scheds -->
		<section>
			<!-- search for train schedules 
			by origin, destination, date of travel -->
			<h3>Search Train Schedules</h3>
			
			<form action="trainSched.jsp" method="post">
				<label for="origin">Origin:</label>
  				<input name="origin" type="text"/>
  
  				<label for="dest">Destination:</label>
  				<input name="dest" type="text"/>
  	
				<label for="tDate">Date of Travel (YYYY-MM-DD):</label>
				<input name="tDate" type="text"/>	
				<br>			
				<button>Search</button>
			</form>
		</section>
		
		<!-- sort trains -->
		<section>
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
		</section>
		
		
		<!-- train stops -->
		<section>
			<!-- a user should be able to see all 
			the stops a train will make -->
			<h3>See Train Stops</h3>
    
			<form action="stops.jsp" method="post">	
				<label for="origin">Origin:</label>
  				<input name="origin" type="text"/>
  
  				<label for="dest">Destination:</label>
  				<input name="dest" type="text"/>
  				<label for="transit_name">Transit Name:</label>
				<input name="transit_name" type="text"/>
				<br>
				<button>Search</button>
			</form>
		</section>
		 
		<br><br>
		<button onclick="window.location.href='customer.jsp';">Return to Homepage</button>
		 
<%
	
//comment
}
%>

</div></body>
</html>