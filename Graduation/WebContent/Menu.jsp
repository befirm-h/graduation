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
			<li><a href="0.first.jsp">홈</a></li>
			<li><a href="#">편지함</a>
				<ul>
					<li><a href="0.first.jsp?pagefile=1.receiveWorry">받은 편지함</a></li> 
					<li><a href="0.first.jsp?pagefile=1.sendWorry">보낸 편지함</a></li>
				</ul>
			<li><a href="#">To. 오늘의 나</a>
				<ul>
					<li><a href="0.first.jsp?pagefile=2.question">Q) 오늘의 나</a></li>
					<li><a href="0.first.jsp?pagefile=2.answer">A) 오늘의 나</a></li>
				</ul></li>
			<li><a href="0.first.jsp?pagefile=3.QnA">QnA</a></li>
			<li><a href="0.first.jsp?pagefile=4.notice">공지사항</a></li>
		</ul>
		<%
			} else { //세션이 설정되지 않은 경우
		%>
			<ul>
			<li><a href="0.first.jsp">홈</a></li>
			<li><a href="#">편지함</a>
				<ul>
					<li><a href="beforeLogin.jsp">받은 편지함</a></li> 
					<li><a href="beforeLogin.jsp">보낸 편지함</a></li>
				</ul>
			<li><a href="#">To. 오늘의 나</a>
				<ul>
					<li><a href="beforeLogin.jsp">Q) 오늘의 나</a></li>
					<li><a href="beforeLogin.jsp">A) 오늘의 나</a></li>
				</ul></li>
			<li><a href="0.first.jsp?pagefile=3.QnA">QnA</a></li>
			<li><a href="0.first.jsp?pagefile=4.notice">공지사항</a></li>
		</ul>
		<% }%>
	</div>
</body>
</html>