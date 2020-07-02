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
			alert("고민의 제목을 입력해주세요.");
			document.regFrm.title.focus();
			return false;
		}
	if(document.regFrm.contents.value=="")
	{
		alert("고민의 내용을 입력해주세요.");
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


<title>고민 보내기 : Tomorrow is...</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
		<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/>
</head>
<body>
	<form name="regFrm" class="form" method="post" action="1.sendProcess.jsp" onsubmit="return inputCheck()" />
	
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
 %> </nav>
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>

		<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/chat.png" width="30px"  />
					<br><br>
					<h3>고민 작성하기</h3>
						<p>당신의 고민은 무엇인가요?<br>
							 </p>	
				</div>
			</div>
		</div>
		</section>


		<br> <br><br>
		<div class="inner">
			<div class="field">
				<label for="name">고민 제목</label> <input name="title" id="worry_title" type="text">
			</div><br><br>
			<div class="field">
				<label for="contents">마음 속 고민을 자유롭게 적어보세요.</label>
				<textarea name="contents" id="contents" rows="15"></textarea>
			</div>
		</div>
		<br>
		<footer>
		<center>
			<input type="submit" class="button" value="비워내기"/>
			<input type="hidden" id="kind" name="kind" value=0>
			<input type="hidden" id="count" name="count" value=0>
			

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