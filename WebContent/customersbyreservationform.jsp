<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Reservation Search Form</title>
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
		<h1>Select a Transit Line and Date</h1>
		<form method='post' action='customersByReservation.jsp'>
			<label for='transit'>Station Options</label>
			<select name='transit' id='transit'>
				<%
					Connection conn = new ApplicationDB().getConnection();
					Statement st = conn.createStatement();
					ResultSet rs = st.executeQuery("select tid, transit_name from Schedule");
					while(rs.next()) {
						out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
					}
				%>
			</select><br>
			<label for='resDate'>Reservation Date</label>
			<input type='date' name='resDate' id='resDate'><br>
			<input type='submit' value='Search'>
		</form>
		<a href='customerrep.jsp'>Back to Home Page</a><br>
		<a href='logout.jsp'>Logout</a>
		<%}%>
	</div>
</body>
</html>