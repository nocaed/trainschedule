<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Insert title here</title>
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
<%
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement st = con.createStatement();
String query = "select transit_name as transit, count(*) as res from Reservation group by transit order by res desc limit 5";

ResultSet rs;
rs=st.executeQuery(query);

	
			out.print("<table>");
			out.print("<tr>");
			
			out.print("<td><center>");
			out.print("Transit Line");
			out.print("</center></td>");
		
			out.print("<td><center>");
			out.print("No. of Reserv.");
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
				
				out.print("</tr>");
				
			}
			out.print("</table>");
			out.print("<h4> <a href='admin.jsp'>Go to Your Admin Tools</a> </h4>");
	
%>

<%} %>
</div>
</body>
</html>