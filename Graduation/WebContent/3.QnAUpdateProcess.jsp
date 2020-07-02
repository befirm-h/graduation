<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%request.setCharacterEncoding("euc-kr"); %>
    <jsp:useBean id="qMgr" class="QnA.QnAMgr"/>
    <jsp:useBean id="bean" class="QnA.QnABean" scope="session"/>
    <jsp:useBean id="upbean" class="QnA.QnABean" />
    <%
    int idx=Integer.parseInt(request.getParameter("idx"));
    String nowPage=request.getParameter("nowPage");
    int depth=Integer.parseInt(request.getParameter("depth"));
    upbean=bean;
    
    if(depth==0){
    upbean.setTitle(request.getParameter("title"));
    upbean.setContents(request.getParameter("contents"));
    upbean.setPassword(request.getParameter("pwd"));
    
    }
    else{
    	  upbean.setContents(request.getParameter("contents"));	
    }
    out.print(idx);
    boolean result=qMgr.updateQnA(upbean);
    
    if(depth==0){
    if(result){
    %>
    <script type="text/javascript">
    alert("수정완료");
    location.href = "3.QnAPassword.jsp?nowPage=<%=nowPage%>&idx=<%=upbean.getIdx()%>";
    </script>
    <%}else {%>
    <script type="text/javascript">
    alert("수정실패");
    history.back();
    </script>
    <%} 
    }
    else{
    	 if(result){
    %>
    <script type="text/javascript">
    alert("수정완료");
    location.href = "3.QnAPassword.jsp?nowPage=<%=nowPage%>&idx=<%=upbean.getRef()%>";
    </script>
    <%}else {%>
    <script type="text/javascript">
    alert("수정실패");
    history.back();
    </script>
    <%} 
    }%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>