<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    	<%request.setCharacterEncoding("euc-kr") ;%>
<%@page import="question.answerBean"%>
<jsp:useBean id="aMgr" class="question.answerMgr" />
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	answerBean bean = aMgr.getAnswerContents(idx);//�Խù� ��������
	int qidx=bean.getQidx();
	String question=aMgr.getQuestion(qidx);
	String answer=bean.getAnswer();
	String good=bean.getGood();
	String bad=bean.getBad();
	String decide=bean.getDecide();
	String date = bean.getDate();
	session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>To. ������ �� : Tomorrow is...</title>
<script type="text/javascript">
function update(){
	document.updateFrm.action="2.answerUpdate.jsp";
	document.updateFrm.submit();
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
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
 %> > </nav>
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>
		
<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
			<img src="images/icons/like.png" width="50px" /><br>
							<h3>To. ������ ������</h3>
							<p><br>
							 </p>
						
					</p>
				</div>
			</div>
		</div>
		</section><br><br>
	<center><label for="name">Q. ������ �ʿ���</label></center>
	
		<table>
			<colgroup>
				<col width="15%" />
				<col width="65%" />
			</colgroup>
							
			
			<tr>
				<td>Q</td>
				<td><textarea rows="3" cols="250" name="auestion" id="question"
						readonly><%=question%></textarea></td>
			</tr>
			<tr>
				<td>A</td>
				<td><textarea rows="5" cols="250" name="answer" id="answer" readonly><%=answer %></textarea></td>
			</tr>
		</table>
		<p>
		<p>
	<center><label for="name"><%=date%>�� ���		</label></center>
		<table >
	
			<colgroup>
				<col width="15%" />
				<col width="65%" />
			</colgroup>
			<tr>
				<td>���� �� ���� �����Ҵ� ����?</td>
				<td><textarea rows="5" cols="250" name="bad" id="bad" readonly><%=bad %></textarea></td>
			</tr>
			<tr>
				<td>���� �� ���� ���Ҵ� ����?</td>
				<td><textarea rows="5" cols="250" name="good" id="good" readonly><%=good %></textarea></td>
			</tr>
			<tr>
				<td>������ �ҿ�</td>
				<td><textarea rows="5" cols="250" name="decide" id=decide" readonly><%=decide %></textarea></td>
			</tr>

		</table>
		<center>
			<p>
				<br> <br>
			<div class="Button">
				<input type="button" value="��Ϻ���"
					onclick="location.href='2.answer.jsp'">
					<input type="button" value="�����ϱ�" onclick="update()">
			</div>
		</center>
	</div>
	<form name="updateFrm" method="get">
<input type="hidden" name="idx" value="<%=idx%>">
<input type="hidden" name="nowPage" value="<%=nowPage%>">
</form>
	
		<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();

		}

         </script>
	
	
</body>
</html>