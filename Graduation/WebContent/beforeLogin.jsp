<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.LogonDBBean"%>
<%@ page import="java.sql.Timestamp"%>
<jsp:useBean id="member" class="member.LogonDataBean">
<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	//폼으로 부터 넘어오지 않는 데이터인 가입날짜를 직접 데이터저장빈에 세팅 
	LogonDBBean manager = LogonDBBean.getInstance(); //사용자가 입력한 데이터저장빈 객체를 가지고 회원가입 처리 메소드호출
	boolean result = manager.insertMember(member);
	if (!(result)) {
%>
<script type="text/javascript">
	alert("로그인 후 이용해주세요!");
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