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

<%
String uname=request.getParameter("username");
String pass=request.getParameter("pass");
String email=request.getParameter("email");
String role=request.getParameter("role");
String gen=request.getParameter("gender");
String state=request.getParameter("state");
String country=request.getParameter("country");
String fname=request.getParameter("fname");
File f = new File("C:/Users/RAMYA/Desktop/" + fname);
FileInputStream fis = new FileInputStream(f);
int p=0;
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dual acess storage","root","root");
	PreparedStatement ps=con.prepareStatement("select email from reg where email='"+email+"' and role='user' ");
ResultSet rs= ps.executeQuery();

while(rs.next()){
	p++;
	System.out.println(p);
	
}

System.out.println(p);

if(p>0){
	
	response.sendRedirect("reg.jsp?this emil already registered");
}

else if(p==0){
	
	
	PreparedStatement ps1=con.prepareStatement("insert  into reg(uname,pwd,email,role,gender,state,country,image) values('"+uname+"','"+pass+"','"+email+"','"+role+"','"+gen+"','"+state+"','"+country+"',?)");
	 ps1.setBinaryStream(1, (InputStream) fis, (int) (f.length()));

	ps1.executeUpdate();

	/* ps.setString(1, uname);
	ps.setString(2, pass);
	ps.setString(3, email);
	ps.setString(4, role);
	ps.setString(5, gen);
	ps.setString(6, state);
	ps.setString(7, country);
	ps.setString(8, fname);
	 */
	// ps.setBinaryStream(1, (InputStream) fis, (int) (f.length()));

	response.sendRedirect("reg.jsp?registration successfull");

	
}










%>
</body>
</html>