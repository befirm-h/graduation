<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%request.setCharacterEncoding("euc-kr") ;%>
<%@page import="mail.receiveBean"%>
<%@page import="mail.sendBean"%>

<jsp:useBean id="rMgr" class="mail.receiveMgr"  scope="session" />
<jsp:useBean id="sMgr" class="mail.sendMgr"  scope="session" />

<%
	request.setCharacterEncoding("EUC-KR");
	int receive_idx = Integer.parseInt(request.getParameter("idx"));
	
	String nowPage = request.getParameter("nowPage");
	
	receiveBean worry_bean = rMgr.getreceiveContents(receive_idx);
	String worry_title =  worry_bean.getAdd_title();
	String worry_date =  worry_bean.getDate();
	String worry_contents =  worry_bean.getAdd_contents();

	session.setAttribute("bean",worry_bean);//�Խù��� ���ǿ� ����
	
	receiveBean recieve_bean = rMgr.getreceiveContents(receive_idx);
	String receive_title =  recieve_bean.getTitle();
	String receive_date =  recieve_bean.getDate();
	String receive_contents =  recieve_bean.getContents();
	String sender =  recieve_bean.getSender();
	int idx =  recieve_bean.getIdx();
	int kind =1;
	session.setAttribute("bean",  recieve_bean);//�Խù��� ���ǿ� ����
	
	rMgr.upCount(Integer.parseInt(request.getParameter("idx"))); 


	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/>
<script type="text/javascript">
function report(){
	if(confirm("������ �Ű��Ͻðڽ��ϱ�?")==true)
	{

		location.href="1.Report.jsp";
 }else
	{
		return false;
	}
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
	

		<title>���� ���� �б�: Tomorrow is...</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">

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
 %> 			</div>
			</header>
			
		
<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/contact.png" width="30px" /><br><br>
							<h3>���� ���� �б�.</h3>
							<p>����� �����ϴ� ������ �����߽��ϴ�.<br>
							 </p>
						
					</p>
				</div>
			</div>
		</div>
		</section>
<br>
	<br><br>
				<form name="regFrm" class="form" action="1.Report.jsp" method="post" onsubmit="return report()">
				
	<div class="inner">
			<div class="field">
					
					<label for="name">��� ����</label>
					<div style="position:absolute">
							<div style="position:relative; top:-40px; left:35px;">
							<input type="image" src="images/icons/alarm.png" width="20px"/>
						<input type="hidden" id="sender" name="sender" value="<%=sender%>"> 
						<input type="hidden" id="idx" name="idx" value="<%=idx%>"> 
						<input type="hidden" id="kind" name="kind" value="<%=kind%>"> 
							
							</div></div>
					<input type="text" size="248" value="<%=worry_title%>" readonly></div>
			<br><br>
				<div class="field">
							<label for="contents">��� ����</label>
							<textarea rows="15" readonly><%=worry_contents%></textarea>
						</div>		
			</div>
	<br><br><br>
			<center>
		<label for="name"><font color="#11214a">�� ��</font></center>
			<div class="inner">
			<div class="field">
			<input type="text" size="248" name="title" id="title"  value="<%=receive_title %>" readonly></div>
			<br>
				<div class="field">
							<label for="contents">Contents</label>
							<textarea  rows="15" name="contents" id="contents" readonly> <%=receive_contents %></textarea>
						</div>		
			</div>
			
		<br>
		
				<footer>
						<center>
						<input type="button" class="button" value="�����ϱ�" onclick="javascript:del()">
						<input type="button" class="button" value="�������" onclick="location='1.receiveReply.jsp'">
						</center>
						
					</footer>
		

	</form>
	
</body>
</html>