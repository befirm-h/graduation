<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn=null;
Boolean connect=false;
try{
	String jdbcUrl="jdbc:mysql://210.123.254.103/?useSSL=true";
	
	String dbId="root";
	String dbpass="tjdtjeo30";
	Class.forName("com.mysql.jdbc.Driver");
	out.print("class");
	conn=DriverManager.getConnection(jdbcUrl,dbId,dbpass);
	out.print(conn);
	out.print("conn");
	connect=true;
	out.print("true");
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}
if(connect==true){
	out.print("연결되었습니다.");
}else{
	out.print("연결에 실패하였습니다.");
}

%>
</body>
</html>