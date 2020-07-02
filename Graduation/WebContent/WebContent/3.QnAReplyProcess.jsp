<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%request.setCharacterEncoding("euc-kr"); %>
    <jsp:useBean id="qMgr" class="QnA.QnAMgr"/>
   <%@ page import="java.sql.Timestamp"%>
<jsp:useBean id="bean" class="QnA.QnABean" />
    
    <%
	bean.setDate(new Timestamp(System.currentTimeMillis()).toString());
    bean.setMemberidx(request.getParameter("member"));
    bean.setTitle(request.getParameter("title"));
    bean.setContents(request.getParameter("reply"));
    String refs=request.getParameter("ref");
    bean.setRef(Integer.parseInt(refs));
    String poss=request.getParameter("pos");
    bean.setPos(Integer.parseInt(poss));
    String depths=request.getParameter("depth");
    bean.setDepth(Integer.parseInt(depths));
    bean.setSecret(Integer.parseInt(request.getParameter("secret")));
    bean.setPassword(request.getParameter("password"));
    String nowPage=request.getParameter("nowPage");
    int idx = Integer.parseInt(request.getParameter("idx"));
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

function logout()
{
	if(confirm("로그아웃 하시겠습니까?")==true)
{

	location.href="logout.jsp";
}
	else
{
	return;
}
}
</script>
</head>
<body>
<%  qMgr.replyUp(bean.getRef(), bean.getPos());
    boolean result=qMgr.reply(bean);
    if(result){
    %>
<script type="text/javascript">
	alert("답변이 등록되었습니다.");
	location.href = "3.QnARead.jsp?nowPage=<%=nowPage%>&idx=<%=idx%>";
</script>
<%
}
    else{
%>
<script type="text/javascript">
	alert("답변이 등록에 실패하였습니다.");
	history.back();
</script>
<%} %>
</body>
</html>