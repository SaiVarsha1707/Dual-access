<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.zip.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.*"%>

<%

  
String data1="";
String data2="";

	String id = request.getParameter("id");
	
	System.out.println("=====----"+id);
	

	Connection con=Db.getConn();
	String sql="select AES_DECRYPT(file,'dpr'),filename from  file where fid='"+id+"' ";
	PreparedStatement ps=con.prepareStatement(sql);
	//ps.setString(1,id);

	ResultSet rs=ps.executeQuery();
	StringBuffer buf = new StringBuffer();
	while(rs.next()){
		data1=rs.getString(1);
		data2=rs.getString(2);
		
	}
	
	
	System.out.println("data====="+data1); 
	if(data1==""){
		
	}else{
		
		try{
			String fileName = "filename";
			response.setHeader("Content-Disposition","attachment; fileName=\""+fileName+"\".txt");
		OutputStream os = response.getOutputStream();
		os.write(data1.getBytes());
		os.close();
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	 
	
%>


