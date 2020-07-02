<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="notice.noticeBean"%>
    <jsp:useBean id="nMgr" class="notice.noticeMgr" scope="session"/>
    <% request.setCharacterEncoding("EUC-KR");
String nowPage = request.getParameter("nowPage");

noticeBean bean = (noticeBean) session.getAttribute("bean");
int idx= bean.getIdx();
boolean result=nMgr.noticeDelete(idx);

if(result){

	%>
	<script type="text/javascript">
	alert("삭제되었습니다.");
	location.href="4.notice_list.jsp";
	</script>
	<%} 
else {
%>
<script type="text/javascript">
	alert("삭제 실패하였습니다.");
	history.back();
</script>
<% } %>
 
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>