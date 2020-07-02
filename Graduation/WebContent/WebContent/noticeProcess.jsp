<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%@ page import="notice.noticeMgr"%>
<%@ page import="java.sql.Timestamp"%>
<jsp:useBean id="bean" class="notice.noticeBean">
	<jsp:setProperty name="bean" property="*" />
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		boolean result = false;	
		bean.setTitle(request.getParameter("title"));
		bean.setContents(request.getParameter("contents"));
	 	bean.setNotice_date(new Timestamp(System.currentTimeMillis()).toString());
		noticeMgr send = noticeMgr.getInstance();
		result = send.noticeInsert(bean);
		
		
		if (result) {
			%>
			<script type="text/javascript">
				alert("공지사항이 작성되었습니다..");
				location.href="4.notice_list.jsp";
			</script>
			<%}
			%>