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
	noticeBean bean = nMgr.getNotice(idx);//�Խù� ��������
	nMgr.upCount(idx);//��ȸ�� ����
	String title = bean.getTitle();
	String date = bean.getNotice_date();
	String contents = bean.getContents();
	session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<script type="text/javascript">
function del(){
	if(confirm("�ش� ���� �����Ͻðڽ��ϱ�?")==true)
	{

		location.href="4.notice_delete.jsp";
 }else
	{
		return false;
	}
}

function logout()
{
	if(confirm("�α׾ƿ� �Ͻðڽ��ϱ�?")==true)
{

	location.href="logout.jsp";
}
	else
{
	return;
}
}
</script>
<title>�������� �б� : Tomorrow is...</title>
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
			<a href="1.receiveWorry.jsp">���� ������</a>
						<a href="1.sendWorry.jsp">���� ������</a>
						<a href="2.answer.jsp">To.������ ��</a>
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
					<h3>�� �� �� ��</h3>
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
 <input type="button" class="button" value="������� " onclick="location='4.notice_list.jsp'"/></center></footer>
	 <%
 	} else {
 %>
	
			<input type="button" class="button" value="�����ϱ�" onclick="location='4.notice_update.jsp?nowPage=<%=nowPage%>&idx=<%=idx%>'">
			<input type="submit" class="button" value="�����ϱ�">
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