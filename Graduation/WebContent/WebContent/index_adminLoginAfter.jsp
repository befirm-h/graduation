<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>


<%@ page import="member.LogonDBBean"%>
<jsp:useBean id="member" class="member.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("id");

	LogonDBBean manager = LogonDBBean.getInstance(); //ȸ������ ���� ó�� �޼ҵ� ȣ�� �� ���� ��Ȳ�� ��ȯ 


%>
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

	
		<title>Tomorrow is...</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">

	</head>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="Home.jsp" class="logo">Tomorrow is...</a>
						<a href="admin_userCheck.jsp">ȸ�����</a>
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
							<input type="image" src="images/icons/user.png" width="40px" onclick="location.href='admin_userCheck.jsp'"/>
							<h3>ȸ�����</h3>
							
						</div>

						<div>
							<input type="image" src="images/icons/question2.png" width="40px" onclick="location.href='3.QnA.jsp'"/>
							<h3>QnA����</h3>
						</div>

						<div>
							<input type="image" src="images/icons/microphone.png" width="40px"  onclick="location.href='4.notice_list.jsp'"/>
							<h3>��������</h3>
						</div>
					</div>
						
							
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
								<a href="1.send_contents.jsp" class="button">��� ����</a>
							</footer>
						</article>
						<article>
							<div class="image round">
								<img src="images/photo_black.png" alt="Pic 02" /><br><br>
							</div>
						
							<p>�����ִ� ����� �ƹ����Գ� ��Ƶ� ���ִ�.<br/>�� �Ĵ� ����� �� �ľ ���ִ�.<br />�ϻ� �������� ���ϴ� ����� �װ� ���̴�.<br/>�Ƶ�ٵ� ��ư��� �ʰ��� ����� �״�ε� ���̴�.<br/>
							<font size="2px">#�̺���, ����</font>
							<footer>
								<a href="2.questionCheck.jsp" class="button">To.������ ��</a>
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