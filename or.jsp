<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.*"%>
<%
	String id = request.getParameter("id");
	int i = 0;
	String query = "update req set status='Accepted' where fid='"+id+"'";

	Connection con = Db.getConn();
	PreparedStatement ps = con.prepareStatement(query);
	i = ps.executeUpdate();
	
	
	
	if (i == 1) {
		response.sendRedirect("userreq.jsp?msg=Accepted Successful");
	} else {
		response.sendRedirect("userreq.jsp?msg=Failed");
	
	}
%>