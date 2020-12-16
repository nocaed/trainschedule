<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
		
		<select name="origin" id="origin">
		<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String schedName = request.getParameter("schedule-reserv-drop");
		System.out.println("***********" + schedName + "*********");
		Statement st = con.createStatement();
		ResultSet rs; 
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
		
		for(int i = 0; i < stationNames.size(); i++) {
			out.println("<option value='" + stationNames.get(i) + "'>" + stationNames.get(i) + "</option>");
		}
		%>
	</select>
  		<%}%>
  	</div>
  	
</body>
</html>