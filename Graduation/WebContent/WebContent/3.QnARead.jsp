<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        	<%request.setCharacterEncoding("euc-kr") ;%>
<%@page import="QnA.QnABean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="qMgr" class="QnA.QnAMgr" />
<%
String id="";
if(session.getAttribute("id")!=null){
    id=session.getAttribute("id").toString();}
else{%>
  <script type="text/javascript">
    alert("���Ǹ���� �α׾ƿ��Ǿ����ϴ�.");
    location.href = "Home.jsp";
    </script>
   
<%}

	id=session.getAttribute("id").toString();
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	QnABean bean = qMgr.getQnAContents(idx);//�Խù� ��������
    String member=bean.getMemberidx();
	String title=bean.getTitle();
	String contents=bean.getContents();
	String date=bean.getDate();
	int secret=bean.getSecret();
	String password=bean.getPassword();
	int pos=bean.getPos();
	int ref=bean.getRef();
	int viewing=bean.getViewing();
	int depth=bean.getDepth();
	

	session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
	
	
	int totalRecord = 0; //��ü���ڵ�� 
	int numPerPage = 5; // �������� ���ڵ� �� 
	int pagePerBlock = 15; //���� ��������
	int totalPage = 0; //��ü ������ �� 
	int totalBlock = 0; //��ü ����
	int rnowPage = 1; // ���������� 
	int nowBlock = 1; //�����
	int start = 0; //����� select ���۹�ȣ 
	int end = 10; //���۹�ȣ�� ���� ������ select ����
	int listSize = 0; //���� �о�� �Խù��� �� 
	Vector<QnABean> vlist = null;
	if (request.getParameter("rnowPage") != null) {
		rnowPage = Integer.parseInt(request.getParameter("rnowPage"));
	}
	start = (rnowPage * numPerPage) - numPerPage;
	end = start + numPerPage;
	totalRecord = qMgr.getReplyCount(idx);

	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //��ü�������� 
	nowBlock = (int) Math.ceil((double) rnowPage / pagePerBlock); //����� ��� 
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //��ü�����
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
<title>QnA : Tomorrow is...</title>
<script type="text/javascript">

