<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%request.setCharacterEncoding("euc-kr") ;%>
<%@page import="notice.noticeBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="nMgr" class="notice.noticeMgr" />
<% request.setCharacterEncoding("EUC-KR");

int totalRecord = 0; //전체레코드수 
int numPerPage = 3; // 페이지당 레코드 수 
int pagePerBlock = 15; //블럭당 페이지수
int totalPage = 0; //전체 페이지 수 
int totalBlock = 0; //전체 블럭수
int nowPage = 1; // 현재페이지 
int nowBlock = 1; //현재블럭
int start = 0; //디비의 select 시작번호 
int end = 10; //시작번호로 부터 가져올 select 갯수
int listSize = 0; //현재 읽어온 게시물의 수 


Vector<noticeBean> vlist = null;
if (request.getParameter("nowPage") != null) { 
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	} 
start = (nowPage * numPerPage) - numPerPage; end = start + numPerPage;
String kind="0";
totalRecord = nMgr.getTotalCount(); 

totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //전체페이지수 
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //현재블럭 계산 
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //전체블럭계산 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>

		<title>공지사항 목록 : Tomorrow is...</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">
<script type="text/javascript">

function pageing(page) {
location.href="4.notice_list.jsp?nowPage="+page;
}
function block(value) {
var pagePerBlock=<%=pagePerBlock%> * (value-1) + 1;
location.href="4.notice_list.jsp?nowPage="+pagePerBlock;

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
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<div class="flex">					
						<div>
							<img src="images/icons/microphone.png" width="50px" /><br>
							<h3>공 지 사 항</h3>
								<p><br>
							 </p>						
						</div>
					</div>					
				</div>
			</section>
<title>공지사항</title>
</head>
<body>
<br>
	<table>
		<colgroup>
			<col width="7%" />
			<col width="87%" />
			<col width="6%" />
			<col width="2%" />
		</colgroup>
		
		<thead>
			<tr>
				<th>No.</th>
					<th>Title</th>
					<th>Date</th>
					<th>Hits</th>
			</tr>
		</thead>

		<tbody>
		<% 
  vlist = nMgr.NoticeList(start, end); 
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
		  noticeBean bean = vlist.get(i); 
		  int idx = bean.getIdx(); 
		  
		  String title = bean.getTitle(); 
		  int count = bean.getCount(); 
		  String date = bean.getNotice_date(); 
		  int pos = bean.getPos(); 
		  %>
		<tr>
			<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
			<td>
				<% if (pos > 0) { 
			  for (int j = 0; j < pos; j++) { 
				  out.println("&nbsp;&nbsp;"); } } %> 
				  <a href="4.notice_read.jsp?idx=<%=idx%>"><%=title%></a>
			</td>
			<td><%=date%></td>
			<td><%=count%></td>
		</tr>
		<% } // for 
	  } //if 
	  %>
		</tbody>
	</table>
	</div><br><footer><center>
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

<form name="listFrm" method="post" >
<input type="hidden" name="reload" value="true">
<input  type="hidden" name="nowPage" value="1">
</form>
<form name="readFrm" id="readFrm" method="get" >
<input type="hidden" name="idx">
<input type="hidden" name="nowPage" id="nowPage" value="<%=nowPage%>">
</form>

	<>
	 <input type="hidden" name="idx">  <%
 	if (session.getAttribute("id") == null || !(session.getAttribute("id").equals("rhksflwk"))) {}
 	else{ %> 	
 	<input type ="button" class="button" value="작성하기" onclick="location='4.notice_write.jsp'">

	 <%
 	} %><br><br></center>


	</form>
</body>
</html>