<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%@ page import="question.answerMgr"%>
<%@ page import="java.sql.Timestamp"%>
<jsp:useBean id="bean" class="question.answerBean">
	<jsp:setProperty name="bean" property="*" />
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String qcountString=request.getParameter("qcount");
	out.println(qcountString);
	int q=Integer.parseInt(qcountString);
		bean.setDate(new Timestamp(System.currentTimeMillis()).toString());
		bean.setMember(session.getAttribute("id").toString());
		bean.setAnswer(request.getParameter("answer"));
		bean.setBad(request.getParameter("bad"));
		bean.setGood(request.getParameter("good"));
		bean.setDecide(request.getParameter("decide"));
		bean.setCount(q);
		bean.setQidx(Integer.parseInt(request.getParameter("qcount").toString()));
        
		answerMgr db = answerMgr.getInstance();
		boolean result = false;
	    result=db.insertAnswer(bean);
		if (result) {
	%>
	<script type="text/javascript">
		alert("답변이 저장되었습니다..");
		location.href = "0.first.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("답변 저장에 실패하였습니다.");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>