<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Select Origin</title>
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


		<h1>Select a starting stop: </h1>
		<form method="post" action="addResrvEnd.jsp">
		<select name="origin-reserv-drop" id="origin-reserv-drop">
		<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String schedName = request.getParameter("schedule-reserv-drop");
		session.setAttribute("transit_line", schedName);
		Statement st = con.createStatement();
		ResultSet rs; 
		rs = st.executeQuery("select tid, fare, number_of_stops from Schedule where transit_name = '" + schedName + "'");
		rs.next();
		session.setAttribute("tid", rs.getString(1));
		session.setAttribute("fare", rs.getDouble(2));
		session.setAttribute("number_of_stops", rs.getInt(3));
		rs = st.executeQuery("select sid from Stops where Stops.transit_name = '" + schedName + "' order by stop_num");		
		ArrayList<String> sidList = new ArrayList<String>();
		ArrayList<String> stationNames = new ArrayList<String>();
		while (rs.next()) {
			sidList.add(rs.getString(1));
		}
		for(int i = 0; i < sidList.size(); i++) {
			rs = st.executeQuery("select name from Station where sid = " + sidList.get(i));
			rs.next();
			stationNames.add(rs.getString(1));
		}
		
		for(int i = 0; i < stationNames.size() - 1; i++) {
			out.println("<option value='" + stationNames.get(i) + "'>" + stationNames.get(i) + "</option>");
		}
		session.setAttribute("stationNames", stationNames);
		session.setAttribute("sidList", sidList);
		%>
	</select><br>
	<input type="submit" value="Next">
	</form>
  		<%}%>
  	</div>
  	
  	
</body>
</html>