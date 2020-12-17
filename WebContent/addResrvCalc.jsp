<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation</title>
</head>
<body>

<div>
<%
	if(session.getAttribute("user") == null) {
%>
		<h3>You are not logged in</h3>
		<a href='index.jsp'>Login</a>
	<%
	} else {
	%>
	<h1>Your reservation:</h1>
	<% 
		ArrayList<String> sidList = (ArrayList<String>) session.getAttribute("sidList");
		ArrayList<String> stationNames = (ArrayList<String>) session.getAttribute("stationNames");
	
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String tid = (String) session.getAttribute("tid");
		String username = (String) session.getAttribute("user");
		String transit_line = request.getParameter("schedule-reserv-drop");
		String destinationName = request.getParameter("dest-reserv-drop");
		int end_num = stationNames.indexOf(destinationName) + 1;
		String date = request.getParameter("resrv-date");
		int start_num = (Integer) session.getAttribute("start_num");
		double fare = (Double) session.getAttribute("fare");
		int number_of_stops = (Integer) session.getAttribute("number_of_stops");
		
		int stops_gone_through = end_num - start_num;
		
		double indvFare = fare / ((double) number_of_stops);
		double cost = indvFare * stops_gone_through;
		out.println("indvFare: " + indvFare);
		
       	PreparedStatement insert = con.prepareStatement
       	("INSERT INTO Reservation VALUES (?, ?, ?, ?, ?, ?, ?)");
       	
       	insert.setString(1, null);
       	insert.setString(2, date);
       	insert.setDouble(3, cost);
       	insert.setString(4, tid);
       	insert.setString(5, username);
       	insert.setInt(6, start_num);
       	insert.setInt(7, end_num);
       	insert.executeUpdate();
		
	%>

<%}%>

</div>

</body>
</html>