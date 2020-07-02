<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="mail.receiveBean"%>
    <jsp:useBean id="rMgr" class="mail.receiveMgr" scope="session"/>
    <% request.setCharacterEncoding("EUC-KR");
String nowPage = request.getParameter("nowPage");

receiveBean bean = (receiveBean) session.getAttribute("bean");
int idx= bean.getIdx();
boolean result=rMgr.receiveDelete(idx);

if(result){%>

	<script type="text/javascript">
	alert("삭제되었습니다.");
	location.href="1.receiveReply.jsp";
	</script>

<%} else {
%>
<script type="text/javascript">
	alert("삭제 실패하였습니다.");
	history.back();
</script>
<% } %>
 