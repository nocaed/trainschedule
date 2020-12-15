<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservations by Transit line</title>
</head>
<% if(session.getAttribute("user")==null){ %>
<h3>You are not logged in</h3>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>
<body>
<h3>List of Reservations by Transit Line Name:</h3>
<%
String line = request.getParameter("line");
if(line==null){
	out.print("Empty Transit Line Name. <a href='bytransit.jsp'>Try again</a>");
}
else{
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement st = con.createStatement();
String query ="select * from Reservation r, Schedule s where r.tid=s.tid and s.transit_name='"+line+"'";
ResultSet rs= st.executeQuery(query);

out.print("<table>");
out.print("<tr>");

out.print("<td><center>");
out.print("Transit Line");
out.print("</center></td>");

//out.print("<td><center> | </center></td>");

out.print("<td><center>");
out.print("Reservation Num ");
out.print("</center></td>");

//out.print("<td><center> | </center></td>");

out.print("<td><center>");
out.print(" Customer UserName ");
out.print("</center></td>");
//out.print("<td><center> | </center></td>");
out.print("<td><center>");
out.print(" Departure Date ");
out.print("</center></td>");
//out.print("<td><center> | </center></td>");
out.print("<td><center>");
out.print(" Origin ");
out.print("</center></td>");
//out.print("<td><center> | </center></td>");
out.print("<td><center>");
out.print(" Destination ");
out.print("</center></td>");
//out.print("<td><center> | </center></td>");
out.print("<td><center>");
out.print(" Train ID ");
out.print("</center></td>");
//out.print("<td><center> | </center></td>");
out.print("<td><center>");
out.print(" Cost");
out.print("</center></td>");


out.print("</tr>");

while (rs.next()) 
{
	
	out.print("<tr>");
	
	out.print("<td><center>");
	out.print(line);
	out.print("</center></td>");
	//out.print("<td> | </td");
	out.print("<td><center>");
	out.print(rs.getString("rnum"));
	out.print("</center></td>");
	//out.print("<td> | </td");
	out.print("<td><center>");
	out.print(rs.getString("username"));
	out.print("</center></td>");
	//out.print("<td> | </td");
	out.print("<td><center>");
	out.print(rs.getString("res_date"));
	out.print("</center></td>");
	//out.print("<td> | </td");
	out.print("<td><center>");
	out.print(rs.getString("origin"));
	out.print("</center></td>");
	//out.print("<td> | </td");
	out.print("<td><center>");
	out.print(rs.getString("destination"));
	out.print("</center></td>");
	//out.print("<td> | </td");
	out.print("<td><center>");
	out.print(rs.getString("tid"));
	out.print("</center></td>");
	//out.print("<td> | </td");
	out.print("<td><center>");
	out.print("$");
	out.print(rs.getString("cost"));
	out.print("</center></td>");
	

	out.print("</tr>");
	
}
out.print("</table>");
}
out.print("<h4> <a href='admin.jsp'>Go to Your Admin Tools</a> </h4>");
%>


<%} %>
</body>
</html>