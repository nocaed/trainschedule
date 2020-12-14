<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% if(session.getAttribute("user")==null){ %>
You are not logged in<br/>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>
<body>
<%
String ssn = request.getParameter("SSN");
String action = request.getParameter("action");
String newVal = request.getParameter("newVal");
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from Employee where ssn='"+ssn+"'");
if(rs.next()){
	st.executeUpdate("DELETE from Employee where ssn='"+ssn+"'");
	out.print("Employee with given SSN has been deleted. <a href='admin.jsp'>Go to your Admin tools</a>");
}
else{
	out.print("Employee with given SSN does not exist. <a href='deleteCR.jsp'>Try again</a>");
}
%>


<% } %>

</body>
</html>