<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.LogonDBBean" %>

<% request.setCharacterEncoding("euc-kr");
	String id=(String)session.getAttribute("id");
	String password=request.getParameter("password");
	LogonDBBean manager = LogonDBBean.getInstance();
	boolean check = manager.pwdCheck(id,password);
	%>
	<% if(check)
	{
		int deleteCheck=manager.deleteMember(id, password);
		if(deleteCheck==1)
		{
			session.invalidate();
			%>
			<script>
			alert("탈퇴되었습니다.");
			location.href="Home.jsp";
			</script>
		<%}
	 }else
	{%>
	<script>
	alert("비밀번호를 다시 확인해주세요!");
	history.go(-1);
	</script>
	
	<% }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>