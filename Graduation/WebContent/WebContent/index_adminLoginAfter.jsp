<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>


<%@ page import="member.LogonDBBean"%>
<jsp:useBean id="member" class="member.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("id");

	LogonDBBean manager = LogonDBBean.getInstance(); //회원정보 수정 처리 메소드 호출 후 수정 상황값 반환 


%>
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

	
		<title>Tomorrow is...</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">

	</head>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="Home.jsp" class="logo">Tomorrow is...</a>
						<a href="admin_userCheck.jsp">회원목록</a>
						<a href="3.QnA.jsp">QnA</a>
						<a href="4.notice_list.jsp">Notice</a>
						<a href="javascript:logout()"><font color="red">Logout</a> </font>
				</div>
			</header>
			
		<!-- Banner -->
			<section id="banner">
				<div class="inner">

					<div class="flex">

						<div>
							<input type="image" src="images/icons/user.png" width="40px" onclick="location.href='admin_userCheck.jsp'"/>
							<h3>회원목록</h3>
							
						</div>

						<div>
							<input type="image" src="images/icons/question2.png" width="40px" onclick="location.href='3.QnA.jsp'"/>
							<h3>QnA관리</h3>
						</div>

						<div>
							<input type="image" src="images/icons/microphone.png" width="40px"  onclick="location.href='4.notice_list.jsp'"/>
							<h3>공지사항</h3>
						</div>
					</div>
						
							
</center>
			</section>


	<!-- Three -->
			<section id="three" class="wrapper align-center">
				<div class="inner">
					<div class="flex flex-2">
						<article>
							<div class="image round">
								<img src="images/mail_black.jpg" alt="Pic 01" /><br><br>
							</div>
						
							<p>몸이든 마음이든 비우면 시원하고 편안해집니다.<br/>반대로 안에 오랫동안 간직하고 있으면<br/>몸이든 마음이든 병이 납니다.<br />뭐든 비워야 좋습니다.<br/><font size="2px">#혜민스님, 멈추면 비로소 보이는 것들</font>
							<br/>
							<footer>
								<a href="1.send_contents.jsp" class="button">고민 비우기</a>
							</footer>
						</article>
						<article>
							<div class="image round">
								<img src="images/photo_black.png" alt="Pic 02" /><br><br>
							</div>
						
							<p>몸멋있는 사람은 아무렇게나 살아도 멋있다.<br/>안 씻는 사람은 안 씻어도 멋있다.<br />일생 정리정돈 못하는 사람은 그게 멋이다.<br/>아등바등 살아가는 너같은 사람은 그대로도 멋이다.<br/>
							<font size="2px">#이병률, 끌림</font>
							<footer>
								<a href="2.questionCheck.jsp" class="button">To.오늘의 나</a>
							</footer>
						</article>
						
					</div>
				</div>
			</section>

		

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>