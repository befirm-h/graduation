<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%
   request.setCharacterEncoding("euc-kr");
%>
<%@ page import="QnA.QnAMgr"%>
<%@ page import="java.sql.Timestamp"%>
<jsp:useBean id="bean" class="QnA.QnABean" />
<%
QnAMgr qna = QnAMgr.getInstance();
boolean result = false;


      bean.setDate(new Timestamp(System.currentTimeMillis()).toString());

      bean.setMemberidx(session.getAttribute("id").toString());
      bean.setTitle(request.getParameter("title"));
      bean.setContents(request.getParameter("contents"));
      String s=request.getParameter("secret");
      out.print(s);
      if(request.getParameter("secret").equals("yes")){
      out.print("����");
      bean.setSecret(1);
      bean.setPassword(request.getParameter("pwd"));
      }
      else{
         out.print("��");
         bean.setSecret(0);
      }
      result=qna.insertQnA(bean);
      out.print("QnAProcess");
   if (result) {
%>
<script type="text/javascript">
   alert("���������� QnA�� ��ϵǾ����ϴ�.");
   location.href = "3.QnA.jsp";
</script>
<%
   } else {
%>
<script type="text/javascript">
   alert("QnA ��Ͽ� �����ϼ̽��ϴ�");
   history.back();
</script>
<%
   }
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