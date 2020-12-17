<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Select Destination</title>
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

	<h1>Select a destination</h1>

	<form method="post" action="addResrvCalc.jsp">
	
	<select name="dest-reserv-drop" id="dest-reserv-drop">
		<% 
		ArrayList<String> sidList = (ArrayList<String>) session.getAttribute("sidList");
		ArrayList<String> stationNames = (ArrayList<String>) session.getAttribute("stationNames");
		
		String startingStation = request.getParameter("origin-reserv-drop");
		
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		int startIndex = stationNames.indexOf(startingStation);
		session.setAttribute("start_num", startIndex + 1);
		Statement st = con.createStatement();
		ResultSet rs;
		
		for(int i = startIndex + 1; i < sidList.size(); i++) {
			out.println("<option value='" + stationNames.get(i) + "'>" + stationNames.get(i) + "</option>");
		}
		%>
	</select>
	
	<br>
	Select a date for your reservation:<br>
	<input type="date" id="resrv-date" name="resrv-date"
       
       min="1969-01-01" max="2077-12-31"> <br>
       
    <input type="checkbox" id="roundtrip-checkbox" name="roundtrip-checkbox" value="true">
    <label for="roundtrip-checkbox"> Roundtrip</label> <br>
       
    <input type="submit" value="Next">
	</form>
	
	<%}%>
</div>


</body>
</html>