<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%request.setCharacterEncoding("euc-kr") ;%>
	
<%@page import="mail.receiveBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="rMgr" class="mail.receiveMgr" scope="session" />
<% request.setCharacterEncoding("EUC-KR");
String id=session.getAttribute("id").toString();
int totalRecord = 0; //��ü���ڵ�� 
int numPerPage = 3; // �������� ���ڵ� �� 
int pagePerBlock = 15; //���� ��������
int totalPage = 0; //��ü ������ �� 
int totalBlock = 0; //��ü ����
int nowPage = 1; // ���������� 
int nowBlock = 1; //�����
int start = 0; //����� select ���۹�ȣ 
int end = 10; //���۹�ȣ�� ���� ������ select ����
int listSize = 0; //���� �о�� �Խù��� �� 


int count=1;
Vector<receiveBean> vlist = null;
if (request.getParameter("nowPage") != null) { 
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	} 
start = (nowPage * numPerPage) - numPerPage; end = start + numPerPage;
String kind="0";
totalRecord = rMgr.getTotalCount(id,kind); 

totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //��ü�������� 
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //����� ��� 
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //��ü����� 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
		<title>���� ������ : Tomorrow is...</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">

<script type="text/javascript">

function pageing(page) {
location.href="1.receiveWorry.jsp?nowPage="+page;
}
function block(value) {
var pagePerBlock=<%=pagePerBlock%> * (value-1) + 1;
location.href="1.receiveWorry.jsp?nowPage="+pagePerBlock;

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
		 </div>
			</header>
		
		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<div class="flex">					
						<div>
							<img src="images/icons/contact.png" width="38px" /><br>
							<h3>�� �� �� �� ��</h3>
							<p>����� ���ΰ� �ʿ��� ����� �����߽��ϴ�.<br>
							 </p>							
						</div>
					</div>					
				</div>
			</section>
<br>
<table>
		<colgroup>
		<col width="6%" />
			<col width="87%" />
			<col width="7%" />
		</colgroup>
		<thead>
			<tr>
				<th>No.</th>
				<th>Title</th>
				<th>Date</th>
			</tr>
		</thead>

			<tbody>
				<% 

  vlist = rMgr.getReceiveList(id,kind, start, end); 
  listSize = vlist.size();//������ ȭ�鿡 ������ �Խù�����
  if (vlist.isEmpty()) { 
  %>
		<tr>
			<td colspan="4" align="center">��ϵ� �Խù��� �����ϴ� .</td>
		</tr>
		<% 
  } else { 
	  for (int i = 0; i < numPerPage; i++) { 
		  if (i == listSize) break; 
		  receiveBean bean = vlist.get(i); 
		  int idx = bean.getIdx(); 
		  String sender = bean.getSender(); 
		  String title = bean.getTitle(); 
		  String receiver = bean.getReceiver(); 
		  String date = bean.getDate(); 
		  int pos = bean.getReceivePos(); 
		  %>
		<tr>
			<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
			<td>
				  <% int newMessage = rMgr.newR_message(id);  
				if (pos > 0) { 
			  for (int j = 0; j < pos; j++) { 
				  out.println("&nbsp;&nbsp;"); } } %> 
				  <a href="1.receive_contents.jsp?idx=<%=idx%>"><%=title%></a>
				  
			</td>
			<td><%=date%></td>
		</tr>
		<% } // for 
	  } //if 
	  %>
			</tbody>
		</table>
	<br>
	
	<footer><center>
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
<input type="hidden" name="idx">
<input type="hidden" name="nowPage" id="nowPage" value="<%=nowPage%>">
</form>
						  <%
						  int newReceive = rMgr.getReplyCount(id);
				  		%>
						<div style="postion:absolute;">
						<input type="button" class="button" value="���� ������" onclick="location='1.receiveReply.jsp'" >
							<%if(newReceive!=0){ %>
							<div style="position:relative; top:-35px; left:47px;">
							<input type="image" src="images/icons/newMessage.jpg"" width="10px" /></div></div>
							<% }%><br></div></div>
				  
							</center>
<br><br>
</footer>
</body>
</html>