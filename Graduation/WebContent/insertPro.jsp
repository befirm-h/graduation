<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.sql.*" %>
    <%request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="Menu.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
.JoinContent {
	margin-top:180px;
text-align:center; 
font-size:20px;
}
</style>
<body>
<div align="center">
<img src="image/logo.JPG" width="auto" height="160" />
</div>

	<div id="Menu">
		<ul>
			<li><a href="#">Ȩ</a></li>
			<li><a href="#">������</a>
				<ul>
					<li><a href="Mail/receive.jsp">���� ������</a></li>
					<li><a href="Mail/send.jsp">���� ������</a></li>
				</ul></li>
			<li><a href="#">������</a>
				<ul>
					<li><a href="#">����޴� 1</a></li>
					<li><a href="#">����޴� 2</a></li>
					<li><a href="#">����޴� 3</a></li>
				</ul></li>
			<li><a href="#">QnA</a></li>
			<li><a href="#">��������</a></li>
		</ul>
	</div>
<%
String id=request.getParameter("id");
String password=request.getParameter("password");
String emailID=request.getParameter("emailID");
String emailAD=request.getParameter("emailAD");

Connection conn=null;
PreparedStatement pstmt=null;
String str="";
boolean joinCheck=false;
try{
	String url = "jdbc:mysql://210.123.254.103/?useSSL=false&user=root&password=tjdtjeo30";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url);
	
	String sql="insert into member values(null,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	
	String usetutorial = "use db";
	pstmt.executeUpdate(usetutorial);
	
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, emailID+"@"+emailAD);
	pstmt.executeUpdate();

	joinCheck=true;
}catch(Exception e){
	e.printStackTrace();

}finally{
	if(pstmt !=null)
		try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null)
		try{conn.close();}catch(SQLException sqle){}
}
if(joinCheck){
%>
<div class="JoinContent">
ȯ���մϴ�! ȸ�������� �Ϸ� �Ǿ����ϴ�.
<%} else{%>
�˼��մϴ�. ȸ�������� �����Ͽ����ϴ�. �ٽ� �õ����ּ���.
</div>
<%} %>
</body>
</html>