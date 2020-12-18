<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Current Reservations</title>
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
    %>
    	<table>
		  <tr>
		  	<th>Number</th>
		    <th>Transit line</th>
		    <th>Date of Reservation</th>
		    <th>Cost</th>
		    <th>Type</th>
		  </tr>
    <%

			  	String username = (String) session.getAttribute("user");
  	ResultSet rs;
	// Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	// Statement for select query
	Statement st = con.createStatement();
	int i = 0;
	ArrayList<Integer> rnumList = new ArrayList<Integer>();
    rs = st.executeQuery("select rnum, s.transit_name, res_date, cost, is_roundtrip from Reservation r join Stops s on origin = stop_num and s.transit_name = r.transit_name where r.username='" + username+ "'and res_date >= CURRENT_DATE()");
    while(rs.next()) {
    	int rnum = rs.getInt(1);
    	rnumList.add(rnum);
    	
    	session.setAttribute("rnum", rnum);
	    String transit_name = rs.getString(2);
	    String date = rs.getString(3);
	    double cost = rs.getDouble(4);
	    String cost_str = (String) String.format("%.2f", cost);
	    boolean is_roundtrip = rs.getBoolean(5);
	      out.println("<tr>");
	      out.println("<td>" + (i + 1) + "</td>");
	      out.println("<td>" + transit_name + "</td>");
	      out.println("<td>" + date + "</td>");
	      out.println("<td>$" + cost_str + "</td>");
	      if (is_roundtrip) {
	    	  out.println("<td> round trip</td>");
	      } else {
	    	  out.println("<td> one way</td>");
	      }
	      out.println("</tr>");
	      i++;
    }
  %>
  </table> <br><br>
  <form method="post" action="deleteResrv.jsp">
  Reservation to cancel: 
  <select name="delete-reserv-drop" id="delete-reserv-drop">
  	<%
 	for(int j  = 0; j< rnumList.size(); j++) {
 		out.println("<option value='" + rnumList.get(j) + "'>" + (j + 1) + "</option>");
 	}
  	%>
  </select>
  <input type="submit" value="Cancel">

  </form><br>
  <a href="customer.jsp">Back</a>
  
  	<%}%>
  	</div>
</body>
</html>