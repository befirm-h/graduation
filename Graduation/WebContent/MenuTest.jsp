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
			<li><a href="MenuTest.jsp">Ȩ</a></li>
			<li><a href="#">������</a>
				<ul>
					<li><a href="1.Mail/receive.jsp">���� ������</a></li>
					<li><a href="1.Mail/send.jsp">���� ������</a></li>
				</ul></li>
			<li><a href="#">������</a>
				<ul>
					<li><a href="#">����޴� 1</a></li>
					<li><a href="#">����޴� 2</a></li>
					<li><a href="#">����޴� 3</a></li>
				</ul></li>
			<li><a href="3.QnA/QnA.jsp">QnA</a></li>
			<li><a href="4.Notice/notice.jsp">��������</a></li>
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
	<td>���̵� </td>
	<td><input type="text" name="id"></td>
	<td rowspan=2><input type="submit" value="�α���" onclick="location='login_ok.jsp'"> </td>
</tr>
<tr> 
    <td>��й�ȣ</td>
    <td> <input type="password" name="pwd"></td> 
    
</tr>
<tr>
    <td>  </td>
	<td><input type="button" value="ȸ������" onclick="location='join.jsp'"></td> 
	<td><input type="button" value="ID/PWã��" onclick="���̵� ���ã�� jsp"></td>
</tr>
</table>
</td>
</table>
</div>
	
	
</body>
</html>