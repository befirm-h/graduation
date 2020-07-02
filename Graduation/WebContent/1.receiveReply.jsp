<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
		<%request.setCharacterEncoding("euc-kr") ;%>
<%@page import="mail.receiveBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="rMgr" class="mail.receiveMgr" scope="session" />
<% request.setCharacterEncoding("EUC-KR");
String id=session.getAttribute("id").toString();
int totalRecord = 0; //전체레코드수 
int numPerPage = 7; // 페이지당 레코드 수 
int pagePerBlock = 15; //블럭당 페이지수
int totalPage = 0; //전체 페이지 수 
int totalBlock = 0; //전체 블럭수
int nowPage = 1; // 현재페이지 
int nowBlock = 1; //현재블럭
int start = 0; //디비의 select 시작번호 
int end = 10; //시작번호로 부터 가져올 select 갯수
int listSize = 0; //현재 읽어온 게시물의 수 
Vector<receiveBean> vlist = null;
if (request.getParameter("nowPage") != null) { 
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	} 
start = (nowPage * numPerPage) - numPerPage; end = start + numPerPage;
String kind="1";
totalRecord = rMgr.getTotalCount(id,kind); 


totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //전체페이지수 
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //현재블럭 계산 
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //전체블럭계산 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/>
	<title>받은 답장함 : Tomorrow is...</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">
<script type="text/javascript">

function pageing(page) {
location.href="1.receiveReply.jsp?nowPage="+page;
}
function block(value) {
var pagePerBlock=<%=pagePerBlock%> * (value-1) + 1;
location.href="1.receiveReply.jsp?nowPage="+pagePerBlock;

}
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
	<!-- Header -->
	<header id="header">
				<div class="inner">
					<a href="Home.jsp" class="logo">Tomorrow is...</a>
						<a href="1.receiveWorry.jsp">받은 편지함</a>
						<a href="1.sendWorry.jsp">보낸 편지함</a>
						<a href="2.answer.jsp">To.오늘의 나</a>
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
							<img src="images/icons/contact.png" width="30px" /><br><br>
							<h3>받 은 답 장 함</h3>
							<p>누군가의 위로가 당신에게 도착했습니다.<br>
							 </p>							
						</div>
					</div>					
				</div>
			</section>
</head>



	
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
  listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
  if (vlist.isEmpty()) { 
  %>
		<tr>
			<td colspan="4" align="center">등록된 게시물이 없습니다 .</td>
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
		  String count = bean.getCount();
		  int pos = bean.getReceivePos(); 
		  %>
		<tr>
			<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
			<td>
			
		
	 <%	 if (pos > 0) { 
			  for (int j = 0; j < pos; j++) { 
				  out.println("&nbsp;&nbsp;"); } } %> 
				  <a href="1.receiveRead_reply.jsp?idx=<%=idx%>"><%=title%></a>
				  	<%if(count.equals("1"))
				  	{
				  		%>
				  		<input type="image" src="images/icons/newMessage.jpg"" width="10px" />	
				  <% }
				  %>
			</td>
			<td><%=date%></td>
		</tr>
		<% } // for 
	  } //if 
	  %>
		</tbody>
	</table>
	<footer><center>
		<%
int pageStart= (nowBlock-1) * pagePerBlock+ 1; //하단페이지시작번호
int pageEnd= ((pageStart+ pagePerBlock) < totalPage) ? (pageStart+ pagePerBlock) : totalPage+ 1;
//하단페이지끝번호
if(totalPage!= 0) {
if(nowBlock> 1) {
%>
<a href="javascript:block('<%=nowBlock-1%>')">[이전]</a>
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
<a href="javascript:block('<%=nowBlock+ 1%>')">[다음]</a>
<%} %>&nbsp;
<%}%>	
<br><br>
<%
						  int newMessage = rMgr.getNewmessage(id);
				  		%>
						<div style="postion:absolute;">
						<input type="button" class="button" value="받은 고민함" onclick="location='1.receiveWorry.jsp'" >
							<%if(newMessage!=0){ %>
							<div style="position:relative; top:-35px; left:47px;">
							<input type="image" src="images/icons/newMessage.jpg"" width="10px" /></div></div>
							<% }%><br></div></div>
				  

<form name="listFrm" method="post" >
<input type="hidden" name="reload" value="true">
<input  type="hidden" name="nowPage" value="1">
</form>
<form name="readFrm" id="readFrm" method="get" >
<input type="hidden" name="idx">
<input type="hidden" name="nowPage" id="nowPage" value="<%=nowPage%>">
</form>
</center></footer><br><br>
</body>
</html>