<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="mail.sendMgr" %>
<%@ page import="java.sql.Timestamp"%>
<jsp:useBean id="bean" class="mail.sendBean">
	<jsp:setProperty name="bean" property="*" />
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
bean.setDate(new Timestamp(System.currentTimeMillis()).toString());

bean.setSender(request.getParameter("id"));
bean.setSenderTitle(request.getParameter("title"));
bean.setSenderContents(request.getParameter("contents"));
bean.setKind(request.getParameter("kind"));

	sendMgr send= sendMgr.getInstance(); 
	boolean result = send.sendMail(bean);
	if (result) {
%>
<script type="text/javascript">
	alert("������ ���۵Ǿ����ϴ�.");
	location.href = "0.first.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("���� ���ۿ� �����Ͽ����ϴ�.");
	history.back();
</script>
<%
	}
%>
</body>
</html>