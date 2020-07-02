<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"%>
<%@ page import="member.LogonDBBean"%>
<jsp:useBean id="member" class="member.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	//id는 사용자가 회원가입을 하기위해서 입력한 아이디 
	String id = request.getParameter("id");
	//DB처리빈인 LogonDBBean클래스의 객체를 얻어낸다.
	LogonDBBean manager = LogonDBBean.getInstance();

	boolean result = manager.insertMember(member);
	if (result) {
%>
<script type="text/javascript">
	alert("♥환영합니다♥");
	location.href = "Home.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("회원가입에 실패 하였습니다.");
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