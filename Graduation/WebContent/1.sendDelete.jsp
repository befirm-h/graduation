<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="mail.sendBean"%>
    <%@page import="mail.receiveBean"%>
    <jsp:useBean id="sMgr" class="mail.sendMgr" scope="session"/>
    <% request.setCharacterEncoding("EUC-KR");
String nowPage = request.getParameter("nowPage");

sendBean bean = (sendBean) session.getAttribute("bean");
int idx= bean.getIdx();
String kind = request.getParameter("kind");
boolean result=sMgr.sendDelete(idx);

if(result){

   if(kind.equals("0")){%>
   <script type="text/javascript">
   alert("삭제되었습니다.");
   location.href="1.sendWorry.jsp";
   </script><%} 
   else
   {%>
      <script type="text/javascript">
      alert("삭제되었습니다.");
      location.href="1.sendReply.jsp";
      </script>
      session.invalidate();
   <%}


} else {
%>
<script type="text/javascript">
   alert("삭제 실패하였습니다.");
   history.back();
</script>
<% } %>
 