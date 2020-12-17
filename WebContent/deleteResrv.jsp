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
			
    			int rnum = Integer.parseInt(request.getParameter("delete-reserv-drop"));
    			ApplicationDB db = new ApplicationDB();	
    			Connection con = db.getConnection();
    			PreparedStatement st = con.prepareStatement("delete from Reservation where rnum=" + rnum);
    			st.executeUpdate();
    			response.sendRedirect("currentResrv.jsp");
  %>
  	<%}%>
  	</div>
</body>
</html>