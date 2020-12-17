<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Sorted Trains</title>
</head>

<body><div>

<% 
if(session.getAttribute("user")==null){
%>
<h3>You are not logged in</h3>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>
	<h1>Sorted Train Schedules</h1>
		
		<%
		
		String type = request.getParameter("sortType");
		String order = request.getParameter("sortOrder");
				
		out.print("Sorting all schedules by " + type + " in " + order + " order");
		out.print("<br><br>");		

		out.print("<table>");		
			
		out.print("<tr>");
			out.print("<th>Transit Name</td>");
			out.print("<th>Origin</td>");
			out.print("<th>Train ID</td>");
			out.print("<th>Destination</td>");
			out.print("<th>Regular Fare Cost</td>");
			out.print("<th>Departure Time</td>");
			out.print("<th>Arrival Date</td>");
			out.print("<th>Total Travel Time</td>");
    		out.print("</tr>");
    	
    	ApplicationDB db = new ApplicationDB();
	   	Connection con = db.getConnection();
	    
	    	// lots of work to find the sort by stuff
		String sortHelp = "";
		String orderHelp = "";
		
		if (type.equals("arrival time")) {
			sortHelp = "arrival_time ";
		} else if (type.equals("departure time")) {
			sortHelp = "departure_time ";
		} else if (type.equals("origin")) {
			sortHelp = "origin ";
		} else if (type.equals("destination")) {
			sortHelp = "destination ";
		} else {
			sortHelp = "fare";
		}
	
		if (order.equals("ascending")) {		
			orderHelp = " ASC"; 
		} else {
			orderHelp = " DESC";
		} 


	    	String q1 = "select a.transit_name, a.origin, a.tid, a.destination,  a.fare, b.departure_time, b.arrival_time, TIMEDIFF(arrival_time,departure_time) AS 'travel_time' from Schedule a, Stops b Order by " + sortHelp + orderHelp;			    
	   	Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery(q1);

		while (rs1.next()) {
			
			out.print("<tr>");

				out.print("<td>");
					out.print(rs1.getString("transit_name"));
				out.print("</td>");

				out.print("<td>");
					out.print(rs1.getString("origin"));
				out.print("</td>");
								
				out.print("<td>");
					out.print(rs1.getString("tid"));
				out.print("</td>");
				
				out.print("<td>");
					out.print(rs1.getString("destination"));
				out.print("</td>");
				
				out.print("<td>");
					out.print(rs1.getDouble("fare"));
				out.print("</td>");
			
				out.print("<td>");
					out.print(rs1.getString("departure_time"));
				out.print("</td>");
							
				out.print("<td>");
					out.print(rs1.getString("arrival_time"));
				out.print("</td>");
				
				out.print("<td>");
					out.print("travel_time");
				out.print("</td>");
				
				
			out.print("</tr>");
		}
		
		out.print("</table>");
		
		st1.close();
		rs1.close();
		db.closeConnection(con);
		
		%>
		
		<br><br>
		<button onclick="window.location.href='browsing.jsp';">Return to Browse Home</button>
<%
	
//comment
}
%>
</div></body>
</html>