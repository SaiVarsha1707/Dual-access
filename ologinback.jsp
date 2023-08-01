<%@page import="java.sql.*"%>

<%
String cid=request.getParameter("email");
String pwd=request.getParameter("pass");
String maggi=null;
String mam=null;
int p=0;
System.out.println(pwd);
System.out.println(cid);
try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Semantic-aware searching over Encrypted Data for Cloud Computing","root","root");
	PreparedStatement ps=con.prepareStatement("select id,uname from reg where email='"+cid+"' and pwd='"+pwd+"' and role='owner' and  status='Accepted'");
ResultSet rs= ps.executeQuery();
while(rs.next()){
	maggi=rs.getString(1);
	mam=rs.getString(2);
	System.out.println(maggi);
	System.out.println(mam);
	p++;
}


if(p==1){

	session.setAttribute("cid", maggi);
//	session.setAttribute("did", cid);
	session.setAttribute("fullname", mam);
	response.sendRedirect("ohome.jsp?m=s");
}
else{
	String msg="dpr";
	response.sendRedirect("ologin.jsp?m=f");
	
}
}
catch(Exception e){
	
}

%>