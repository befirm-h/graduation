<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%request.setCharacterEncoding("euc-kr"); %>
    <%@page import="QnA.QnABean" %>
    <jsp:useBean id="qMgr" class="QnA.QnAMgr"/>
    <%
    String nowPage=request.getParameter("nowPage");
    int ridx=Integer.parseInt(request.getParameter("ridx"));
    int idx=Integer.parseInt(request.getParameter("idx"));
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
boolean result=qMgr.deleteQnA(ridx);
if(result){
    %>
<script type="text/javascript">
	alert("삭제되었습니다.");
	location.href = "3.QnARead.jsp?nowPage=<%=nowPage%>&idx=<%=idx%>";
</script>
<%
}
    else{
%>
<script type="text/javascript">
	alert("삭제에 실패하였습니다.");
	history.back();
</script>
<%} %>

</head>
<body>

</body>
</html>