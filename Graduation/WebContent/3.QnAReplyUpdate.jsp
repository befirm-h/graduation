<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="QnA.QnABean" %>
    <jsp:useBean id="qMgr" class="QnA.QnAMgr" />
    <%
    int idx=Integer.parseInt(request.getParameter("idx"));
    String nowPage=request.getParameter("nowPage");
    QnABean bean=qMgr.getQnAContents(idx);
	session.setAttribute("bean", bean);//게시물을 세션에 저장
    String contents=bean.getContents();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
		<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/>
<title>QnA 답변 수정 : Tomorrow is...</title>
<script type="text/javascript">

function check() {
	

	if (document.getElementById("contents").value=="") {
		alert("내용을 입력해주세요.");
		document.getElementById("contents").value = "";
		document.getElementById("contents").focus();
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
					<img src="images/icons/question.png" width="30px" /><br><br>
							<h3>QnA</h3>
							<p>아, 댓글에서 빠지면 안 될 걸 빼놓고 적으셨군요?<br>
							 </p>
					</p>
				</div>
			</div>
		</div>
		</section>
<br><br><br>
<form name="updqteFrm" method="post" action="3.QnAUpdateProcess.jsp" onsubmit="check()">
<input type="hidden" name="nowPage" value="<%=nowPage %>">
<input type="hidden" name="idx" value="<%=idx%>">
<input type="hidden" name="depth" value="<%=bean.getDepth()%>">

		
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="250" name="contents"
							id="contents"><%=bean.getContents()%></textarea></td>
				</tr>
				<%
				
				if((bean.getSecret()==1) && !session.getAttribute("id").equals("rhksflwk")) {%>
		
				<%} %>

				<div class="inner">
			<div class="field">
					
					
					<label for="name">댓글 내용(수정)</label>
					<textarea rows="10" cols="250" name="contents"
							id="contents"><%=bean.getContents()%></textarea></textarea>
			
			<%
				
				if((bean.getSecret()==1) && !session.getAttribute("id").equals("rhksflwk")) {%>
		
				<%} %>
			
					<br> <br>
				<div class="Button">
				<input type="submit" value="수정하기">
				<input type="button" value="돌아가기" onclick="history.go(-1)">
				</div>

			</center>
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