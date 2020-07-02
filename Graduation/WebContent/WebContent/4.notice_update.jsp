<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="notice.noticeBean"%>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String nowPage = request.getParameter("nowPage");
noticeBean bean = (noticeBean)session.getAttribute("bean");
String title = bean.getTitle();
String contents = bean.getContents();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항 수정 : Tomorrow is...</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" type="text/css"/>
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
	<form name="regFrm" class="form" method="post" action="noticeUpdatePro.jsp">	<input type="hidden" id="idx" name="idx" value="<%=idx%>">
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
		</div>
		</header>

		<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/microphone.png" width="50px"  />
					<br> <br>
					<h3>공 지 사 항 (수정)</h3>
						<p><br>
							 </p>	
				</div>
			</div>
		</div>
		</section>
<br><br>
	
			<div class="inner">
				<div class="field">
					<label for="name">Title</label>
					<input type="text" id="title" name="title" value="<%=title%>">
				</div>
				<div class="field">
					<label for="contents">Contents</label>
					<textarea name="contents" id="contents" rows="15"><%=contents%> </textarea>
				</div>
			</div>
			<br> <br>
			<footer>
			<center>
			<input type="submit" class="button" value="수정하기">
			</div>
		</form>
				<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();

		}

         </script>
	
</body>

</head>
<body>

</body>
</html>