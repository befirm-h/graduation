<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    	<%request.setCharacterEncoding("euc-kr") ;%>
<%@page import="question.answerBean"%>
<jsp:useBean id="aMgr" class="question.answerMgr" />
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	answerBean bean = aMgr.getAnswerContents(idx);//게시물 가져오기
	int qidx=bean.getQidx();
	String question=aMgr.getQuestion(qidx);
	String answer=bean.getAnswer();
	String good=bean.getGood();
	String bad=bean.getBad();
	String decide=bean.getDecide();
	String date = bean.getDate();
	session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>To. 오늘의 나 : Tomorrow is...</title>
<script type="text/javascript">
function update(){
	document.updateFrm.action="2.answerUpdate.jsp";
	document.updateFrm.submit();
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
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
 %> > </nav>
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>
		
<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
			<img src="images/icons/like.png" width="50px" /><br>
							<h3>To. 오늘의 나에게</h3>
							<p><br>
							 </p>
						
					</p>
				</div>
			</div>
		</div>
		</section><br><br>
	<center><label for="name">Q. 오늘의 너에게</label></center>
	
		<table>
			<colgroup>
				<col width="15%" />
				<col width="65%" />
			</colgroup>
							
			
			<tr>
				<td>Q</td>
				<td><textarea rows="3" cols="250" name="auestion" id="question"
						readonly><%=question%></textarea></td>
			</tr>
			<tr>
				<td>A</td>
				<td><textarea rows="5" cols="250" name="answer" id="answer" readonly><%=answer %></textarea></td>
			</tr>
		</table>
		<p>
		<p>
	<center><label for="name"><%=date%>의 기록		</label></center>
		<table >
	
			<colgroup>
				<col width="15%" />
				<col width="65%" />
			</colgroup>
			<tr>
				<td>오늘 중 가장 안좋았던 일은?</td>
				<td><textarea rows="5" cols="250" name="bad" id="bad" readonly><%=bad %></textarea></td>
			</tr>
			<tr>
				<td>오늘 중 가장 좋았던 일은?</td>
				<td><textarea rows="5" cols="250" name="good" id="good" readonly><%=good %></textarea></td>
			</tr>
			<tr>
				<td>내일의 소원</td>
				<td><textarea rows="5" cols="250" name="decide" id=decide" readonly><%=decide %></textarea></td>
			</tr>

		</table>
		<center>
			<p>
				<br> <br>
			<div class="Button">
				<input type="button" value="목록보기"
					onclick="location.href='2.answer.jsp'">
					<input type="button" value="수정하기" onclick="update()">
			</div>
		</center>
	</div>
	<form name="updateFrm" method="get">
<input type="hidden" name="idx" value="<%=idx%>">
<input type="hidden" name="nowPage" value="<%=nowPage%>">
</form>
	
		<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();

		}

         </script>
	
	
</body>
</html>