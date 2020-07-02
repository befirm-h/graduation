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
			<li><a href="#">홈</a></li>
			<li><a href="#">편지함</a>
				<ul>
					<li><a href="Mail/receive.jsp">받은 편지함</a></li>
					<li><a href="Mail/send.jsp">보낸 편지함</a></li>
				</ul></li>
			<li><a href="#">질문함</a>
				<ul>
					<li><a href="#">서브메뉴 1</a></li>
					<li><a href="#">서브메뉴 2</a></li>
					<li><a href="#">서브메뉴 3</a></li>
				</ul></li>
			<li><a href="#">QnA</a></li>
			<li><a href="#">공지사항</a></li>
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
환영합니다! 회원가입이 완료 되었습니다.
<%} else{%>
죄송합니다. 회원가입이 실패하였습니다. 다시 시도해주세요.
</div>
<%} %>
</body>
</html>