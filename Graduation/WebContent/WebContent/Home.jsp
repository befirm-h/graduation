<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link href="Menu.css" rel="stylesheet" type="text/css">
<link href="./0.style/list.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>내일은 - 나를 찾는 시간의 힘</title>
</head>
<body>	
	<%
		request.setCharacterEncoding("euc-kr");
		if (session.getAttribute("id") == null) {
	%>		
			<script>
			location.href="index.jsp";
			</script>
			
		<%
			} else { //세션이 설정된 경우
		%>
		<%
			if (!(session.getAttribute("id").equals("hsy3806") || session.getAttribute("id")==null)) {
		%>

			<script>
			location.href="index_adminLoginAfter.jsp";
			</script>
					
	
			<% }
		 else
		 {
			%>
			<b>관리자</b>님 로그인하셨습니다.

			<%  }
		 }%>
		
</body>
</html>