<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Train Schedules Available</title>
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
		<!-- search for train schedules 
			by origin, destination, date of travel -->
		<h1>Searched Schedule:</h1>
	
		<% 
		
		String origin = request.getParameter("origin"); //todo 
   		String dest = request.getParameter("dest");
		String arrivalDate = request.getParameter("tDate");
		
		if(origin==null || dest==null || arrivalDate==null || origin.equals("") || dest.equals("") || arrivalDate.equals("")){
			out.print("Empty field at either origin or destination or date of travel");
		}
		
		else{
		ApplicationDB db = new ApplicationDB();
	  	Connection con = db.getConnection();
	   	String q2 = "SELECT a.origin, a.destination, a.arrival_date, a.tid AS train_ID,a.transit_name, a.travel_time, a.number_of_stops FROM Schedule a  WHERE a.origin = \'" + origin + "\' AND a.destination = \'" + dest + "\' AND a.arrival_date = \'" + arrivalDate + "\'";
    		Statement st2 = con.createStatement();
		ResultSet rs2 = st2.executeQuery(q2);
	
		out.print("<table>");		
		
		out.print("<tr>");
			out.print("<th>Origin </td>");
			out.print("<th>Destination </td>");
			out.print("<th>Arrival Date</td>");
			out.print("<th>Train ID</td>");
			out.print("<th>Transit Name</td>");
			out.print("<th>Travel Time</td>");
			out.print("<th>Number of Stops</td>");
			
    		out.print("</tr>");
    		
		   boolean hasSomething = false; //to flag if resultset is empty
		   
		while (rs2.next()){
			
			hasSomething = true;
			
		
				out.print("<tr>");
					out.print("<td>");
						out.print(rs2.getString("origin"));
					out.print("</td>");
					out.print("<td>");
						out.print(rs2.getString("Destination"));
					out.print("</td>");
					out.print("<td>");
						out.print(rs2.getString("arrival_date"));
					out.print("</td>");
					out.print("<td>");
						out.print(rs2.getString("train_ID"));
					out.print("</td>");	
					out.print("<td>");
						out.print(rs2.getString("transit_name"));
					out.print("</td>");	
					out.print("<td>");
						out.print(rs2.getString("travel_time"));
					out.print("</td>");	
					out.print("<td>");
						out.print(rs2.getString("number_of_stops"));
					out.print("</td>");		
				out.print("</tr>");
	
		}
		
		if(!hasSomething){
			out.print("No Results Found for this Search Combination");
		}
		
		out.print("</table>");		

		st2.close();
		rs2.close();
    	db.closeConnection(con);		
		}
		%>
		<br><br>
		<button onclick="window.location.href='browsing.jsp';">Return to Browse Home</button>
		
<%
}
%>
</div></body>
</html>