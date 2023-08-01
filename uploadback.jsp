<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="java.io.*"%>
<%@page import="java.math.*" %>
<%@page import="java.util.Random" %>
<%
double ra=Math.random()*100*629;
int ran=(int)ra;
String a1=request.getParameter("title");
String a2=request.getParameter("keywords");
String a3=request.getParameter("desc");
String fname=request.getParameter("file");
File f = new File("C:/Users/RAMYA/Desktop/" + fname);
FileInputStream fis = new FileInputStream(f);
String oid=session.getAttribute("cid").toString();
int p=0;
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dual acess storage","root","root");
	PreparedStatement ps=con.prepareStatement("insert into file(title,keywords,description,filename,file,secret,oid) values('"+a1+"','"+a2+"','"+a3+"','"+fname+"',AES_ENCRYPT(?,'dpr'),'"+ran+"',?) ");
	ps.setBinaryStream(1, (InputStream) fis, (int) (f.length()));
	ps.setString(2, oid);
ps.executeUpdate();

response.sendRedirect("viewfileslist.jsp?m=file uploaded success");

%>



</body>
</html>