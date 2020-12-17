<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Schedules for Stations</title>
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
		<h1>Select a Station</h1>
		<form method='post' action='stationScheduleDisplay.jsp'>
			<label for='stations'>Station Options</label>
			<select name='stations' id='stations'>
				<%
					Connection conn = new ApplicationDB().getConnection();
					Statement st = conn.createStatement();
					ResultSet stations = st.executeQuery("select sid, name from Station");
					while(stations.next()) {
						out.println("<option value='" + stations.getString(1) + "'>" + stations.getString(2) + "</option>");
					}
				%>
			</select>
			<input type='submit' value='Search'>
		</form>
		<a href='customerrep.jsp'>Back to Home Page</a><br>
		<a href='logout.jsp'>Logout</a>
		<%}%>
	</div>
</body>
</html>