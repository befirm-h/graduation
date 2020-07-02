<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/style/style.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<link
	href='//cdn.rawgit.com/young-ha/webfont-archive/20161201/css/Arita-dotum.css'
	rel='stylesheet' type='text/css'>
<link
	href='//cdn.rawgit.com/young-ha/webfont-archive/master/css/PureunJeonnam.css'
	rel='stylesheet' type='text/css'>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Lab2</title>


</head>
<style>
input[type=submit] {
	font-family: 'Arita-dotum', ����;
	font-size: 13px;
	color: #8C8C8C;
	text-decoration: none;
	padding: 15px;
	width: 65px;
	height: 1px;
	border: 1px solid #FFFFFF;
	background-color: #FFFFFF;
	text-align: center;
}

input[type=button] {
	font-family: 'Arita-dotum', ����;
	font-size: 13px;
	color: #8C8C8C;
	text-decoration: none;
	padding: 15px;
	width: 75px;
	height: 1px;
	border: 1px solid #FFFFFF;
	background-color: #FFFFFF;
	text-align: center;
}

nav {
	border: 1px solid #bcbcbc;
	list-style-type: none;
}

nav > ul > li {
	display: inline-block;
	margin: 20px;
	position: relative;
}
nav > ul > li > a {
	background-color: #FFFFFF;
	color: #bcbcbc;
	text-decoration: none;
	font-family: 'Arita-dotum', ����;
}

nav > ul > li > ul > li {
	display: none;
	margin: 20px;
	position: absolute;
	backgroung-color: #bcbcbc;
}

nav > ul > li > ul > li > a {
	color: #FFFFFF;
	text-decoration: none;
	font-family: 'Arita-dotum', ����;
}

nav > ul > li :hover > ul > li{
display: inline-block;
}
</style>
<%@ include file="../style/style.css"%>

<body>

	<nav> <!-- header ����  --> <nav class="header">
	<form method=POST action="login_ok.jsp">
		<%
			String id = (String) session.getAttribute("id");
			if (id != null) {
		%><!-- ����� id���� �ִٸ� id������ �α��� ���¸� �˸���  -->
		<form method=POST action="logout.jsp">
			<%=session.getAttribute("id")%>���� �α����ϼ̽��ϴ�. <input type="submit"
				value="�α׾ƿ�">
		</form>
		<%
			} else {
		%>
		<!-- ����� id ���� ���ٸ� ���̵�� ��й�ȣ �Է�â�� ��Ÿ���� -->
		���̵� <input type="text" name="id"> ��й�ȣ <input type="password"
			name="pwd"> <input type="submit" value="�α���"
			onclick="location='login_ok.jsp'"> <input type="button"
			value="ȸ������" onclick="location='join.jsp'"> <input
			type="button" value="ID/PWã��" onclick="���̵� ���ã�� jsp">
		<!--����â���� ��ư�� ������ ��� ������ jsp�� �̵��Ѵ�  -->
		<%
			}
		%>
	
	</nav> 
	<nav class="logo"> 
	</nav> 
	
	
	<%
 	if (id != null) {
 %><!-- �α��� �����̸� �ֹ����ۼ��ϱ⸦ ��Ÿ���� �׷��� ������ ��Ÿ���� �ʴ´�. --> 
 

 <a href="#">������</a> 
 <a href="#"> ������</a> 
 <a href="#"> QnA</a> 
 <a href="#"> ��������</a> 
 <a href="#"> ����������</a> 
 
 
 <%
 	} else {
 		
 %>
 
  <nav class="headermenu">
	<ul>
		<li><a href="#"> ������</a>
			<ul>
				<li><a href="#"> �����ۼ� </a></li>

				<li><a href="#"> �������� </a></li>

				<li><a href="#"> �������� </a></li>
			</ul></li>

		<li><a href="#"> ������</a>
			<ul>
			</ul>
			
			</li>
		<li><a href="#"> QnA</a>
		
		<ul>
		</ul>
		</li>
		<li><a href="#"> ��������</a>
		<ul>
		</ul>
		
		</li>

	</ul>
	</nav> <%
 	}
 %> <nav class="banner"> ������ ���߳��� �Ϸ� ���� <br>
	��ư��� �Ϸ簡 <br>
	�״뿡�� ã�ư��⸦ </nav> <!-- header ��  --> </nav>
	</form>

</body>
</html>