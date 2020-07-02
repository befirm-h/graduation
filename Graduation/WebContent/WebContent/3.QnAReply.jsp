<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
            	<%request.setCharacterEncoding("euc-kr") ;%>
<%@page import="QnA.QnABean"%>
<jsp:useBean id="bean" class="QnA.QnABean" scope="session"/>
<%
String nowPage=request.getParameter("nowPage");
String title=bean.getTitle();
String contents=bean.getContents();
String member=bean.getMemberidx();
String date=bean.getDate();
int viewing=bean.getViewing();
String id=session.getAttribute("id").toString();
int secret=bean.getSecret();



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
<title>QnA �亯 : Tomorrow is...</title>
<script type="text/javascript">

function inputCheck() {
	
	if (document.getElementById("title").value=="") {
		alert("������ �Է����ּ���");
		document.getElementById("title").focus();
		return false;
	}
	if (document.getElementById("contents").value=="") {
		alert("������ �Է����ּ���.");
		document.getElementById("contents").value = "";
		document.getElementById("contents").focus();
		return false;
	}
	if(document.getElementById("secret").value=="yes"){
		if(document.getElementById("pwd").value.length !=4)
		{
			alert("��й�ȣ�� 4�ڸ��� �Է����ּ���.");
			document.getElementById("pwd").value = "";
			document.getElementById("pwd").focus();
			return false;
		}
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
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>
		
<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/question.png" width="50px" /><br>
							<h3>QnA</h3>
							<p><br>
							 </p>
						
					</p>
				</div>
			</div>
		</div>
		</section>
<br><br>
<div class="identity">
			<table class="identity_table" id="identity_table">

				<colgroup>
					<col width="15%" />
					<col width="65%" />
				</colgroup>
				<tr>
				<td>�ۼ���</td><td><%=member %></td>
				<td>��¥</td><td><%=date %></td>
				<td>��ȸ��</td><td><%=viewing %></td>
				</tr>
				<tr>
					<td>����</td>
					<td><textarea rows="3" cols="250" readonly><%=title %></textarea></td>
				</tr>
				<tr>
					<td>����</td>
					<td><textarea rows="10" cols="250"  readonly><%=contents %></textarea></td>
				</tr>

			</table>
		<p align="center">===================== �亯 ���� ������ =============================</p>	
			<form name="form" class="form" method="post" action="3.QnAReplyProcess.jsp" onsubmit = "return inputCheck()">
		<div class="identity">
			<table class="identity_table" id="identity_table">

				<colgroup>
					<col width="15%" />
					<col width="65%" />
				</colgroup>
				<tr>
					<td>����</td>
					<td><textarea rows="3" cols="250" name="title" id="title"></textarea></td>
				</tr>
				<tr>
					<td>����</td>
					<td><textarea rows="10" cols="250" name="contents"
							id="contents"></textarea></td>
				</tr>
			
			</table>
			
			
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type="hidden" name="ref" value="<%=bean.getRef() %>">
			<input type="hidden" name="pos" value=<%=bean.getPos() %>>
			<input type="hidden" name="depth" value="<%=bean.getDepth() %>">
			<input type="hidden" name="secret" value="<%=bean.getSecret() %>">
			<input type="hidden" name="password" value="<%=bean.getPassword() %>">
			<%if(id.equals("rhksflwk")) {%>
			<input type="hidden" name="member" value="������">
			
			<%}else{ %>
			<input type="hidden" name="member" value="<%=id%>">
			<%} %>
			
			<div class="Button">
					<input type="button" value="���ư���"
						onclick="history.back()"> 
						<input type="submit" value="�ۼ��Ϸ�">
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