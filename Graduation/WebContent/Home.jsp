<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ - ���� ã�� �ð��� ��</title>
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
			} else { //������ ������ ���
		%>
		<%
			if (session.getAttribute("id").equals("rhksflwk") && session.getAttribute("id")!=null) {
		%>

			<script>
			location.href="index_adminLoginAfter.jsp";
			</script>
					
	
			<% }
		 else
		 {
			%>
			<script>
			location.href="index_loginAfter.jsp";
			</script>

			<%  }
		 }%>
		
</body>
</html>