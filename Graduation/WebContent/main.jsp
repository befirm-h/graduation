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
	font-family: 'Arita-dotum', 돋움;
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
	font-family: 'Arita-dotum', 돋움;
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
	font-family: 'Arita-dotum', 돋움;
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
	font-family: 'Arita-dotum', 돋움;
}

nav > ul > li :hover > ul > li{
display: inline-block;
}
</style>
<%@ include file="../style/style.css"%>

<body>

	<nav> <!-- header 시작  --> <nav class="header">
	<form method=POST action="login_ok.jsp">
		<%
			String id = (String) session.getAttribute("id");
			if (id != null) {
		%><!-- 저장된 id값이 있다면 id정보로 로그인 상태를 알린다  -->
		<form method=POST action="logout.jsp">
			<%=session.getAttribute("id")%>님이 로그인하셨습니다. <input type="submit"
				value="로그아웃">
		</form>
		<%
			} else {
		%>
		<!-- 저장된 id 값이 없다면 아이디와 비밀번호 입력창을 나타낸다 -->
		아이디 <input type="text" name="id"> 비밀번호 <input type="password"
			name="pwd"> <input type="submit" value="로그인"
			onclick="location='login_ok.jsp'"> <input type="button"
			value="회원가입" onclick="location='join.jsp'"> <input
			type="button" value="ID/PW찾기" onclick="아이디 비번찾기 jsp">
		<!--같은창에서 버튼을 눌렀을 경우 지정된 jsp로 이동한다  -->
		<%
			}
		%>
	
	</nav> 
	<nav class="logo"> 
	</nav> 
	
	
	<%
 	if (id != null) {
 %><!-- 로그인 상태이면 주문서작성하기를 나타내고 그렇지 않으면 나타내지 않는다. --> 
 

 <a href="#">편지함</a> 
 <a href="#"> 질문함</a> 
 <a href="#"> QnA</a> 
 <a href="#"> 공지사항</a> 
 <a href="#"> 마이페이지</a> 
 
 
 <%
 	} else {
 		
 %>
 
  <nav class="headermenu">
	<ul>
		<li><a href="#"> 편지함</a>
			<ul>
				<li><a href="#"> 편지작성 </a></li>

				<li><a href="#"> 보낸편지 </a></li>

				<li><a href="#"> 받은편지 </a></li>
			</ul></li>

		<li><a href="#"> 질문함</a>
			<ul>
			</ul>
			
			</li>
		<li><a href="#"> QnA</a>
		
		<ul>
		</ul>
		</li>
		<li><a href="#"> 공지사항</a>
		<ul>
		</ul>
		
		</li>

	</ul>
	</nav> <%
 	}
 %> <nav class="banner"> 내일을 버텨내는 하루 말고 <br>
	살아가는 하루가 <br>
	그대에게 찾아가기를 </nav> <!-- header 끝  --> </nav>
	</form>

</body>
</html>