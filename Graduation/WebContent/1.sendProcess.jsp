<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%@ page import="mail.sendMgr"%>
<%@page import="mail.receiveBean"%>
<%@ page import="java.sql.Timestamp"%>
<jsp:useBean id="bean" class="mail.sendBean">
	<jsp:setProperty name="bean" property="*" />
</jsp:useBean>
<jsp:useBean id="rMgr" class="mail.receiveMgr" scope="session" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		
	
	 	bean.setDate(new Timestamp(System.currentTimeMillis()).toString());
		bean.setSender(session.getAttribute("id").toString());
		bean.setSenderTitle(request.getParameter("title"));
		bean.setSenderContents(request.getParameter("contents"));
		bean.setKind(request.getParameter("kind"));
		bean.setCount(request.getParameter("count"));
		bean.setSend_idx(request.getParameter("send_idx"));
		sendMgr send = sendMgr.getInstance();
			

		boolean result = false;
		boolean resultDelete=false;

		
		if (bean.getKind().equals("0")) {
			result = send.sendMail(bean);
			
		} else {
			String receiver = request.getParameter("receiver");
			bean.setCount(request.getParameter("count"));
			bean.setAdd_title(request.getParameter("worry_title"));
			bean.setAdd_contents(request.getParameter("worry_contents"));
			result = send.receiveMail(bean, receiver);
		
		}
		
		if (result) {
			if (bean.getKind().equals("0")) {%>
				<script type="text/javascript">
				alert("편지가 전송되었습니다.");
				location.href="1.sendWorry.jsp";
			</script><%
			} else {%>
			
			<%
				int idx = Integer.parseInt(request.getParameter("idx"));
				resultDelete = rMgr.receiveDelete(idx);

			
			%>
			 
			<script type="text/javascript">
				alert("편지가 전송되었습니다.");
				location.href="1.receiveWorry.jsp";
				</script>
			<%}
			}
			%>