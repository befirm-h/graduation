<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%@page import="notice.noticeBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="nMgr" class="notice.noticeMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int totalRecord = 0; //��ü���ڵ�� 
	int numPerPage = 10; // �������� ���ڵ� �� 
	int pagePerBlock = 15; //���� ��������
	int totalPage = 0; //��ü ������ �� 
	int totalBlock = 0; //��ü ����
	int nowPage = 1; // ���������� 
	int nowBlock = 1; //�����
	int start = 0; //����� select ���۹�ȣ 
	int end = 10; //���۹�ȣ�� ���� ������ select ����
	int listSize = 0; //���� �о�� �Խù��� �� 

	Vector<noticeBean> vlist = null;
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage;
	end = start + numPerPage;
	totalRecord = nMgr.getTotalCount();

	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //��ü�������� 
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //����� ��� 
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //��ü�����
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../assets/css/main.css"/>
<link href="../0.style/list.css" rel="stylesheet" type="text/css">
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">

</head>
<body>
	<!-- Header -->
	<header id="header">
	<div class="inner">
		<a href="Home.jsp" class="logo">Tomorrow is...</a>
		<nav id="nav"> <a href="elements.html">QnA</a> <a href="#">Notice</a>
		<%
			if (!(session.getAttribute("id") == null)) {
		%> <a href="logout.jsp"><font color="red">Logout</a> </font> <%
 	}
 %> </nav>
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>

	<!-- Banner -->
	<section id="banner">
	<div class="inner">
		<div class="flex">
			<div>
				<img src="../images/icons/microphone.png" width="50px" /><br>
				<br>
				<h3>�� �� �� ��</h3>
				<p>
					<br>
				</p>
			</div>
		</div>
	</div>
	</section>
</head>

<body>
	<br>
	<div class="list">
		<table class="list_table">
			<colgroup>
				<col width="3%" />
				<col width="85%" />
				<col width="2%" />
				<col width="10%" />
			</colgroup>

			<thead>
				<tr>
					<th>No.</th>
					<th>Title</th>
					<th>Writer</th>
					<th>Date</th>
					<th>Hits</th>
				</tr>
			</thead>

			<tbody>
				<%
					vlist = nMgr.NoticeList(start, end);
					listSize = vlist.size();//������ ȭ�鿡 ������ �Խù�����

					if (vlist.isEmpty()) {
				%>
				<tr>
					<td colspan="4" align="center">��ϵ� �Խù��� �����ϴ� .</td>
				</tr>
				<%
					} else {
						for (int i = 0; i < numPerPage; i++) {
							if (i == listSize)
								break;
							noticeBean bean = vlist.get(i);
							int idx = bean.getIdx();

							String title = bean.getTitle();
							String contents = bean.getContents();
							String date = bean.getNotice_date();
							int count = bean.getCount();

							int pos = bean.getPos();
				%>
				<tr>
					<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
					<td>
						<%
							if (pos > 0) {
										for (int j = 0; j < pos; j++) {
											out.println("&nbsp;&nbsp;");
										}
									}
						%> <a
						href="notice_read.jsp?idx=<%=idx%>"><%=title%></a>
					</td>
					<td>������</td>
					<td><%=date%></td>
					<td><%=count%></td>
				</tr>
				<%
					} // for 
					} //if
				%>
			</tbody>
	</div>
	<br>
	<footer> <input type="hidden" name="idx"> <%
 	if (session.getAttribute("id") == null || !(session.getAttribute("id") == "rhksflwk")) {
 %> <script type="text/javascript">
		location.href = "List.jsp";
	</script> <%
 	} else {
 %>
	<center>
		<input type="button" class="button" value="�ۼ��ϱ�"
			onclick="notice_write.jsp">
	</center>
	<%
		}
	%>

	<div class="paging">
		<ol>
			<%
				int pageStart = (nowBlock - 1) * pagePerBlock + 1; //�ϴ� ������ ���۹�ȣ
				int pageEnd = ((pageStart + pagePerBlock) < totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
				//�ϴ� ������ ����ȣ
				if (totalPage != 0) {
					if (nowBlock > 1) {
			%>
			<li><a href="javascript:block('<%=nowBlock - 1%>')">[����]</a> <%
 	}
 %>&nbsp;</li>
			<%
				for (; pageStart < pageEnd; pageStart++) {
			%>
			<li><a href="javascript:pageing('<%=pageStart%>')"> <%
 	if (pageStart == nowPage) {
 %>
					<font color="blue"><Strong> <%
 	}
 %> [<%=pageStart%>]
							<%
 	if (pageStart == nowPage) {
 %></Strong></font> <%
 	}
 %></a></li>
			<%
				} //for
			%>&nbsp;
			<%
				if (totalBlock > nowBlock) {
			%>
			<li><a href="javascript:block('<%=nowBlock + 1%>')">[����]</a></li>
			<%
				}
			%>&nbsp;
			<%
				}
			%>
		</ol>
	</div>
	</form>
</body>
</html>
</head>
<body>


</body>
</html>