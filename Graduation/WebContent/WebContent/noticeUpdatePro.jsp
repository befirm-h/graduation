<%@ page contentType="text/html; charset=EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");
%>
<%@ page import="notice.noticeMgr"%>
<%@ page import="java.sql.Timestamp"%>
<jsp:useBean id="bean" class="notice.noticeBean">
	<jsp:setProperty name="bean" property="*" />
</jsp:useBean>
<jsp:useBean id="nMgr" class="notice.noticeMgr" scope="session" />

<%
String nowPage = request.getParameter("nowPage");
int idx = Integer.parseInt(request.getParameter("idx"));

nMgr.updateNotice(bean);
%>
<script type="text/javascript">
alert("수정이 완료되었습니다.");
location.href="4.notice_list.jsp";
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