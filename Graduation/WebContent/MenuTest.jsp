<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="Menu.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<div align="center">
<img src="image/logo.JPG" width="auto" height="160" />
</div>

	<div id="Menu">
		<ul>
			<li><a href="MenuTest.jsp">홈</a></li>
			<li><a href="#">편지함</a>
				<ul>
					<li><a href="1.Mail/receive.jsp">받은 편지함</a></li>
					<li><a href="1.Mail/send.jsp">보낸 편지함</a></li>
				</ul></li>
			<li><a href="#">질문함</a>
				<ul>
					<li><a href="#">서브메뉴 1</a></li>
					<li><a href="#">서브메뉴 2</a></li>
					<li><a href="#">서브메뉴 3</a></li>
				</ul></li>
			<li><a href="3.QnA/QnA.jsp">QnA</a></li>
			<li><a href="4.Notice/notice.jsp">공지사항</a></li>
		</ul>
	</div>
<div class="MainContent">
<table align="center" width="100%" height="220">	
<banner>
<tr>
<td>
<div align="left">
<img src="image/banner.png" width="100%" height="220" />
</div>
</banner>
</td>
<td>	
<table align="right" width="auto" height="220">
<tr>
	<td>아이디 </td>
	<td><input type="text" name="id"></td>
	<td rowspan=2><input type="submit" value="로그인" onclick="location='login_ok.jsp'"> </td>
</tr>
<tr> 
    <td>비밀번호</td>
    <td> <input type="password" name="pwd"></td> 
    
</tr>
<tr>
    <td>  </td>
	<td><input type="button" value="회원가입" onclick="location='join.jsp'"></td> 
	<td><input type="button" value="ID/PW찾기" onclick="아이디 비번찾기 jsp"></td>
</tr>
</table>
</td>
</table>
</div>
	
	
</body>
</html>