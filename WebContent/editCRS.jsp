<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
</head>
<% if(session.getAttribute("user")==null){ %>
<h3>You are not logged in</h3>
<a href='index.jsp'>Login</a>
<% 
} else { 
%>
<body>
<div>
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
		if(action.equals("1")){
			st.executeUpdate("update Employee set ssn='"+newVal+"' where ssn='"+ssn+"'");
			out.print("Employee's SSN has been updated. <a href='admin.jsp'>Go to your Admin tools</a>");
		}
		else if(action.equals("2")){
			st.executeUpdate("update Employee set username='"+newVal+"' where ssn='"+ssn+"'");
			out.print("Employee's Username has been updated. <a href='admin.jsp'>Go to your Admin tools</a>");	
		}
		else if(action.equals("3")){
			st.executeUpdate("update Employee set password='"+newVal+"' where ssn='"+ssn+"'");
			out.print("Employee's password has been updated. <a href='admin.jsp'>Go to your Admin tools</a>");
		}
		else if(action.equals("4")){
			st.executeUpdate("update Employee set first_name='"+newVal+"' where ssn='"+ssn+"'");
			out.print("Employee's first name has been updated. <a href='admin.jsp'>Go to your Admin tools</a>");
		}
		else if(action.equals("5")){
			st.executeUpdate("update Employee set last_name='"+newVal+"' where ssn='"+ssn+"'");
			out.print("Employee's last name has been updated. <a href='admin.jsp'>Go to your Admin tools</a>");
		}
	}
	else{
		out.print("Employee with given SSN doesn't exist. <a href='editCR.jsp'>Try again</a>");
	}
}
%>

</div>
</body>
</html>