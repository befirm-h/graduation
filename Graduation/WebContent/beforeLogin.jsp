<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.LogonDBBean"%>
<%@ page import="java.sql.Timestamp"%>
<jsp:useBean id="member" class="member.LogonDataBean">
<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	//������ ���� �Ѿ���� �ʴ� �������� ���Գ�¥�� ���� ����������� ���� 
	LogonDBBean manager = LogonDBBean.getInstance(); //����ڰ� �Է��� ����������� ��ü�� ������ ȸ������ ó�� �޼ҵ�ȣ��
	boolean result = manager.insertMember(member);
	if (!(result)) {
%>
<script type="text/javascript">
	alert("�α��� �� �̿����ּ���!");
	location.href = "0.first.jsp";
</script>
<%}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>