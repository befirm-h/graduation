<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
           	<%request.setCharacterEncoding("euc-kr") ;%>
<%@page import="QnA.QnABean"%>
<jsp:useBean id="qMgr" class="QnA.QnAMgr" />
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String nowPage = request.getParameter("nowPage");
String password=qMgr.getPassword(idx);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./0.style/list.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
<title>Insert title here</title>
<script type="text/javascript">
    function pwdCh(){
    	if(document.getElementById("pwd").value==<%=password%>){
    		  location.href = "3.QnARead.jsp?idx=<%=idx%>&nowPage=<%=nowPage%>";
    	}
    	else{
    		alert("��й�ȣ�� �ùٸ��� �ʽ��ϴ�.");
    		history.back();
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
 %> </nav>
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
<%

if(password.equals("0")||(session.getAttribute("id")!=null&&session.getAttribute("id").equals("rhksflwk"))){%>
    <script type="text/javascript">
    location.href = "3.QnARead.jsp?idx=<%=idx%>&nowPage=<%=nowPage%>";
   </script><%}
else{
%>
<p align="center">��й�ȣ 4�ڸ��� �Է����ּ���
<br><br>
<input type="password" name="pwd" id="pwd" style="width:30% ;" >
<br>
<br>
<input type="button" value="Ȯ��" onclick="pwdCh()"></p>
<%} %>
</table>
</body>
</html>