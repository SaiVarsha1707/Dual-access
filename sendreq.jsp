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
<%

String a1=request.getParameter("id");
String a2=request.getParameter("oid");
String uid=session.getAttribute("cid").toString();



Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dual acess storage","root","root");
PreparedStatement ps=con.prepareStatement("select * from file where fid='"+a1+"'");
ResultSet rs= ps.executeQuery();

while(rs.next()){
	
PreparedStatement ps2=con.prepareStatement("insert into req (title,keywords,description,imgname,usermail,Trapdoor,oid,filid) values('"+rs.getString(2)
		+"','"+rs.getString(3)
		+"','"+rs.getString(4)
		+"','"+rs.getString(5)
		+"','"+uid
		+"','"+rs.getString(8)
		+"','"+a2
		+"','"+a1+"')	");
out.println("pan++++++++++++++"); 
ps2.executeUpdate();
}


response.sendRedirect("search.jsp?a=Request sended successfully");

%>
</body>
</html>