<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="Menu.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<div align="center">
<img src="image/logo.JPG" min-width=1024px height="160" />
</div>
	<div id="Menu">
	<%
	request.setCharacterEncoding("euc-kr");
	if(!(session.getAttribute("id")==null)){
	%>
		<ul>
			<li><a href="0.first.jsp">Ȩ</a></li>
			<li><a href="#">������</a>
				<ul>
					<li><a href="0.first.jsp?pagefile=1.receiveWorry">���� ������</a></li> 
					<li><a href="0.first.jsp?pagefile=1.sendWorry">���� ������</a></li>
				</ul>
			<li><a href="#">To. ������ ��</a>
				<ul>
					<li><a href="0.first.jsp?pagefile=2.question">Q) ������ ��</a></li>
					<li><a href="0.first.jsp?pagefile=2.answer">A) ������ ��</a></li>
				</ul></li>
			<li><a href="0.first.jsp?pagefile=3.QnA">QnA</a></li>
			<li><a href="0.first.jsp?pagefile=4.notice">��������</a></li>
		</ul>
		<%
			} else { //������ �������� ���� ���
		%>
			<ul>
			<li><a href="0.first.jsp">Ȩ</a></li>
			<li><a href="#">������</a>
				<ul>
					<li><a href="beforeLogin.jsp">���� ������</a></li> 
					<li><a href="beforeLogin.jsp">���� ������</a></li>
				</ul>
			<li><a href="#">To. ������ ��</a>
				<ul>
					<li><a href="beforeLogin.jsp">Q) ������ ��</a></li>
					<li><a href="beforeLogin.jsp">A) ������ ��</a></li>
				</ul></li>
			<li><a href="0.first.jsp?pagefile=3.QnA">QnA</a></li>
			<li><a href="0.first.jsp?pagefile=4.notice">��������</a></li>
		</ul>
		<% }%>
	</div>
</body>
</html>