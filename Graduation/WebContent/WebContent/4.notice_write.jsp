<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8") ;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script type="text/javascript">
function inputCheck()
{
	if(document.regFrm.title.value=="")
		{
			alert("공지사항 제목을 입력해주세요.");
			document.regFrm.title.focus();
			return false;
		}
	if(document.regFrm.contents.value=="")
	{
		alert("공지사항 내용을 입력해주세요.");
		document.regFrm.contents.focus();
		return false;
	}
}
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
</script>

<title>공지사항 작성 : Tomorrow is...s</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" type="text/css"/>
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">
</head>
<body>
	<form name="regFrm" class="form" method="post" action="noticeProcess.jsp" onsubmit="return inputCheck()" />

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
 %> 
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>

		<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/microphone.png" width="50px"  />
					<br>
					<br>
					<h3>공 지 사 항 </h3>
						<p><br>
							 </p>	
				</div>
			</div>
		</div>
		</section>


		<br> <br>
		<div class="inner">
			<div class="field">
				<label for="name">Title</label> <input name="title" id="title" type="text">
			</div>
			<div class="field">
				<label for="contents">Contents</label>
				<textarea name="contents" id="contents" rows="15"></textarea>
			</div>
		</div>
		
		<footer>
		<center>
			<input type="submit" class="button" value="올리기"/>

		</center>
 </footer>
		<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();

		}

         </script>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
</head>
</div>
</form>
</body>
</html>