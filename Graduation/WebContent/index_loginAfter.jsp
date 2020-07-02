<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
<%@page import="mail.receiveBean"%>
<jsp:useBean id="rMgr" class="mail.receiveMgr" scope="session" />

<%@ page import="member.LogonDBBean"%>
<jsp:useBean id="member" class="member.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%

	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("id");
	int newMessage = rMgr.getNewmessage(id); 
	int newReply = rMgr.getReplyCount(id); 
	LogonDBBean manager = LogonDBBean.getInstance(); //ȸ������ ���� ó�� �޼ҵ� ȣ�� �� ���� ��Ȳ�� ��ȯ 
	int reportThree = manager.reportThree(id);
	int reportCheck_w = manager.reportCheck_w(id);

%>
<script type="text/javascript">
	function report(report,check){
		var id = '<%=id%>';
		if(5<=report && report<10 && check==0)
			{
				alert("���� ȸ������ 5ȸ �̻� �Ű� ���Խ��ϴ�. \n10ȸ �̻�� �ڵ����� Ż��ó�� �˴ϴ�.");
				location.href="Report_w.jsp";

			}
		if(7<=report && report<10 && check==1)
			{

					alert("���� ȸ������ 7ȸ �̻� �Ű� ���Խ��ϴ�. \n10ȸ �̻�� �ڵ����� Ż��ó�� �˴ϴ�.");
					location.href="Report_w.jsp";

		    }
		
	 if(report>=10){
			alert("���� ȸ������ 10ȸ �̻� �Ű� ���Խ��ϴ�.\n10ȸ �̻�� �ڵ����� Ż��ó�� �˴ϴ�.");
			location.href="ReportMemberDelete.jsp";

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

	
		<title>Tomorrow is...</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">
	<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/>

	</head>
	<body onload="report(<%=reportThree%>,<%=reportCheck_w%>);">

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="Home.jsp" class="logo">Tomorrow is...</a>
						<a herf="1.receiveWorry.jsp">���� ������</a>
						<a href="1.sendWorry.jsp">���� ������</a>
						<a href="2.answer.jsp">To.������ ��</a>
						<a href="3.QnA.jsp">QnA</a>
						<a href="4.notice_list.jsp">Notice</a>
						<a href="javascript:logout()"><font color="red">Logout</a> </font>
				</div>
			</header>
			
		<!-- Banner -->
			<section id="banner">
				<div class="inner">

					<div class="flex">

						<div>
						<%if(newReply!=0 || newMessage!=0 ){ %>
							<input type="image" src="images/icons/new.gif" width="40px" onclick="location.href='1.receiveWorry.jsp'">
							<% }
						else{%>
							<input type="image" src="images/icons/contact.png" width="40px" onclick="location.href='1.receiveWorry.jsp'"/>
							<%}%>
							<h3>���� ������</h3>
							<p>���� ���� ������ Ȯ���غ�����.</p>
							
						</div>

						<div>
							<input type="image" src="images/icons/paper-plane.png" width="40px" onclick="location.href='1.sendWorry.jsp'"/>
							<h3>���� ������</h3>
							<p>���� ���� ����� Ȯ���غ�����.</p>							
						</div>

						<div>
							<input type="image" src="images/icons/like.png" width="40px"  onclick="location.href='2.answer.jsp'"/>
							<h3>To. ������ ��</h3>
					    	<p>������ ���� � �Ϸ翴����?</p>
						</div>
					</div>
						<input type="button" class="button" value="MyPage" onclick="location='myPage.jsp'" >
						
							
</center>
			</section>


	<!-- Three -->
			<section id="three" class="wrapper align-center">
				<div class="inner">
					<div class="flex flex-2">
						<article>
							<div class="image round">
								<img src="images/mail_black.jpg" alt="Pic 01" /><br><br>
							</div>
						
							<p>���̵� �����̵� ���� �ÿ��ϰ� ��������ϴ�.<br/>�ݴ�� �ȿ� �������� �����ϰ� ������<br/>���̵� �����̵� ���� ���ϴ�.<br />���� ����� �����ϴ�.<br/><font size="2px">#���ν���, ���߸� ��μ� ���̴� �͵�</font>
							<br/>
							<footer>
								<input type="button" onclick="location.href='1.send_contents.jsp'" class="button" value="��� ����"/> 
							</footer>
						</article>
						<article>
							<div class="image round">
								<img src="images/photo_black.png" alt="Pic 02" /><br><br>
							</div>
						
							<p>�����ִ� ����� �ƹ����Գ� ��Ƶ� ���ִ�.<br/>�� �Ĵ� ����� �� �ľ ���ִ�.<br />�ϻ� �������� ���ϴ� ����� �װ� ���̴�.<br/>�Ƶ�ٵ� ��ư��� �ʰ��� ����� �״�ε� ���̴�.<br/>
							<font size="2px">#�̺���, ����</font>
							<footer>
								<input type="button" onclick="location.href='2.question.jsp'" class="button" value="To.������ ��"/>
							</footer>
						</article>
						
					</div>
				</div>
			</section>

		

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>