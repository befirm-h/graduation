<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%@page import="question.answerMgr"%>

<%
answerMgr db = answerMgr.getInstance();
String qcountString=session.getAttribute("qcount").toString();
int qcount=Integer.parseInt(qcountString);
String question=db.getQuestion(qcount);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<form name="regFrm" method="post" action="2.answerProcess.jsp" onsubmit="return inputCheck()">
<script type="text/javascript">
function inputCheck()
{
	if(document.regFrm.answer.value=="")
		{
		alert("�亯�� �Է����ּ���.");
			document.regFrm.answer.focus();
			return false;
		}
	if(document.regFrm.bad.value=="")
	{
	alert("���� �� ���� �� ���Ҵ� ���� �Է����ּ���.");
		document.regFrm.bad.focus();
		return false;
	}

	if(document.regFrm.good.value=="")
	{
	alert("���� �� ���� ���Ҵ� ���� �Է����ּ���.");
		document.regFrm.good.focus();
		return false;
	}
	if(document.regFrm.decide.value=="")
	{
	alert("������ ������ �Է����ּ���.");
		document.regFrm.decide.focus();
		return false;
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


}
</script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">

</head>

<link href="./Menu.css" rel="stylesheet" type="text/css">

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
				<img src="images/icons/like.png" width="50px" />
				<br>
				<br>
				<h3>To. ������ ������</h3><p>
					<p><br>
							 </p>	
			</div>
		</div>
	</div>
	</section>

<title>To. ������ �� �ۼ� : Tomorrow is...</title>
</head>
<body>	
			
				<div class="inner">
			<div class="field">
					<label for="question">Q. �� �� �� ��</label>
					<textarea rows="1" name="auestion" id="question"  text-align="center" style="overflow:hidden" readonly><%=question%></textarea>
			<br>
					<label for="answer">A. �� �� �� ��</label>
					<textarea rows="1"  name="answer" id="answer" text-align="center"  style="overflow:hidden"></textarea></div>
		<p>
	<p><p><p>
		
			<center>
				<label for="name"><font color="#11214a">�� �� �� �� ��</font></center><br>
			
				
			<div class="inner">
			<div class="field">
					
				<label for="bad">���� �� ���� �� ���Ҵ� ����?</label>
				<textarea rows="1"  name="bad" id="bad" text-align="center"  style="overflow:hidden"></textarea><br>
			
				<label for="good">���� �� ���� ���Ҵ� ����?</label>
				<textarea rows="1" name="good" id="good" text-align="center"  style="overflow:hidden"></textarea><br>
		
				<label for="decide">������ ������?</label>
				<textarea rows="1"  name="decide" id="decide" text-align="center"  style="overflow:hidden"></textarea>
				</div></div>

		<center>
			<p>
				<br> <br>
			
				<footer>
						<center><input type="button" class="button" value="���ư���" onclick="location.href='2.answer.jsp'">
							<input type="submit" class="button" value="�ۼ��Ϸ�">
						</center>
							<input type="hidden" id="qcount" name="qcount" value="<%=qcount %>">
					</footer>

		</div>

		
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