function inputCheck() {
	if (document.reFrm.reply.value=="") {
		alert("������ �Է����ּ���.");
		document.reFrm.reply.value = "";
		document.reFrm.reply.focus();
		return false;
	}
	else {
		document.reFrm.action="3.QnAReplyProcess.jsp"
		document.reFrm.submit();
	}
}
function delete_(idx){
	document.deleteFrm.idx.value=idx;
	if (confirm("�Խù��� ���� �Ͻýðڽ��ϱ�?")) {
		document.deleteFrm.action = "3.QnADelete.jsp";
		document.deleteFrm.submit();
	} 
}
function ReplyDel(idx){

	document.delReFrm.ridx.value=idx;
	if (confirm("����� ���� �Ͻýðڽ��ϱ�?"+<%=nowPage%>)) {
		document.delReFrm.action = "3.QnAReplyDelete.jsp";
		document.delReFrm.submit();
	} 
}
function update_(){
	document.updateFrm.action="3.QnAUpdate.jsp";
	document.updateFrm.submit();
}
function updateRe_(idx){
	alert("����?");
	document.updateReFrm.idx.value=idx;
	document.updateReFrm.action="3.QnAReplyUpdate.jsp";
	document.updateReFrm.submit();
}
function list() {
	document.listFrm.action= "3.QnARead.jsp";
	document.listFrm.submit();
	}
	function pageing(page,idx) {
	location.href="3.QnARead.jsp?rnowPage="+page+"&idx="+<%=idx%>;
	}
	function block(value) {
	var pagePerBlock=<%=pagePerBlock%> * (value-1) + 1;
	location.href="3.QnARead.jsp?rnowPage="+pagePerBlock;

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

</head>
<body>
<%   qMgr.upViewing(idx);//��ȸ�� ���� %>
<!-- Header -->
	<header id="header">
	<div class="inner">
		<a href="Home.jsp" class="logo">Tomorrow is...</a>
			<a href="1.receiveWorry.jsp">���� ������</a>
						<a href="1.sendWorry.jsp">���� ������</a>
						<a href="2.answer.jsp">To.������ ��</a>
						<a href="3.QnA.jsp">QnA</a>
		<a href="4.notice_list.jsp">Notice</a>
		<%
			if (!(session.getAttribute("id") == null)) {
		%> <a href="javascript:logout()"><font color="red">Logout</a> </font> <%
 	}
 %> 
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>
		
<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/question.png" width="50px" /><br>
							<h3>QnA</h3>
							<p><br>
							 </p>
						
					</p>
				</div>
			</div>
		</div>
		</section>
<br><br>
		<div class="identity">
			<table class="identity_table" id="identity_table">

				<colgroup>
					<col width="15%" />
					<col width="65%" />
				</colgroup>
				<tr>
				<td>�ۼ���</td><td><%=member %></td>
				<td>��¥</td><td><%=date %></td>
				<td>��ȸ��</td><td><%=viewing %></td>
				</tr>
				<tr>
					<td>����</td>
					<td><textarea rows="1" cols="250" name="title" id="title"  readonly><%=title %></textarea></td>
				</tr>
				<tr>
					<td>����</td>
					<td><textarea rows="6" cols="250" name="contents"
							id="contents" readonly><%=contents %></textarea></td>
				</tr>
			</table>
			<p>
			<p>
			</div>
							<p align="right">
<%if((session.getAttribute("id")!=null && session.getAttribute("id").equals(member))||(session.getAttribute("id")!=null&&session.getAttribute("id").equals("rhksflwk")) ){%>
						<input type="button" value="�����ϱ�" onclick="delete_(<%=idx%>)">
						<%}
					if((session.getAttribute("id")!=null && session.getAttribute("id").equals(member))||(member.equals("������")&&session.getAttribute("id").equals("rhksflwk"))){%>
				<input type="button" value="�����ϱ�" onclick="update_()"><%} %>
				</p>
<form name="updateFrm" method="get">
<input type="hidden" name="idx" value="<%=idx%>">
<input type="hidden" name="nowPage" value="<%=nowPage%>">
</form>

			
	<div class="list_table">
		<table class="list">
			<colgroup>
				<col width="8%" />
				<col width="78%" />
				<col width="10%" />
				<col width="4%" />
			</colgroup>
			<thead>
				<tr>
					<th>Name</th>
					<th>Contents</th>
					<th>Date</th>
						<th> </th>
					
				</tr>
			</thead>

			<tbody>
			<% 
  vlist = qMgr.getReplyList(idx, start, end); 
  listSize = vlist.size();//������ ȭ�鿡 ������ �Խù�����
  if (vlist.isEmpty()) { 
  %>
		<tr>
			<td colspan="4" align="center">��ϵ� �亯�� �����ϴ� .</td>
		</tr>
		<% 
  } else { 
	  for (int i = 0; i < numPerPage; i++) { 
		  if (i == listSize) break; 
		  QnABean rbean = vlist.get(i); 
		  int ridx = rbean.getIdx(); 
		  String rmember=rbean.getMemberidx();
		  String rcontents=rbean.getContents();
		  String rdate = rbean.getDate();
		  
		  %>
		<tr>
			<td><%=rmember%></td>
			<td><textarea rows="2" cols="250" name="contents" id="contents" readonly><%=rcontents %></textarea></td>
				<td><%=rdate %></td>
			<td>	<%if((session.getAttribute("id")!=null && session.getAttribute("id").equals(rmember))||(session.getAttribute("id")!=null&&session.getAttribute("id").equals("rhksflwk")) ){%>
				<center><a href="javascript:ReplyDel('<%=ridx%>')">�����ϱ�</a>
						<%}
					if((session.getAttribute("id")!=null && session.getAttribute("id").equals(rmember))||(rmember.equals("������")&&session.getAttribute("id").equals("rhksflwk"))){%>
				<a href="javascript:updateRe_('<%=ridx%>')">�����ϱ�</a><%} %></center></td>
		</tr>
		

			
		<% 
		  
		  } // for 
	  } //if 
	  %>
			</tbody>
		</table>		


			<br>
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
<a href="javascript:pageing(<%=pageStart%>)">
<% if(pageStart== rnowPage) {%>
<font color="blue"><Strong>
<%} %>[<%=pageStart%>] 
<%if(pageStart== rnowPage) {%></Strong></font>
<%} %></a>
<% } //for
%>&nbsp;
<% if(totalBlock> nowBlock) { %>
<a href="javascript:block('<%=nowBlock+ 1%>')">[����]</a>
<%} %>&nbsp;
<%}%>	
<br>
<br>
		<form name="listFrm" method="post" >
<input type="hidden" name="reload" value="true">
<input  type="hidden" name="nowPage" value="1">
</form>

<form name="reFrm" method="post" >
		<div >
			<table class="list">

				<colgroup>
					<col width="85%" />
					<col width="15%" />
				</colgroup>
				<tr>
					<td><textarea rows="3" cols="250" name="reply" id="reply"></textarea></td>
					<td>
						<input type="button" value="�亯���" onclick="inputCheck()">
					
					</td>
				</tr>
				
			</table>
			
			<br><center>
			<input type="button" value="�������" onclick="location.href='3.QnA.jsp'"></center>
		
			
			
			<input type="hidden" name="idx" value="<%=idx%>">
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type="hidden" name="ref" value="<%=bean.getRef() %>">
			<input type="hidden" name="pos" value=<%=bean.getPos() %>>
			<input type="hidden" name="depth" value="<%=bean.getDepth() %>">
			<input type="hidden" name="secret" value="<%=bean.getSecret() %>">
			<input type="hidden" name="password" value="<%=bean.getPassword() %>">
			<%if(id.equals("rhksflwk")) {%>
			<input type="hidden" name="member" value="������">
			
			<%}else{ %>
			<input type="hidden" name="member" value="<%=id%>">
			<%} %>
		
	</div>	
	</form>	
			<center>
				<p>
					<br> <br>
		

			</center>
		</div>
		
<form name="deleteFrm" method="get">
<input type="hidden" name="idx" value="<%=idx%>">
<input type="hidden" name="nowPage" value="<%=nowPage%>">
</form>
<form name="updateReFrm" method="get">
<input type="hidden" name="idx" value="<%=idx%>">
<input type="hidden" name="nowPage" value="<%=nowPage%>">
</form>
<form name="delReFrm" method="get">
<input type="hidden" name="ridx" value="<%=idx%>">
<input type="hidden" name="idx" value="<%=idx%>">
<input type="hidden" name="nowPage" value="<%=nowPage%>">
</form>		

	<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();

		}

         </script>	
</body>
</html>