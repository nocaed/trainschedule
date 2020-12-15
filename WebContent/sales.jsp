<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sales Report</title>
</head>
<%
    if ((session.getAttribute("user") == null)) {
%>
<h3>You are not logged in</h3>
<a href="index.jsp">Please Login</a>
<%} else {
%>
<body>
<%
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement st = con.createStatement();
String str = "SELECT MONTHNAME(res_date) as month, sum(cost) as sales FROM Reservation group by month order by res_date asc";
ResultSet rs=st.executeQuery(str);

out.print("<table style = 'width:50%'>");
out.print("<tr>");

out.print("<td>");
out.print("<h3>Month</h3>");
out.print("</td>");

out.print("<td>");
out.print("<h3>Total Sales</h3>");
out.print("</td>");

out.print("</tr>");

while (rs.next()) 
{
	
	out.print("<tr>");
	
	out.print("<td>");
	out.print(rs.getString("month"));
	out.print("</td>");	
	
	out.print("<td>");
	out.print("$");
	out.print(rs.getString("sales"));
	out.print("</td>");

	out.print("</tr>");
	
}
out.print("<tr>");
out.print("<td>");
out.print("<h4><a href='admin.jsp'>Go to Your Admin Tools</a></h4>");
out.print("</td>");
out.print("</tr>");
out.print("</table>");

%>


<%} %>

</body>
</html>