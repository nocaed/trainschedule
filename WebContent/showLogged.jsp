<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="src.com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Insert title here</title>
</head>
<body>
<div>

<%
	// Username
	String username = request.getParameter("username");
	
	// Get true/false value from customer/employee checkbox
	boolean isCustomer = request.getParameter("userType") == null;
	
	// Password
	String pwd = request.getParameter("password");
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	// Statement for select query
	Statement st = con.createStatement();
	// Holds results from select query
	ResultSet rs;
	// Query user data from either customer or employee based on value from the checkbox
    rs = st.executeQuery("select * from " + (isCustomer ? "Customer" : "Employee") + " where username='" + username + "' and password='" + pwd + "'");
    
	// Thread safe check for query results
    if (rs.next()) {
    	// Set global attribute user to the logged in username
        session.setAttribute("user", username); // the username will be stored in the session
        
        // redirect to customer landing page if a customer
        if (isCustomer) {
        	// calculate user age
        	int age = UserUtility.userAge(rs.getString(6));
        	// calculate discount based on age and isDisabled
        	double discount = UserUtility.discount(age) + (rs.getString(2).equals("1") ? 0.5 : 0);
        	// set age and discount session attributes for later use
        	session.setAttribute("age", age);
        	session.setAttribute("discount", discount);
        	// add user first name to session for personalized messages
        	session.setAttribute("name", rs.getString(3));
        	// redirect to customer landing page
        	response.sendRedirect("customer.jsp");
        // redirect to customer representative landing page
        } else if (rs.getString(6).equals("0")) {
        	response.sendRedirect("customerrep.jsp");
        // redirect to admin landing page
        } else {
        	response.sendRedirect("admin.jsp");
        }
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }

%>

</div>
</body>
</html>