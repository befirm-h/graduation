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
	alert("�����Ǿ����ϴ�.");
	location.href="1.receiveReply.jsp";
	</script>

<%} else {
%>
<script type="text/javascript">
	alert("���� �����Ͽ����ϴ�.");
	history.back();
</script>
<% } %>
 