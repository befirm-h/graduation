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
	nMgr.upCount(idx);//조회수 증가
	String title = bean.getTitle();
	String date = bean.getNotice_date();
	String contents = bean.getContents();
	session.setAttribute("bean", bean);//게시물을 세션에 저장
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<script type="text/javascript">
function del(){
	if(confirm("해당 글을 삭제하시겠습니까?")==true)
	{

		location.href="4.notice_delete.jsp";
 }else
	{
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
<title>공지사항 읽기 : Tomorrow is...</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" type="text/css"/>
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">

</head>
<body>
	<form name="regFrm" class="form" method="post" action="4.notice_delete.jsp" onsubmit="del()">
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
		</header>

		<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/microphone.png" width="50px"  />
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
		<%if (session.getAttribute("id") == null || !(session.getAttribute("id").equals("rhksflwk"))) {
 %>
 <input type="button" class="button" value="목록으로 " onclick="location='4.notice_list.jsp'"/></center></footer>
	 <%
 	} else {
 %>
	
			<input type="button" class="button" value="수정하기" onclick="location='4.notice_update.jsp?nowPage=<%=nowPage%>&idx=<%=idx%>'">
			<input type="submit" class="button" value="삭제하기">
			<input type="hidden" id="nowPage" name="nowPage" value=<%=nowPage %>/>
			<input type="hidden" id="idx" name="idx" value=<%=idx %>/>
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