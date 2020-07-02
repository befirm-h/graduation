<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%request.setCharacterEncoding("euc-kr") ;%>
<%@page import="mail.receiveBean"%>
<jsp:useBean id="rMgr" class="mail.receiveMgr"  scope="session" />
<%
	request.setCharacterEncoding("EUC-KR");
	int receive_idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	receiveBean recieve_bean = rMgr.getreceiveContents(receive_idx);
	String receive_title =  recieve_bean.getTitle();
	String receive_date =  recieve_bean.getDate();
	String receive_contents =  recieve_bean.getContents();
	session.setAttribute("bean",  recieve_bean );//게시물을 세션에 저장
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

		<title>받은 고민 읽기 : Tomorrow is...</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">
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
 %> 	 </div>
			</header>
		
		
<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/contact.png" width="40px" /><br>
							<h3>받은 고민 읽기</h3>
							<p>당신의 위로가 필요한 고민입니다.<br>
							 </p>
			</div>
			</div>
		</div>
		</section>
<br>
		<form name="regFrm" class="form" method="post" action="1.sendProcess.jsp">
			<div class="inner">
				<div class="field">
					<label for="name">Title</label>
					<input type="text" id="title" name="title" value="<%=receive_title%>">
				</div>
				<div class="field">
					<label for="contents">Contents</label>
					<textarea name="contents" id="contents" rows="15"><%=receive_contents%></textarea>
				</div>
			</div>
			<br> 
			<br>
	</form>
	
</body>
</html>