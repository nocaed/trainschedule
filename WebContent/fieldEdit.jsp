<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="ISO-8859-1">
<title>Edit Field</title>
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
			String field = request.getParameter("field-edit-drop");
			String schedule = request.getParameter("schedule-edit-drop");
			if (field.equals("delete")) {
				String query = "DELETE FROM Schedule WHERE transit_name='" + schedule + "'";
				PreparedStatement ps = con.prepareStatement(query);
				ps.executeUpdate();
				%>
				<h3>Successfully deleted!</h3>
				<a href="customerrep.jsp">Back to home</a>
				<%
			} else {
				session.setAttribute("field", field);
				session.setAttribute("schedule", schedule);
		
				// Statement for select query
				Statement st = con.createStatement();
				// Holds results from select query
				ResultSet rs;
				// Query for retrieving all train schedules
			    rs = st.executeQuery("select number_of_stops from Schedule where transit_name='" + schedule + "'");
				rs.next();
				int stop_num = rs.getInt(1);
				session.setAttribute("stop_num", stop_num);
				String schedName = "";
				%>
				<form method="post" action="makeEdit.jsp">
				<%
				if (field.equals("fare")) {
					%>
					<h3>Enter new fare</h3>
					<input type="text" id="fare-text" name="fare-text">
					<%
				} else {
					%>
					<h3>Enter new arrival date (yyyy-mm-dd)</h3>
					<input type="date" id="arrival_date-text" name="arrival_date-text">
					<%
				}
				%>
				<input type="submit" value="Submit">
				</form>
		<%} %>
	<%}%>
	</div>

</body>
</html>