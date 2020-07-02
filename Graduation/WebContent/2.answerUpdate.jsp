<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="question.answerBean" %>
     <jsp:useBean id="aMgr" class="question.answerMgr"/>
    <%
    int idx=Integer.parseInt(request.getParameter("idx"));
    String nowPage=request.getParameter("nowPage");
    answerBean bean=(answerBean)session.getAttribute("bean");
    int qidx=bean.getQidx();
	String question=aMgr.getQuestion(qidx);
	String answer=bean.getAnswer();
	String good=bean.getGood();
	String bad=bean.getBad();
	String decide=bean.getDecide();
	String date = bean.getDate();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/><meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
<title>To. 오늘의 나 수정 : Tomorrow is...</title>
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

	
	
	document.regFrm.submit();
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
</head>
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
				<img src="images/icons/like.png" width="30px" /><br>
							<h3>To. 오늘의 나에게 - 수정</h3>
							<p>아, 오늘의 하루에서 빠지면 안 될 걸 빼놓고 적으셨군요?<br>
							 </p>
						
					</p>
				</div>
			</div>
		</div>
		</section>
<form name="regFrm" method="post" action="2.answerUpdateProcess.jsp" onsubmit="inputCheck()">
<input type="hidden" name="nowPage" value="<%=nowPage %>">
<input type="hidden" name="idx" value="<%=idx%>">

<br><br><br>
				<div class="inner">
			<div class="field">
					<label for="question" style=text-align:left>Q. 오 늘 의 나</label>
					<textarea rows="2" name="auestion" id="question"  text-align="center" style="overflow:hidden" readonly><%=question%></textarea>
			<br>
					<label for="answer" style=text-align:left>A. 오 늘 의 나</label>
					<textarea rows="2"  name="answer" id="answer" text-align="center"  style="overflow:hidden"><%=answer %></textarea>
	<br><br><br><br><br><br>
		

		
				<label for="name"><font color="#11214a"><%=date%>의 기록</font>
				<label for="bad" style=text-align:left>오늘 중 가장 안 좋았던 일은?</label>
				<textarea rows="2"  name="bad" id="bad" text-align="center"  style="overflow:hidden" ><%=bad %></textarea><br>
				<label for="good" style=text-align:left>오늘 중 가장 좋았던 일은?</label>
				<textarea rows="2" name="good" id="good" text-align="center"  style="overflow:hidden"><%=good %></textarea><br>
			
				<label for="decide" style=text-align:left>내일의 다짐은?</label>
				<textarea rows="2"  name="decide" id="decide" text-align="center"  style="overflow:hidden"><%=decide %></textarea>
			
			
				
		
				

		<center>
		
				<br> <br>
			
		</center>
	</div>
			<p>
			<p>
			<center>
				<p>
					<br> <br>
				<div class="Button">
				<input type="submit" value="수정하기">
				<input type="button" value="돌아가기" onclick="location.href='2.answerRead.jsp?idx=<%=idx%>'">
				</div>

			</center>
		</div>
		</form>
</body>
</html>