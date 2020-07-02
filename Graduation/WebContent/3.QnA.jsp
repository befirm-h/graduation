<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
	request.setCharacterEncoding("euc-kr");
%>
<%@page import="java.util.Vector"%>
<%@page import="QnA.QnABean"%>
<jsp:useBean id="qMgr" class="QnA.QnAMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
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
	Vector<QnABean> vlist = null;
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage;
	end = start + numPerPage;
	totalRecord = qMgr.getTotalCount();

	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //전체페이지수 
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //현재블럭 계산 
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //전체블럭계산
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">
	<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/>

<title>QnA 목록 : Tomorrow is...</title>
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
	      %>alert("로그인후 이용해주세요");
	   <%}
	   else{%>
	      document.readFrm.idx.value=idx;
	      document.readFrm.action="3.QnAPassword.jsp";
	       document.readFrm.submit();
	   <%}%>

	}
function write_(){
	   <%if(session.getAttribute("id")==null){
	      %>alert("로그인후 이용해주세요");
	   <%}
	   else{%>
	   location.href="3.QnA_contents.jsp";
	   <%}%>

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
	<header id="header">
	<div class="inner">
		<a href="Home.jsp" class="logo">Tomorrow is...</a>
     <%if(session.getAttribute("id")!=null){ 
      if(session.getAttribute("id").equals("rhksflwk")){%>
         <a href="admin_userCheck.jsp">회원목록</a>
                  <a href="3.QnA.jsp">QnA</a>
                  <a href="4.notice_list.jsp">Notice</a>
                    <a href="javascript:logout()"><font color="red">Logout</a> </font> 
                  <%}
                  else {%>
       			  <a href="1.receiveWorry.jsp">받은 편지함</a>
                  <a href="1.sendWorry.jsp">보낸 편지함</a>
                  <a href="2.answer.jsp">To.오늘의 나</a>
                  <a href="3.QnA.jsp">QnA</a>
      <a href="4.notice_list.jsp">Notice</a>
       <a href="javascript:logout()"><font color="red">Logout</a> </font> 
      <%}
         }
         if (session.getAttribute("id") == null) {
      %>    			  <a href="1.receiveWorry.jsp">받은 편지함</a>
                  <a href="1.sendWorry.jsp">보낸 편지함</a>
                  <a href="2.answer.jsp">To.오늘의 나</a>
                  <a href="3.QnA.jsp">QnA</a>
      <a href="4.notice_list.jsp">Notice</a> </font> <%
    }
 %> 
  </nav>
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>
			<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/question.png" width="30px" /><br><br>
							<h3>QnA</h3>
							<p>문의사항은 언제든 환영합니다.<br>
							 </p>
						
					</p>
				</div>
			</div>
		</div>
		</section>
<br>
		<table>
			<colgroup>
			<col width="2%" />
			<col width="8%" />
			<col width="80%" />
			<col width="7%" />
			<col width="3%" />
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>Name</th>
					<th>Title</th>
					<th>Date</th>
					<th>Hit</th>
				</tr>
			</thead>

			<tbody>
			<% 
  vlist = qMgr.getQnAList(start, end); 
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
		  QnABean bean = vlist.get(i); 
		  int idx = bean.getIdx(); 
		  String title=bean.getTitle();
		  String date = bean.getDate();
		  String name = bean.getMemberidx();
		  int hits = bean.getViewing();


		  int secret=bean.getSecret();
		  int depth=bean.getDepth();
		  int replycount=qMgr.getReplyCount(bean.getIdx());
		  
		  if(depth==0){%>
		<tr>
			<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
			<td><%=name%></td>
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
			<td><%=hits%></td>
		</tr>
		<% 
		  }
		  } // for 
	  } //if 
	  %>
			</tbody>
		</table>
		
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

		
		<br><br>
		
		<input type="button" value="글 작성" onclick="write_()"></center><br><br>
		<form name="listFrm" method="post" >
<input type="hidden" name="reload" value="true">
<input  type="hidden" name="nowPage" value="1">
</form>
<form name="readFrm" id="readFrm" method="get" >
<input type="hidden" name="pagefile" value="3.QnA">
<input type="hidden" name="idx">
<input type="hidden" name="nowPage" id="nowPage" value="<%=nowPage%>">
</form>
		
	</div>
</body>
</html>