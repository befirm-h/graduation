<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%@page import="mail.receiveBean"%>
<jsp:useBean id="rMgr" class="mail.receiveMgr" scope="session" />

<%
	request.setCharacterEncoding("EUC-KR");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	
	receiveBean send_bean = rMgr.getreceiveContents(idx);
	String receiver = send_bean.getSender();
	String title = send_bean.getTitle();
	String date = send_bean.getDate();
	String contents = send_bean.getContents();
	String reportMem = send_bean.getSender(); 
 
	session.setAttribute("bean", send_bean);//�Խù��� ���ǿ� ����	
	rMgr.upCount(idx); 

		
%>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

		<title>���� ��� �б� : Tomorrow is...</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">
			<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/>
</head>
<script type="text/javascript">

function report(){
	if(confirm("�ش� ȸ���� �Ű��Ͻðڽ��ϱ�?")==true)
		document.regFrm.submit();
	 else
	return false;
	
}

function del()
{
	if(confirm("�ش� ���� �����Ͻðڽ��ϱ�?")==true)
{

	location.href="1.receiveDelete.jsp";
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
	<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="Home.jsp" class="logo">Tomorrow is...</a>
				<a href="admin_report.jsp">�Ű����</a>
						<a href="3.QnA.jsp">QnA</a>
						<a href="4.notice_list.jsp">Notice</a>
						<a href="javascript:logout()"><font color="red">Logout</a> </font></div>
			</header>
		
<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/alarm_rhksflwk.png" width="30px" /><br><br>
							<h3>�� �� �� ��</h3>
							 </p>
			</div>
			</div>
		</div>
		</section>
<br>
	<br><br>
					<form name="regFrm" class="form" action="report_admin.jsp" method="post" onsubmit="return report()">
	
	<div class="inner">
			<div class="field">
					
					<label for="name">����</label>
					
					<input type="text" size="248" value="<%=title%>" readonly>
			
				<br>
							<label for="contents">�Ű� ����</label>
							<textarea rows="15" readonly><%=contents%></textarea>
						</div>		
			</div><br>
	<footer>
						<center>
						<input type="button" class="button" value="�����ϱ�" onclick="javascript:del()">
						<input type="submit" class="button" value="�Ű��ϱ�" >
						<input type="button" class="button" value="���ư���" onclick="location.href='admin_report.jsp'">
						</center>
						<br><br>
					</footer>
							<input type="hidden" id="idx" name="idx" value="<%=idx%>"> 
							<input type="hidden" id="reportMem" name="reportMem" value="<%=reportMem%>"> 
										
	</form>
		<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();

		}

         </script>
</body>
</html>