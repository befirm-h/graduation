<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
<%@page import="mail.receiveBean"%>
<jsp:useBean id="rMgr" class="mail.receiveMgr" scope="session" />
<%@page import="java.util.Vector"%>
<%@page import="member.LogonDataBean"%>
<%@ page import="member.LogonDBBean"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("id");

	LogonDBBean manager = LogonDBBean.getInstance(); //ȸ������ ���� ó�� �޼ҵ� ȣ�� �� ���� ��Ȳ�� ��ȯ
	LogonDBBean mMgr = LogonDBBean.getInstance();

		request.setCharacterEncoding("EUC-KR");
		int totalRecord = 0; //��ü���ڵ�� 
		int numPerPage = 5; // �������� ���ڵ� �� 
		int pagePerBlock = 15; //���� ��������
		int totalPage = 0; //��ü ������ �� 
		int totalBlock = 0; //��ü ����
		int nowPage = 1; // ���������� 
		int nowBlock = 1; //�����
		int start = 0; //����� select ���۹�ȣ 
		int end = 10; //���۹�ȣ�� ���� ������ select ����
		int listSize = 0; //���� �о�� �Խù��� �� 
		int newMessage = rMgr.getNewmessage(id); 

		Vector<LogonDataBean> vlist = null;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		start = (nowPage * numPerPage) - numPerPage;
		end = start + numPerPage;
		totalRecord = mMgr.getTotalCount();

		totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //��ü�������� 
		nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //����� ��� 
		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //��ü�����
	%>
<script type="text/javascript">

	
	function logout()
	{
		if(confirm("�α׾ƿ� �Ͻðڽ��ϱ�?")==true)
	{

		location.href="logout.jsp";
	}
		else
	{
		return;
	}
}
	
	function list() {
		document.listFrm.action= "index_adminLoginAfter.jsp";
		document.listFrm.submit();
		}
		function pageing(page) {
		location.href="index_adminLoginAfter.jsp?nowPage="+page;
		}
		function block(value) {
		var pagePerBlock=<%=pagePerBlock%> * (value-1) + 1;
		location.href="index_adminLoginAfter.jsp?nowPage="+pagePerBlock;

		}
		function logout()
		{
			if(confirm("�α׾ƿ� �Ͻðڽ��ϱ�?")==true)
		{

			location.href="logout.jsp";
		}
			else
		{
			return;
		}
		}


	</script>

	
		<title>Tomorrow is...</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">

	</head>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="Home.jsp" class="logo">Tomorrow is...</a>
						<a href="admin_report.jsp">�Ű����</a>
						<a href="3.QnA.jsp">QnA</a>
						<a href="4.notice_list.jsp">Notice</a>
						<a href="javascript:logout()"><font color="red">Logout</a> </font>
				</div>
			</header>
			
		<!-- Banner -->
			<!-- Banner -->
			<section id="banner">
				<div class="inner">

					<div class="flex">

						<div>
						<%if( newMessage!=0 ){ %>
							<input type="image" src="images/icons/siren_rhksflwk.gif" width="40px" onclick="location.href='admin_report.jsp'">
							<% }
						else{%>
							<input type="image" src="images/icons/alarm_rhksflwk.png" width="40px" onclick="location.href='admin_report.jsp'"/>
							<%}%>
							<h3>�Ű����</h3>
							
						</div>
						<div>
							<input type="image" src="images/icons/question2.png" width="35px" onclick="location.href='3.QnA.jsp'"/>
							<h3>QnA����</h3>
						</div>

						<div>
							<input type="image" src="images/icons/microphone.png" width="35px"  onclick="location.href='4.notice_list.jsp'"/>
							<h3>��������</h3>
						</div>
					</div>
						
							
</center>
			</section><br><br>
			
<table>
			<colgroup>
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>ID</th>
					<th>Password</th>
					<th>Email</th>
					<th>Report</th>
				</tr>
			</thead>

			<tbody>
			<% 
  vlist = mMgr.getUserList(start, end); 
  listSize = vlist.size();//������ ȭ�鿡 ������ �Խù�����
  if (vlist.isEmpty()) { 
  %>
		<tr>
			<td colspan="4" align="center">��ϵ� ȸ���� �����ϴ� .</td>
		</tr>
		<% 
  } else { 
	  for (int i = 0; i < numPerPage; i++) { 
		  if (i == listSize) break; 
		  LogonDataBean bean = vlist.get(i); 
		  int idx = bean.getIdx(); 
		  String mem=bean.getId();
		  String password=bean.getPassword();
		  String email=bean.getEmail();
		  int report=bean.getReport();
		  %>
		<tr>
			<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
			<td><%=mem%></td>
			<td><%=password%></td>
			<td><%=email%></td>
			<td><%=report%></td>
		</tr>
		<% 
		  } // for 
	  } //if 
	  %>
			</tbody>
		</table>
		
			<br><center>
			
	<%
int pageStart= (nowBlock-1) * pagePerBlock+ 1; //�ϴ����������۹�ȣ
int pageEnd= ((pageStart+ pagePerBlock) < totalPage) ? (pageStart+ pagePerBlock) : totalPage+ 1;
//�ϴ�����������ȣ
if(totalPage!= 0) {
if(nowBlock> 1) {
%>
<a href="javascript:block('<%=nowBlock-1%>')">[����]</a>
<%} %>&nbsp;
<% for(; pageStart< pageEnd; pageStart++) { %>
<a href="javascript:pageing('<%=pageStart%>')">
<% if(pageStart== nowPage) {%>
<font color="blue"><Strong>
<%} %>[<%=pageStart%>] 
<%if(pageStart== nowPage) {%></Strong></font>
<%} %></a>
<% } //for
%>&nbsp;
<% if(totalBlock> nowBlock) { %>
<a href="javascript:block('<%=nowBlock+ 1%>')">[����]</a>
<%} %>&nbsp;
<%}%>	
<form name="listFrm" method="post" >
<input type="hidden" name="reload" value="true">
<input  type="hidden" name="nowPage" value="1">
</form>
<form name="readFrm" id="readFrm" method="get" >
<input type="hidden" name="pagefile" value="3.QnA">
<input type="hidden" name="idx">
<input type="hidden" name="nowPage" id="nowPage" value="<%=nowPage%>">
</form>
		
		
		
		
		</center><br><br>
	</div>

	
		

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>