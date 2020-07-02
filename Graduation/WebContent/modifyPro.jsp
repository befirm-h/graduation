<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="member.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = (String) session.getAttribute("id");
%>
<jsp:useBean id="member" class="member.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	LogonDBBean manager = LogonDBBean.getInstance(); //회원정보 수정 처리 메소드 호출 후 수정 상황값 반환 
	int check = manager.updateMember(member);
	if (check == 1) {
%>
<script type="text/javascript">
	alert("정보를 수정 하였습니다.");
	location.href="Home.jsp"
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("정보수정에 실패 하였습니다.");
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
<body>회원정보 수정 페이지!
</body>
</html>