<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="receive.receiveBean"%>
<jsp:useBean id="rMgr" class="receive.receiveMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	rMgr.upCount(idx);//��ȸ�� ���� 
	receiveBean bean = rMgr.getBoard(idx);//�Խù� ��������
	String name = bean.getName();
	String title = bean.getTitle();
	String reg_date = bean.getReg_date();
	String content = bean.getContent();
	String filename = bean.getFilename();
	int filesize = bean.getFilesize();
	String ip = bean.getIp();
	int count = bean.getCount();
	session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function list() {
		document.listFrm.action = "main.jsp";
		document.listFrm.submit();
	}
	function update(idx) {
		document.updateFrm.idx.value = idx;
		document.updateFrm.pagefile.value = "./board/update";
		document.updateFrm.action = "main.jsp";
		document.updateFrm.submit();
	}
	function reply(idx) {
		document.replyFrm.idx.value = idx;
		document.replyFrm.pagefile.value = "./board/reply";
		document.replyFrm.action = "main.jsp";
		document.replyFrm.submit();
	}
	function del(idx) {
		document.delFrm.idx.value = idx;
		document.delFrm.pagefile.value = "./board/delete";
		document.delFrm.action = "main.jsp";
		document.delFrm.submit();
	}
	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
</script>
<body>
	<h3>�Խ��� �ۺ���</h3>
	<table border="0" cellpadding="3" cellspacing="0" width=100%>
		<tr>
			<td align="center" bgcolor="#DDDDDD" width="10%">�� ��</td>
			<td bgcolor="#FFFFE8"><%=name%></td>
			<td align="center" bgcolor="#DDDDDD" width=10%>��ϳ�¥</td>
			<td bgcolor="#FFFFE8"><%=reg_date%></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DDDDDD">�� ��</td>
			<td bgcolor="#FFFFE8" colspan="3"><%=title%></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DDDDDD">÷������</td>
			<td bgcolor="#FFFFE8" colspan="3">
				<%
					if (filename != null && !filename.equals("")) {
				%> <a href="javascript:down('<%=filename%>')"><%=filename%></a>
				&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)
			</font> <%
 	} else {
 %> ��ϵ� ������ �����ϴ�.<%
 	}
 %>
			</td>
		</tr>
		<tr>
			<td colspan="4"><br /> <pre><%=content%> </pre><br /></td>
		</tr>
		<tr>
			<td colspan="4" align="right"><%=ip%> �� ���� ���� ����̽��ϴ� ./ ��ȸ�� <%=count%>
			</td>
		</tr>
	</table>
	<hr />
	[
	<a href="javascript:list() "> ����Ʈ </a> |
	<a href="javascript:update('<%=idx%>') "> �� �� </a> |
	<a href="javascript:reply('<%=idx%>')"> �� �� </a> |
	<a href="javascript:del('<%=idx%>')"> �� �� </a> ]
	<br>
	<form name="downFrm" action="./board/download.jsp" method="post">
		<input type="hidden" name="filename">
	</form>
	<form name="listFrm" method="post">
		<input type="hidden" name="pagefile" value="./board/list"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
		<%
			if (!(keyWord == null || keyWord.equals("null"))) {
		%>
		<input type="hidden" name="keyField" value="<%=keyField%>"> <input
			type="hidden" name="keyWord" value="<%=keyWord%>">
		<%
			}
		%>
	</form>
	<form name="updateFrm" method="get">
		<input type="hidden" name="pagefile" value="./baord/update"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
	<form name="replyFrm" method="get">
		<input type="hidden" name="pagefile" value="./baord/reply"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
	<form name="delFrm" method="get">
		<input type="hidden" name="pagefile" value="./baord/delete"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
</body>
</html>