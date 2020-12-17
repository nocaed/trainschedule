<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Revenue per customer name</title>
</head>
<% 
if(session.getAttribute("user")==null){
%>

<h3>You are not logged in</h3>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>

<body><div>
<h3>List of Revenue per Customer:</h3>
<%
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement st = con.createStatement();
String query ="select c.username, c.first_name, c.last_name, sum(r.cost) from Reservation r, Customer c where r.username=c.username group by c.username";
ResultSet rs= st.executeQuery(query);

out.print("<table>");
out.print("<tr>");

out.print("<td><center>");
out.print("Username");
out.print("</center></td>");

out.print("<td><center>");
out.print("First name");
out.print("</center></td>");

out.print("<td><center>");
out.print("First name");
out.print("</center></td>");

out.print("<td><center>");
out.print("Revenue");
out.print("</center></td>");

out.print("</tr>");

while (rs.next()) 
{
	
	out.print("<tr>");
	
	out.print("<td><center>");
	out.print(rs.getString(1));
	out.print("</center></td>");
	
	out.print("<td><center>");
	out.print(rs.getString(2));
	out.print("</center></td>");
	
	out.print("<td><center>");
	out.print(rs.getString(3));
	out.print("</center></td>");
	
	out.print("<td><center>");
	out.print("$"+rs.getString(4));
	out.print("</center></td>");

	out.print("</tr>");
	
}
out.print("</table>");
out.print("<h4> <a href='admin.jsp'>Go to Your Admin Tools</a> </h4>");
%>
<%} %></div>
</body>
</html>