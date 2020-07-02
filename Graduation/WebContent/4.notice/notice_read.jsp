<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%@page import="notice.noticeBean"%>
<jsp:useBean id="nMgr" class="notice.noticeMgr" />
<%
	int idx = Integer.parseInt(request.getParameter("idx"));

	String nowPage = request.getParameter("nowPage");
	noticeBean bean = nMgr.getNotice(idx);//게시물 가져오기
	String title = bean.getTitle();
	String date = bean.getNotice_date();
	String contents = bean.getContents();
	session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>Projection by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">

</head>
<body>
	<form name="regFrm" class="form" method="post"
		action="1.sendProcess.jsp">
			<!-- Header -->
	<header id="header">
	<div class="inner">
		<a href="Home.jsp" class="logo">Tomorrow is...</a>
		<nav id="nav"> <a href="elements.html">QnA</a> <a href="#">Notice</a>
		<%
			if (!(session.getAttribute("id") == null)) {
		%> <a href="logout.jsp"><font color="red">Logout</a> </font> <%
 	}
 %> </nav>
		</header>

		<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
				<img src="../images/icons/microphone.png" width="50px" /><br> <br>
					<br> <br>
					<h3>공 지 사 항</h3>
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
					<input type="text" id="title" name="title" value="<%=title%>" readonly>
				</div>
				<div class="field">
					<label for="contents">Contents</label>
					<textarea name="contents" id="contents" rows="15" readonly><%=contents%> </textarea>
				</div>
			</div>
			<br> <br>
			<footer>
			<center>
		<%if (session.getAttribute("id") == null || !(session.getAttribute("id") == "rhksflwk")) {
 %>
 <input type="button" class="button" value="목록으로 " onclick="List.jsp"/></center></footer>
	 <%
 	} else {
 %>
	
			<input type="button" class="button" value="수정하기" onclick="notice_update.jsp">
			<input type="button" class="button" value="삭제하기" onclick="notice_delete.jsp">
	<%
		}
	%>
			</div>
		</form>
				<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();

		}

         </script>
		</center>
	
</body>

</html>