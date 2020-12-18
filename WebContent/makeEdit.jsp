<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="ISO-8859-1">
</head>
<body>
<%
    		if(session.getAttribute("user") == null) {
  		%>
  		<h3>You are not logged in</h3>
  		<a href='index.jsp'>Login</a>
  		<%
    		} else {
    			
    		%>
    		<div>
    		<%
    		
    		String field = (String)session.getAttribute("field");
    		if (field == null) {
    			%>
    			Invalid input
    			<a href="customerrep.jsp">Back to home</a>
    			<%
    		} else {
    		String schedule = (String) session.getAttribute("schedule");
    		String input = request.getParameter(field + "-text");
    		int num_stops = (Integer) session.getAttribute("stop_num");
    		
    		// Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			// Statement for select query
			if (field.equals("arrival_date")) {
				input = "'" + input + "'";
			}
			String query = "UPDATE testdb.Schedule SET " + field + "= " + input + " WHERE transit_name='" + schedule + "';";
			PreparedStatement st = con.prepareStatement(query);
			st.executeUpdate();
			
			if (field.equals("fare")) {
				double fare = Double.parseDouble(input);
				double indvFare = fare / ((double) num_stops);
				query = "UPDATE Stops SET fare=" + indvFare + " WHERE transit_name='" + schedule + "'";
				PreparedStatement st2 = con.prepareStatement(query);
				st2.executeUpdate();
			}
    		%>
    		<h3>Success!</h3><br>
    		<a href="customerrep.jsp">Back to home</a>
    		
	<%}}%>
			</div>
</body>
</html>