<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Best Customer</title>
</head>
<% 
if(session.getAttribute("user")==null){
%>
<h3>You are not logged in</h3>
<a href='index.jsp'>Login</a>
<%
} else { 
%>
<body>
<div>
<h3>Best Customer:</h3>
<% 
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement st = con.createStatement();
String query = "DROP TABLE IF EXISTS CustomerRevenue";
int result=0;
ResultSet rs;

result = st.executeUpdate(query);



if(result>=-1){
	query = "CREATE TABLE CustomerRevenue select c.username as username, c.first_name as first, c.last_name as last, sum(r.cost) as revenue from Reservation r, Customer c where r.username=c.username group by c.username";
	result=st.executeUpdate(query);
	//out.print("if1<br>");
	if(result>0){
		query="select username, first, last, revenue from CustomerRevenue where revenue in (select max(revenue) from CustomerRevenue)";
		boolean res = st.execute(query);
		//out.print("if2<br>");
		if(res){
			//out.print("if3<br>");
			rs=st.getResultSet();
	
			out.print("<table>");
			out.print("<tr>");
		
			out.print("<td><center>");
			out.print("Username");
			out.print("</center></td>");
		
			out.print("<td><center>");
			out.print("First name");
			out.print("</center></td>");
		
			out.print("<td><center>");
			out.print("Last name");
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
			
			
		}
		
		else if(result==0){
			out.print("No reservations made by any customer<br>");
			out.print("<h4> <a href='admin.jsp'>Go to Your Admin Tools</a> </h4>");
		}
		
		query = "DROP TABLE IF EXISTS CustomerRevenue";
		result = st.executeUpdate(query);
		out.print("<h4> <a href='admin.jsp'>Go to Your Admin Tools</a> </h4>");
		
	}
}



%>
<%} %>
</div>
</body>
</html>