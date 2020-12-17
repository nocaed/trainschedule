<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Insert title here</title>
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
	<h1>Which train line would you like to ride?</h1>
	<form method="post" action="addResrvStart.jsp">
	<select name="schedule-reserv-drop" id="schedule-resrv-drop">
		<% 
		  	while(rs.next()) {
		  		schedName = rs.getString(1);
			    out.println("<option value='" + schedName + "'>" + schedName + "</option>");
			}
		%>
	</select>
	
	<input type="submit" value="Next">
	</form>
	<%}%>
	</div>

</body>
</html>