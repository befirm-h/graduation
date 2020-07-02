<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@page import="mail.receiveBean"%>
<%@ page import="member.LogonDBBean"%>
<jsp:useBean id="member" class="member.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%@page import="mail.receiveBean"%>

<%@ page import="java.sql.Timestamp"%>
<jsp:useBean id="rMgr" class="mail.receiveMgr" scope="session" />
<%
	request.setCharacterEncoding("euc-kr");
	String sender = request.getParameter("sender");
	int kind = Integer.parseInt(request.getParameter("kind"));

	LogonDBBean manager = LogonDBBean.getInstance(); //회원정보 수정 처리 메소드 호출 후 수정 상황값 반환 

int idx = Integer.parseInt(request.getParameter("idx"));
	if(kind==0){
int send_idx = Integer.parseInt(request.getParameter("send_idx"));
rMgr.sendManager(send_idx,0);
}
	else{
		rMgr.sendManager(idx,1);
	}
rMgr.reportCount(idx);
if(kind==0)
{
	
	%>
	<script type="text/javascript">
	alert("고민이 신고 되었습니다.\n신고된 고민은 삭제됩니다.");
	location.href="1.receiveWorry.jsp";
	</script>
<%}
else
{
	%>
	<script type="text/javascript">
	alert("답장이 신고 되었습니다.\n신고된 답장은 삭제됩니다.");
	location.href="1.receiveReply.jsp";
	</script>
<%}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>