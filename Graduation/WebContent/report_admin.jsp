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
String reportMem = request.getParameter("reportMem");
LogonDBBean manager = LogonDBBean.getInstance(); //ȸ������ ���� ó�� �޼ҵ� ȣ�� �� ���� ��Ȳ�� ��ȯ 
manager.reportCount(reportMem);
int idx = Integer.parseInt(request.getParameter("idx"));


rMgr.receiveDelete(idx);
%>

<script type="text/javascript">
alert("�ش� ȸ���� �Ű�Ǿ����ϴ�.")
location.href="admin_report.jsp";
</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
</html>