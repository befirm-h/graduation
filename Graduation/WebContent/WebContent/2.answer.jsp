<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%request.setCharacterEncoding("euc-kr") ;%>
<%@page import="question.answerBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="qMgr" class="question.answerMgr" />
<% request.setCharacterEncoding("EUC-KR");
String id=session.getAttribute("id").toString();
int totalRecord = 0; //전체레코드수 
int numPerPage = 10; // 페이지당 레코드 수 
int pagePerBlock = 15; //블럭당 페이지수
int totalPage = 0; //전체 페이지 수 
int totalBlock = 0; //전체 블럭수
int nowPage = 1; // 현재페이지 
int nowBlock = 1; //현재블럭
int start = 0; //디비의 select 시작번호 
int end = 10; //시작번호로 부터 가져올 select 갯수
int listSize = 0; //현재 읽어온 게시물의 수 


Vector<answerBean> vlist = null;
if (request.getParameter("nowPage") != null) { 
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	} 
start = (nowPage * numPerPage) - numPerPage; 
end = start + numPerPage;
totalRecord = qMgr.getTotalCount(id); 

totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //전체페이지수 
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //현재블럭 계산 
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //전체블럭계산 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>

		<title>To. 오늘의 나 작성 목록 : Tomorrow is...</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">
<script type="text/javascript">
function list() {
document.listFrm.action= "2.answer.jsp";
document.listFrm.submit();
}
function pageing(page) {
location.href="2.answer.jsp?nowPage="+page;
}
function block(value) {
var pagePerBlock=<%=pagePerBlock%> * (value-1) + 1;
location.href="2.answer.jsp?nowPage="+pagePerBlock;

}
function read(idx){
		document.readFrm.idx.value=idx;
		document.readFrm.action="2.answerRead.jsp"
	    document.readFrm.submit();

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
 %>  </nav>
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<div class="flex">					
						<div>
							<img src="images/icons/like.png" width="50px" /><br>
							<h3>To. 오늘의 나에게</h3>
								<p><br>
							 </p>						
						</div>
					</div>					
				</div>
			</section>
</head>

<body>
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
				<th>Question</th>
				<th>Date</th>
			</tr>
		</thead>

		<tbody>
		<% 
  vlist = qMgr.getAnswerList(id,start, end); 
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
		  answerBean bean = vlist.get(i); 
		  int idx = bean.getIdx(); 
		  
		  int qidx=bean.getQidx(); 
		  String date = bean.getDate(); 
		  int pos = bean.getPos(); 
		  %>
		<tr>
			<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
			<td>
				<% if (pos > 0) { 
			  for (int j = 0; j < pos; j++) { 
				  out.println("&nbsp;&nbsp;"); } } %> 
				  <a href="javascript:read('<%=idx%>')"><%=qidx%></a>
			</td>
			<td><%=date%></td>
		</tr>
		<% } // for 
	  } //if 
	  %>
		</tbody>
	</table>
	<br>
			<br>
			<center>
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
</center>
</body>
</html>