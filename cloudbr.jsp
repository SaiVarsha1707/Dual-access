<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.*"%>
<%
	String id = request.getParameter("id");
	int i = 0;
	String query = "update req set status='1' where fid='"+id+"'";

	Connection con = Db.getConn();
	PreparedStatement ps = con.prepareStatement(query);
	i = ps.executeUpdate();
	
	
	
	if (i == 1) {
		response.sendRedirect("ureq11.jsp?msg=Accepted Successful");
	} else {
		response.sendRedirect("ureq11.jsp?msg=Failed");
	
	}
%>