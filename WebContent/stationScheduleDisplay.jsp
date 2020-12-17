<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>View Station's Schedule</title>
</head>
<body>
	<div>
		<table>
		<tr>
			<th>Transit Name</th>
			<th>Train #</th>
			<th>Stop #</th>
			<th>Arrival Time</th>
			<th>Departure Time</th>
			<th>Fare ($)</th>
		</tr>
		<%
		// get station id from input form
		String sid = request.getParameter("stations");
		Connection conn = new ApplicationDB().getConnection();
		Statement st = conn.createStatement();
		ResultSet schedule = st.executeQuery("select sc.transit_name, st.tid, st.stop_num, st.arrival_time, st.departure_time, sc.fare from Schedule sc join Stops st using(transit_name) where sid=" + sid + " group by sc.transit_name, st.stop_num;");
		while(schedule.next()) {
			out.println("<tr>");
			out.println("<td>" + schedule.getString(1) + "</td>");
			out.println("<td>" + schedule.getString(2) + "</td>");
			out.println("<td>" + schedule.getString(3) + "</td>");
			out.println("<td>" + schedule.getString(4) + "</td>");
			out.println("<td>" + schedule.getString(5) + "</td>");
			out.println("<td>" + schedule.getString(6) + "</td>");
			out.println("</tr>");
		}
		%>
		</table>
		<h1>Success!</h1><br>
		<a href='customerrep.jsp'>Return to home page</a><br>
		<a href='logout.jsp'>Log Out</a>
	</div>
</body>
</html>