<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Result</title>
</head>
<body>
<div>
<% if(session.getAttribute("user")==null){ %>
<h3>You are not logged in</h3>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>
<%
	
	String ssn = request.getParameter("ssn");
	String first = request.getParameter("first");
	String last = request.getParameter("last");
	String username = request.getParameter("username");
	String pwd = request.getParameter("pwd");
	if(ssn==null || first==null || last==null || username==null || pwd==null || ssn.equals("") || first.equals("") || last.equals("") || username.equals("") || pwd.equals("")){
		out.print("Either ssn or firstname or lastname or username or password was empty. <a href='addCR.jsp'>Try Again</a>");
	}
	else{
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	ResultSet rs;
	rs= st.executeQuery("select * from Employee where username = '" + username +"' or ssn = '"+ssn+"'");
	if(rs.next()){
		out.print("Employee with that SSN or Username already exists<br>");
		out.print(" <a href ='addCR.jsp> Try again </a><br>");
	}
	else{
			PreparedStatement update = con.prepareStatement
		       	("INSERT INTO Employee VALUES (?, ?, ?, ?, ?, 0)");

		        	update.setString(1, ssn); // Username
		        	update.setString(2, last);
		        	update.setString(3, first);
		        	update.setString(4, username);
		        	update.setString(5, pwd);
		        	update.executeUpdate();
		        	out.print("Employee added.<br> <a href='admin.jsp'>Back to your Admin tools</a>");
	}
	}
%>


<% } %>
</div>
</body>
</html>