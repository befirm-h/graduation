<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String pagefile=request.getParameter("pagefile");

	if(pagefile==null)
	{
		pagefile="Home";
	}
%>
<jsp:forward page="templete.jsp">
<jsp:param name="pagefile" value="<%=pagefile%>"/>
</jsp:forward>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>내일은 - 나를 찾는 시간의 힘</title>
</head>
</html>
