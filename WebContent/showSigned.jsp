<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String username = request.getParameter("username");
	
	String pwd = request.getParameter("password");
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	Statement st = con.createStatement();
	ResultSet rs;
    rs = st.executeQuery("select * from Customer where username='" + username + "'"); // insert into Customer values (username, password)
    
    if (rs.next()) {
		out.println("Username already taken!");
		//todo: give the user a chance to sign up with another username
		out.println("<br> Please sign in using a different username<br> <a href='signup.jsp'>login</a>");
		
    } else {
        out.println("Thanks for signing up " + username);// TODO: Create account
       
       	PreparedStatement update = con.prepareStatement
       	("INSERT INTO Customer VALUES (?, ?)");

        	update.setString(1, username);
        	update.setString(2, pwd);
        	update.executeUpdate();
        	out.println("<br> Please Log in <br> <a href='login.jsp'>login</a>");
    }

%>

 <a href='index.jsp'>Go to welcome page</a>

</body>
</html>