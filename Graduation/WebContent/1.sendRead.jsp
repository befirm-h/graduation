<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%@page import="mail.sendBean"%>
<jsp:useBean id="sMgr" class="mail.sendMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	sendBean bean = sMgr.getsendContents(idx);//�Խù� ��������
	String title = bean.getSenderTitle();
	String date = bean.getDate();
	String contents = bean.getSenderContents();
	session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

<title>���� ��� �б� : Tomorrow is...</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
		<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/>
<script type="text/javascript">
function del()
{
	if(confirm("���� �����Ͻðڽ��ϱ�?")==true)
{

	location.href="1.sendDelete.jsp";
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
</head>
<body>
	<form name="regFrm" class="form" method="post" action="1.sendDelete.jsp"  onsubmit="return del()">
		<!-- Header -->
		<body>
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
					<img src="images/icons/paper-plane.png" width="35px"  />
					<br><br>
					<h3>���� ��� �б�</h3>
						<p>���� ���´� ����� �ٽ� �о�� �����?<br>
							 </p>	
				</div>
			</div>
		</div>
		</section>
<br><br><br>
	
			<div class="inner">
				<div class="field">
					<label for="name">��� ����</label>
					<input type="text" id="title" name="title" value="<%=title%>" readonly>
				</div><br><br>
				<div class="field">
					<label for="contents">��� ����</label>
					<textarea name="contents" id="contents" rows="15" readonly><%=contents%> </textarea>
				</div>
			</div>

			<footer>
			<center><br>
			<input type="submit" class="button" value="�����ϱ� "/>
			<input type="hidden" id="kind" name="kind" value=0>

			 <input type="button" class="button" value="������� " onclick="1.sendWorry.jsp"/></center></footer><br>
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