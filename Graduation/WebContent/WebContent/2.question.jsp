<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>To. ������ �� : Tomorrow is...</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
	
<script type="text/javascript">
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
	<form name="regFrm" class="form" method="post"
		action="1.sendProcess.jsp">
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
					<img src="images/icons/like.png" width="50px" /><br><br>
					<h3>To. �� �� �� ��</h3>
					<p>
						<br>
					</p>
				</div>
			</div>
		</div>
		</section>

		</head>

		<body>

			<center>
				<br>
				<br>
			
				<h3><font size="30px">
					Today is...
				</h3></font>
				</header>
				<p>
					������ �Ϸ��  ��ſ��� � �Ϸ翴����?<br />õõ�� ����������
					������ �Ϸ縦 �ۼ��غ�����.<br />�׸���, ���� � �� �����ϰ� � �������<br />���ϰ� �ۼ��غ�����.
						</font>
					<footer> <input type="button" class="button" value="�����ޱ�"  onclick="location='2.questionCheck.jsp'"> 
					<input type="button" class="button" value="��Ϻ���" onclick="location='2.answer.jsp'">
					</footer>
				</article>
			</center>
		</body>
</html>