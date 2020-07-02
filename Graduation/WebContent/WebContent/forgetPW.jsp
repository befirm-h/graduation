<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="EUC-KR"%>
<%@ page import="member.LogonDBBean"%>
<%@ page import="java.sql.Timestamp"%>

<%  
String id=request.getParameter("id");
String email=request.getParameter("email");
	
	LogonDBBean manager = LogonDBBean.getInstance(); //사용자가 입력한 데이터저장빈 객체를 가지고 회원가입 처리 메소드호출
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
	alert("이메일이 올바르지 않습니다.");
	history.back();
</script>
<%
	}
	else{
%>
<script type="text/javascript">
	alert("아이디가 존재하지 않습니다.");
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