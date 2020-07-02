<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./0.style/list.css" rel="stylesheet" type="text/css">
<link href="./Menu.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="send_header">
		<send_text> 내 가 보 낸 답 장  함 </send_text>
	</div>
	<br>
	<div class="menu">
	<table class="menu">
	<tr><td><a href="0.first.jsp?pagefile=1.sendWorry">내가 보낸 고민함</a></td> 
	</table>
	<div class="list_table">
	<table class="list">
		<colgroup>
			<col width="10%" />
			<col width="60%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th>No.</th>
				<th>Title</th>
				<th>Date</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td>1</td>
				<td>첫번째 보낸편지.</td>
				<td>0000.00.00</td>
			</tr>

			<tr>
				<td>2</td>
				<td>두번째 보낸편지.</td>
				<td>2017.11.22</td>
			</tr>

			<tr>
				<td>3</td>
				<td>세번째 보낸편지.</td>
				<td>2018.03.19</td>
			</tr>
		</tbody>
	</table>
	<br>
	<input type="button" value="글 쓰기" onclick="location.href='0.first.jsp?pagefile=1.send_contents'"></td></div>
	</div>
</body>
</html>