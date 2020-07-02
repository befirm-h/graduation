<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%@page import="mail.receiveBean"%>
<jsp:useBean id="rMgr" class="mail.receiveMgr" scope="session" />

<%
	request.setCharacterEncoding("EUC-KR");
	int worry_idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	
	receiveBean send_bean = rMgr.getreceiveContents(worry_idx);
	String receiver = send_bean.getSender();
	String worry_title = send_bean.getTitle();
	String send_date = send_bean.getDate();
	String worry_contents = send_bean.getContents();
	session.setAttribute("bean", send_bean);//�Խù��� ���ǿ� ����	
	
%>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

		<title>���� ��� �б� : Tomorrow is...</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function inputCheck()
{
	if(document.regFrm.contents.value=="")
		{
			alert("������ �Է��ϼ���.");
			document.regFrm.contents.focus();
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
		 </div>
			</header>
		
<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/contact.png" width="35px" /><br>
							<h3>���� ��� �б�</h3>
							<p>����� ���ΰ� �ʿ��� ����Դϴ�.<br>
							 </p>
			</div>
			</div>
		</div>
		</section>
<br>
	<br>
				<form name="regFrm" class="form" action="1.sendProcess.jsp" method="post" onsubmit="return inputCheck()">
	<div class="inner">
			<div class="field">
					
					<label for="name">Title</label>
					<input type="text" size="248" value="<%=worry_title%>" readonly></div>
			
				<div class="field">
							<label for="contents">Contents</label>
							<textarea rows="15" readonly><%=worry_contents%></textarea>
						</div>		
			</div>
	<br>
			<center>
		<label for="name"><font color="#11214a">�� ��</font></center>
			<div class="inner">
			<div class="field">
					
					<label for="name">Title</label>
					<input type="text" size="248" name="title" id="title"  value="Re:[<%=worry_title%>] ������ ����" readonly></div>
			
				<div class="field">
							<label for="contents">Contents</label>
							<textarea name="contents" id="contents" rows="15"></textarea>
						</div>		
			</div>
			
		<br> <br>
		

				<footer>
						<center><input type="submit" class="button" value="�����ϱ�">
						</center>
					<input type="hidden" id="receiver" name="receiver" value="<%=receiver%>"> 
					<input type="hidden" id="idx" name="idx" value="<%=worry_idx%>"> 
					<input type="hidden" id="worry_title" name="worry_title" value="<%=worry_title%>"> 
					<input type="hidden" id="worry_contents" name="worry_contents" value="<%=worry_contents%>"> 
						<input type="hidden" id="count" name="count" value=1>
						<input type="hidden" id="kind" name="kind" value=1>
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