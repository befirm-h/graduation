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
	<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/>
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
			<img src="images/icons/like.png" width="30px" /><br>
							<h3>From. 지난 날의 나</h3>
							<p>지난 날들 속  나는 어떤 모습인가요?<br>
							 </p>
						
					</p>
				</div>
			</div>
		</div>
		</section><br><br><br>
	<center><label for="name">From. 지난 날의 나</label></center>
	
		<table style="width:92%">
			<colgroup>
				<col width="3%" />
				<col width="97%" />
			</colgroup>
							
			
			<tr style="background-color:white;  border:solid 2px white; ">
				<td align="right">Q</td>
				<td><textarea style="overflow:hidden" rows="2" cols="250" name="auestion" id="question"text-align="center" style="overflow:hidden" readonly><%=question%></textarea></td>
			</tr>
			<tr style="background-color:white;  border:solid 2px white; ">
				<td align="right">A</td>
				<td><textarea style="overflow:hidden" rows="2" cols="250" name="answer" id="answer" text-align="center" style="overflow:hidden" readonly><%=answer %></textarea></td>
			</tr>
		</table>
			<br><br><br><br><br><br>
		<div class="inner">
			<div class="field">
		<label for="name"><font color="#11214a"><%=date%>의 기록</label></font></center>
		
			<label for="bad" style=text-align:left>오늘 중 가장 안 좋았던 일은?</label>
			<textarea rows="2" cols="250" name="bad" id="bad" text-align="center" style="overflow:hidden" readonly><%=bad %></textarea><br>
			
		<label for="good" style=text-align:left>오늘 중 가장 좋았던 일은?</label>				
		<textarea rows="2" cols="250" name="good" id="good"text-align="center" style="overflow:hidden"  readonly><%=good %></textarea><br>
			
				<label for="decide" style=text-align:left>내일의 다짐은?</label>
			<textarea rows="2" cols="250" name="decide" id=decide"text-align="center" style="overflow:hidden"  readonly><%=decide %></textarea>
			
		
			
				</div></div>

		
		<center>
			<p>
				<br>
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