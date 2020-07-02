<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%@page import="question.answerMgr"%>

<%
answerMgr db = answerMgr.getInstance();
String qcountString=session.getAttribute("qcount").toString();
int qcount=Integer.parseInt(qcountString);
String question=db.getQuestion(qcount);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<form name="regFrm" method="post" action="2.answerProcess.jsp" onsubmit="return inputCheck()">
<script type="text/javascript">
function inputCheck()
{
	if(document.regFrm.answer.value=="")
		{
		alert("답변을 입력해주세요.");
			document.regFrm.answer.focus();
			return false;
		}
	if(document.regFrm.bad.value=="")
	{
	alert("오늘 중 가장 안 좋았던 일을 입력해주세요.");
		document.regFrm.bad.focus();
		return false;
	}

	if(document.regFrm.good.value=="")
	{
	alert("오늘 중 가장 좋았던 일을 입력해주세요.");
		document.regFrm.good.focus();
		return false;
	}
	if(document.regFrm.decide.value=="")
	{
	alert("내일의 다짐을 입력해주세요.");
		document.regFrm.decide.focus();
		return false;
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


}
</script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">

</head>

<link href="./Menu.css" rel="stylesheet" type="text/css">

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
				<img src="images/icons/like.png" width="50px" />
				<br>
				<br>
				<h3>To. 오늘의 나에게</h3><p>
					<p><br>
							 </p>	
			</div>
		</div>
	</div>
	</section>

<title>To. 오늘의 나 작성 : Tomorrow is...</title>
</head>
<body>	
			
				<div class="inner">
			<div class="field">
					<label for="question">Q. 오 늘 의 나</label>
					<textarea rows="1" name="auestion" id="question"  text-align="center" style="overflow:hidden" readonly><%=question%></textarea>
			<br>
					<label for="answer">A. 오 늘 의 나</label>
					<textarea rows="1"  name="answer" id="answer" text-align="center"  style="overflow:hidden"></textarea></div>
		<p>
	<p><p><p>
		
			<center>
				<label for="name"><font color="#11214a">오 늘 의 기 록</font></center><br>
			
				
			<div class="inner">
			<div class="field">
					
				<label for="bad">오늘 중 가장 안 좋았던 일은?</label>
				<textarea rows="1"  name="bad" id="bad" text-align="center"  style="overflow:hidden"></textarea><br>
			
				<label for="good">오늘 중 가장 좋았던 일은?</label>
				<textarea rows="1" name="good" id="good" text-align="center"  style="overflow:hidden"></textarea><br>
		
				<label for="decide">내일의 다짐은?</label>
				<textarea rows="1"  name="decide" id="decide" text-align="center"  style="overflow:hidden"></textarea>
				</div></div>

		<center>
			<p>
				<br> <br>
			
				<footer>
						<center><input type="button" class="button" value="돌아가기" onclick="location.href='2.answer.jsp'">
							<input type="submit" class="button" value="작성완료">
						</center>
							<input type="hidden" id="qcount" name="qcount" value="<%=qcount %>">
					</footer>

		</div>

		
	</div>
</form>
	<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();

		}

         </script>
</body>
</html>