<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="member.LogonDBBean"%>
<jsp:useBean id="member" class="member.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%@ page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("euc-kr");
String id=(String)session.getAttribute("id");
	LogonDBBean manager = LogonDBBean.getInstance(); //ȸ������ ���� ó�� �޼ҵ� ȣ�� �� ���� ��Ȳ�� ��ȯ 

	manager.ReportMemberDelete(id);
	session.invalidate();


%>
<script type="text/javascript">
location.href="Home.jsp";
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>