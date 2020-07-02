<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%request.setCharacterEncoding("euc-kr"); %>
    <jsp:useBean id="aMgr" class="question.answerMgr"/>
    <jsp:useBean id="bean" class="question.answerBean" scope="session"/>
    <jsp:useBean id="upbean" class="question.answerBean" />
    <%
    String nowPage=request.getParameter("nowPage");
    upbean=bean;
    upbean.setAnswer(request.getParameter("answer"));
    upbean.setGood(request.getParameter("good"));
    upbean.setBad(request.getParameter("bad"));
    upbean.setDecide(request.getParameter("decide"));

    boolean result=aMgr.updateAnswer(upbean);
    if(result){
    %>
    <script type="text/javascript">
    alert("수정완료");
    location.href = "2.answerRead.jsp?nowPage=<%=nowPage%>&idx=<%=upbean.getIdx()%>";
    </script>
    <%}else {%>
    <script type="text/javascript">
    alert("수정실패");
    history.back();
    </script>
    <%} %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>