<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="EUC-KR"%>
<%@ page import="member.LogonDBBean"%>

<%

	//id는 사용자가 회원가입을 하기위해서 입력한 아이디 
	String id = request.getParameter("id");
	//DB처리빈인 LogonDBBean클래스의 객체를 얻어낸다.
	LogonDBBean manager = LogonDBBean.getInstance();
	//사용자가 입력한 id값을 가지고 LogonDBBean클래스의 confirmId()메소드 호출 //중복아이디 체크 confirmId()메소드의 실행결과로 check에는 1또는 -1값이 리턴 됨 
	int check= manager.confirmId(id);%>
	<div class="container-login100">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30" >
			<form class="login100-form validate-form">
				<span class="login100-form-title p-b-37">
					ID check
				</span> <% 
	if(check==1 || id.equals("hsy3806")) {%>
	<center><font color="red" size="3px"><%=id %></font><font size="3px">은(는) 이미 사용중인 ID입니다.</font>
	<form method="post" action="confirmId.jsp">
				<div class="wrap-input100 validate-input m-b-20" >
					<input class="input100" type="id" name="id" id="id"  autofocus/>
					<span class="focus-input100"></span></div>
     <div class="container-login100-form-btn">
					<input type="submit" class="login100-form-btn" value="중복확인">
					</div>
	</form>
	</center>
	
		<%} 
	else {%>
	 <center><font color="blue" size="3px"><%=id %></font><font size="3px">은(는) 사용가능한  ID입니다.</font>

	<br>
	<br>
	<div class="container-login100-form-btn">
					<input type="button" class="login100-form-btn" value="사용하기"  onClick="setId()">
					</div>

	 <% }%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main_login.css">
<!--===============================================================================================-->
</head>
<title>ID check: Tomorrow is...</title>
</head>
<body>

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/login.js"></script>

</body>
</html>
	<script language="javascript">
	function setId()
	{
			// 받을 부모
			window.opener.document.getElementById("id").value="<%=id%>";
			window.opener.document.getElementById("joongbokID").value=1;
			window.close(); //창닫기
	}

	</script>