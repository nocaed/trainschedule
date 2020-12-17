<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Train Stops</title>
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
	

		<h3>Trains Stops</h3>
		
		<%			
		
    	String origin = request.getParameter("origin");   
   		String dest = request.getParameter("dest");
   		String transit_name = request.getParameter("transit_name"); 
   		
		out.print("<table>");		
			
		out.print("<tr>");
			out.print("<th>Origin</td>");
			out.print("<th>Departure Time</td>");
			out.print("<th>Transit Name</td>");
			out.print("<th>Arrival Date</td>");
			out.print("<th>Fare</td>");
			out.print("<th>Train ID</td>");
			out.print("<th>Stop Number</td>");
			out.print("<th>sid</td>");
			out.print("<th>Arrival Time</td>");
			out.print("<th>Departure Time</td>");
    		out.print("</tr>");
    		out.print("<h1>"+ origin+ dest+ transit_name+"</h1>");
    		
    		String queryToGetTidString = "(Select a.tid from Schedule a where a.origin = '%s' AND a.destination = '%s' and a.transit_name = '%s')";
    		String queryToGetTid = String.format(queryToGetTidString,origin,dest,transit_name);
    			  	
    		String queryToGetSidString ="Select * from Stops b where b.tid IN " + queryToGetTid;
    		//String queryToGetSidString2 ="Select * from Stops b where b.tid = 1"; 	   	
    		
    	
    		ApplicationDB db = new ApplicationDB();
	    	Connection con = db.getConnection();
	  
	    	Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery(queryToGetSidString);
			
		boolean hasSomething = false;
		
		while(rs1.next()){
			hasSomething = true;
			
				out.print("<tr>");
					out.print("<td>");
						out.print(origin);
					out.print("</td>");
					out.print("<td>");
						out.print(dest);
					out.print("</td>");
					out.print("<td>");
						out.print(transit_name);
					out.print("</td>");				
					out.print("<td>");
						out.print("arrival_date");
					out.print("</td>");
					out.print("<td>");
						out.print(rs1.getString("fare"));
					out.print("</td>");
					out.print("<td>");
						out.print(rs1.getString("tid"));
					out.print("</td>");
					out.print("<td>");
						out.print(rs1.getString("stop_num"));
					out.print("</td>");	
					out.print("<td>");
						out.print(rs1.getString("sid"));
					out.print("</td>");
					out.print("<td>");
						out.print(rs1.getString("arrival_time"));
					out.print("</td>");
					out.print("<td>");
						out.print(rs1.getString("departure_time"));
					out.print("</td>");	
				out.print("</tr>");
		}
			
			if(!hasSomething){
				out.print("No Results Found");
			}
					

		out.print("</table>");
		
		st1.close();
		rs1.close();
		db.closeConnection(con);
		%>
		<br><br>
		<button onclick="window.location.href='browsing.jsp';">Return to Browse Home</button>
	
<%
	
//comment
}
%>
</div></body>
</html>