<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"%>
<%@ page import="member.LogonDBBean"%>
<jsp:useBean id="member" class="member.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	//id�� ����ڰ� ȸ�������� �ϱ����ؼ� �Է��� ���̵� 
	String id = request.getParameter("id");
	//DBó������ LogonDBBeanŬ������ ��ü�� ����.
	LogonDBBean manager = LogonDBBean.getInstance();

	boolean result = manager.insertMember(member);
	if (result) {
%>
<script type="text/javascript">
	alert("��ȯ���մϴ٢�");
	location.href = "Home.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("ȸ�����Կ� ���� �Ͽ����ϴ�.");
	history.back();
</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Insert title here</title>
</head>
<body>
</body>
</html>