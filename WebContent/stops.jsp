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

<body><div>

<% 
if(session.getAttribute("user")==null){
%>
<h3>You are not logged in</h3>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>
	

		<h3>Trains Stops</h3>
		
		<%			
		
    	String origin = request.getParameter("origin");   
   		String dest = request.getParameter("dest");
   		String transit_name = request.getParameter("transit_name"); 
   	
   		if(origin==null || dest==null || transit_name==null || origin.equals("") || dest.equals("") || transit_name.equals("")){
			out.print("Empty field at either origin or destination or transit name");
		}
   		else{
			
			
    		out.print("<h3>"+ origin +" "+dest+" "+transit_name+"</h3>");
    		
    		String queryToGetTidString = "(Select a.tid from Schedule a where a.origin = '%s' AND a.destination = '%s' and a.transit_name = '%s')";
    		String queryToGetTid = String.format(queryToGetTidString,origin,dest,transit_name);
    			  	
    		String queryToGetSidString ="select s.sid, s.name, s.city, s.state, c.stop_num from Stops c, Station s where s.sid=c.sid and c.tid in " + queryToGetTid;
    		//String query = "select s.name, s.city, s.state, c.stop_num from Station s, Stops c where s.sid=c.sid and c.sid IN "+ queryToGetSidString +" order by c.stop_num asc";
    		//String queryToGetSidString2 ="Select * from Stops b where b.tid = 1"; 	   	
    		
    	
    		ApplicationDB db = new ApplicationDB();
	    	Connection con = db.getConnection();
	  
	    	Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery(queryToGetSidString);
			
		boolean hasSomething = false;
		out.print("<table>");
		out.print("<tr><td>");
		out.print("Name");
	out.print("</td>");
	out.print("<td>");
		out.print("City");
	out.print("</td>");
	out.print("<td>");
		out.print("State");
	out.print("</td>");
	out.print("</tr>");
		
		while(rs1.next()){
			hasSomething = true;
			
				out.print("<tr>");
									
					out.print("<td>");
					out.print(rs1.getString(2));
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs1.getString(3));
					out.print("</td>");
					out.print("<td>");
					out.print(rs1.getString(4));
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
   		}
		%>
		<br><br>
		<button onclick="window.location.href='browsing.jsp';">Return to Browse Home</button>
	
<%
}
%>
</div></body>
</html>