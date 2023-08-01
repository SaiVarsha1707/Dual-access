<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.*"%>
<%
	String email = request.getParameter("email");
	String role = request.getParameter("role");
	int i = 0;
	String query = "update reg set status='Accepted' where email='"
			+ email + "' and role='" + role + "'";

	Connection con = Db.getConn();
	PreparedStatement ps = con.prepareStatement(query);
	i = ps.executeUpdate();
	
	if(role.equals("user")){
		if (i == 1) {
			response.sendRedirect("udetails1.jsp?msg=Accepted Successful");
		} else {
			response.sendRedirect("udetails1.jsp?msg=Failed");
		}
	}
	
	
	if(role.equals("owner")){
	if (i == 1) {
		response.sendRedirect("odetails1.jsp?msg=Accepted Successful");
	} else {
		response.sendRedirect("odetails1.jsp?msg=Failed");
	}
	}
%>