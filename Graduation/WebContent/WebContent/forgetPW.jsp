<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="EUC-KR"%>
<%@ page import="member.LogonDBBean"%>
<%@ page import="java.sql.Timestamp"%>

<%  
String id=request.getParameter("id");
String email=request.getParameter("email");
	
	LogonDBBean manager = LogonDBBean.getInstance(); //����ڰ� �Է��� ����������� ��ü�� ������ ȸ������ ó�� �޼ҵ�ȣ��
	int result=manager.forgetPW(id, email);

	if (result==1) {
%>
<form name="form" method="post"  action="pwUpdate.jsp">
<input type="hidden" name="id" value="<%=id%>">
</form>
<script type="text/javascript">
document.form.submit();
</script>
<%
	} else if(result==0){
%>
<script type="text/javascript">
	alert("�̸����� �ùٸ��� �ʽ��ϴ�.");
	history.back();
</script>
<%
	}
	else{
%>
<script type="text/javascript">
	alert("���̵� �������� �ʽ��ϴ�.");
	history.back();
</script>
<%} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Insert title here</title>
</head>
<body>
</body>
</html>