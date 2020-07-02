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
	LogonDBBean manager = LogonDBBean.getInstance(); //회원정보 수정 처리 메소드 호출 후 수정 상황값 반환 

	manager.reportCount(sender);
int reportThree = manager.reportThree(sender);
if(reportThree>=3){
	manager.reportCheck(sender);
}
int idx = Integer.parseInt(request.getParameter("idx"));
boolean resultDelete=false;
resultDelete = rMgr.receiveDelete(idx);

%>
<script type="text/javascript">
alert("정상적으로 신고 되었습니다. 해당 답장은 삭제됩니다.");
location.href="1.receiveReply.jsp";
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