<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="EUC-KR"%>
<%@ page import="member.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	LogonDBBean logon = LogonDBBean.getInstance();
	
	int check = logon.userCheck(id, password);
	if (check == 1) {
		session.setAttribute("id", id);
		session.setAttribute("password", password);
		if(id.equals("rhksflwk"))
			response.sendRedirect("index_adminLoginAfter.jsp");
		else
		response.sendRedirect("index_loginAfter.jsp");
	} else if (check == 0) {
%>
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("등록된 아이디가 아닙니다.");
	history.go(-1);
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