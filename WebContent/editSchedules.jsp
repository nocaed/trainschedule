<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="ISO-8859-1">
<title>Edit Schedules</title>
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
		<h3>Choose Schedule to edit:</h3><br>
		<%
					// Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			// Statement for select query
			Statement st = con.createStatement();
			// Holds results from select query
			ResultSet rs;
			// Query for retrieving all train schedules
		    rs = st.executeQuery("select transit_name from Schedule");
			String schedName = "";
		%>
	<form method="post" action="fieldEdit.jsp">
	<select name="schedule-edit-drop" id="schedule-edit-drop">
		<% 
		  	while(rs.next()) {
		  		schedName = rs.getString(1);
			    out.println("<option value='" + schedName + "'>" + schedName + "</option>");
			}
		%>
	</select><br>
	<h3>Choose an option: </h3><br>
	<select name="field-edit-drop" id="field-edit-drop">
		<option value='fare'>Edit Fare</option>
		
		<option value='arrival_date'>Edit Arrival Date</option>
		<option value='delete'> Delete Schedule</option>
	</select><br>
	<input type="submit" value="Next">
	</form>
	
		<%}%>
	</div>
</body>
</html>