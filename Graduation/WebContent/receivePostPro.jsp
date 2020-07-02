<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="rMgr" class="receive.receiveMgr" />
<%
	rMgr.insertBoard(request);
	response.sendRedirect("../main.jsp?pagefile=./board/list");
%>