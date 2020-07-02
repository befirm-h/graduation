<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
	request.setCharacterEncoding("euc-kr");
%>
<%@page import="java.util.Vector"%>
<%@page import="QnA.QnABean"%>
<%@page import="QnA.QnAMgr"%>
<%

     QnAMgr qMgr=QnAMgr.getInstance();

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
	Vector<QnABean> vlist = null;
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage;
	end = start + numPerPage;
	totalRecord = qMgr.getTotalCount();

	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //��ü�������� 
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //����� ��� 
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //��ü�����
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">


<title>QnA ��� : Tomorrow is...</title>
<script type="text/javascript">
function list() {
document.listFrm.action= "3.QnA.jsp";
document.listFrm.submit();
}
function pageing(page) {
location.href="3.QnA.jsp?nowPage="+page;
}
function block(value) {
var pagePerBlock=<%=pagePerBlock%> * (value-1) + 1;
location.href="3.QnA.jsp?nowPage="+pagePerBlock;

}
function read(idx){

	   <%if(session.getAttribute("id")==null){
	      %>alert("�α����� �̿����ּ���");
	   <%}
	   else{%>
	      document.readFrm.idx.value=idx;
	      document.readFrm.action="3.QnAPassword.jsp"
	       document.readFrm.submit();
	   <%}%>

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
 %> </nav>
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>
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
  vlist = qMgr.getQnAList(start, end); 
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
		  QnABean bean = vlist.get(i); 
		  int idx = bean.getIdx(); 
		  String title=bean.getTitle();
		  String date = bean.getDate();
		  int secret=bean.getSecret();
		  int depth=bean.getDepth();
		  int replycount=qMgr.getReplyCount(bean.getIdx());
		  
		  if(depth==0){%>
		<tr>
			<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
			<td>
				<%
				if(secret==0){
					if(replycount==0){
				%> 
				  <a href="javascript:read('<%=idx%>')"><%=title%></a>
				  <%
					}
					else{%>	
				 <a href="javascript:read('<%=idx%>')"><%=title%></a><%out.println("&nbsp;&nbsp;"); %> 
				 <img src="images/icons/comment.png" width="15px"/><%=replycount %>
				<% }
				}
				else{
					
				   if(replycount==0){
				  %>
				   <img src="images/icons/lock.png" width="15px"/><%out.println("&nbsp;&nbsp;"); %><a href="javascript:read('<%=idx%>')"><%=title %></a>
				    <%
				    
				   }
				   else{%>
				      <img src="images/icons/lock.png" width="15px"/><%out.println("&nbsp;&nbsp;"); %><a href="javascript:read('<%=idx%>')"><%=title%></a> 
				      <%out.println("&nbsp;&nbsp;"); %><img src="images/icons/comment.png" width="15px"/><%=replycount %>
				   <% } 
				}
				    %>
			</td>
			<td><%=date%></td>
		</tr>
		<% 
		  }
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
		
		
		
		
		<input type="button" value="�� �ۼ�" onclick="location='3.QnA_contents.jsp'"></center><br><br>
	</div>
</body>
</html>