<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>To. 오늘의 나 : Tomorrow is...</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
	<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/>
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
	
<script type="text/javascript">
function logout()
{
	if(confirm("로그아웃 하시겠습니까?")==true)
{

	location.href="logout.jsp";
}
	else
{
	return;
}
}
</script>
</head>
<body>
	<form name="regFrm" class="form" method="post"
		action="1.sendProcess.jsp">
		<!-- Header -->
	<body>
	<!-- Header -->
	<header id="header">
	<div class="inner">
		<a href="Home.jsp" class="logo">Tomorrow is...</a>
			<a href="1.receiveWorry.jsp">받은 편지함</a>
						<a href="1.sendWorry.jsp">보낸 편지함</a>
						<a href="2.answer.jsp">To.오늘의 나</a>
						<a href="3.QnA.jsp">QnA</a>
		<a href="4.notice_list.jsp">Notice</a>
		<%
			if (!(session.getAttribute("id") == null)) {
		%> <a href="javascript:logout()"><font color="red">Logout</a> </font> <%
 	}
 %>  </nav>
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>
		<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/like.png" width="30px" /><br><br>
					<h3>To. 오 늘 의 나</h3>
					<p>오늘의 기록은 하루에 딱 한 번 가능합니다.<p>
						<br>
					</p>
				</div>
			</div>
		</div>
		</section>

		</head>

		<body>

			<center>
				<br>
				<br><br>
			
				<h3><font size="35px">
					Today is...
				</h3></font>
				</header>
				<p>
					오늘은  당신에게 어떤 하루였나요? <br />어떤 하루를 보냈던 상관 없이<br> 오늘을 버틴 당신에게
					칭찬과 격려를 하며<br>오늘의 하루를 기록해보세요.<br />그리고, 그저 마음 가는 대로  솔직하게 <br />내멋대로 "오늘의 나"를 기록해보세요.
						
					<footer> <input type="button" class="button" value="질문받기"  onclick="location='2.questionCheck.jsp'"> 
					<input type="button" class="button" value="목록보기" onclick="location='2.answer.jsp'">
					</footer><br><br><br>
				</article>
			</center>
		</body>
</html>