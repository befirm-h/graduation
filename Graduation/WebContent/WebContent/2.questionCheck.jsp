<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="question.answerMgr"%>
<%@ page import="java.sql.Timestamp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
	
		String member = session.getAttribute("id").toString();
		String date = new Timestamp(System.currentTimeMillis()).toString();
		answerMgr db = answerMgr.getInstance();
		int x = db.questionCheck(member, date);
		if (x == -1) {
			x=1;
			session.setAttribute("qcount", x);
	%>
	<script type="text/javascript">
		if (confirm("������ �����ðڽ��ϱ�?")) {
			location.href ="2.answer_contents.jsp"
			pagefile = "2.question";//�亯�ۼ� �� �̵�
		} else {
			history.back();
		}
	</script>
	<%
		} else if(x==0){
			session.setAttribute("qcount", x);
	%>
	<script type="text/javascript">
		alert("���� �Ϸ� �̹� ������ �����̽��ϴ�.");
		history.back();
	</script>


	<%
		} else{
			session.setAttribute("qcount", x+1);//���� ������ �ޱ� ���ؼ� +1�Ѵ�.
	%>
		<script type="text/javascript">
		if (confirm("������ �����ðڽ��ϱ�?")) {
			location.href ="2.answer_contents.jsp"
			pagefile = "2.question";//�亯�ۼ� �� �̵�
		} else {
			history.back();
		}
	</script>
	
	
<%} %>
</body>
</html>