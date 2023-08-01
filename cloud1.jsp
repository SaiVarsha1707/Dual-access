<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
	String uname = request.getParameter("username");
	String pwd = request.getParameter("pass");
	if (uname.equals("clouda") && pwd.equals("clouda")) {
		response.sendRedirect("cloudhome.jsp");
	}
	else if (uname.equals("cloudb") && pwd.equals("cloudb")) {
		response.sendRedirect("cloudhome1.jsp");
	}
	else {
		response.sendRedirect("cloud.jsp");
	}
%>