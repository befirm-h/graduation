<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="member.LogonDBBean"%>
<jsp:useBean id="member" class="member.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	request.setCharacterEncoding("euc-kr");
    String id=request.getParameter("id");
    String pw=request.getParameter("password");

	LogonDBBean manager = LogonDBBean.getInstance(); //ȸ������ ���� ó�� �޼ҵ� ȣ�� �� ���� ��Ȳ�� ��ȯ 
	boolean result = manager.updatePW(id,pw);
	if (result) {
%>
<script type="text/javascript">
	alert("��й�ȣ�� ����Ǿ����ϴ�.");
	location.href="Home.jsp"
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("��й�ȣ ���濡 ���� �Ͽ����ϴ�.");
	history.back();
</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
</html>