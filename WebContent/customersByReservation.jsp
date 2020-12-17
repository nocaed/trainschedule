<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Customers</title>
</head>
<body>
	<div>
		<table>
		<tr>
			<th>Username</th>
			<th>First Name</th>
			<th>Last Name</th>
		</tr>
		<%
		// get station id from input form
		String tid = request.getParameter("transit");
		String resDate = request.getParameter("resDate");
		Connection conn = new ApplicationDB().getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select c.username, c.first_name, c.last_name from Customer c join Reservation r using(username) join Schedule s using(tid) where r.tid=" + tid + " and r.res_date='" + resDate + "'");
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getString(1) + "</td>");
			out.println("<td>" + rs.getString(2) + "</td>");
			out.println("<td>" + rs.getString(3) + "</td>");
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