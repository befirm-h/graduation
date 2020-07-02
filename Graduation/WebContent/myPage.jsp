<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "member.LogonDataBean" %>
 <%@ page import = "member.LogonDBBean" %>

	<% 
	String id = (String)session.getAttribute("id");
	String password = request.getParameter("password");

	LogonDBBean manager = LogonDBBean.getInstance(); //아이디와 비밀번호에 해당하는 사용자의 정보를 얻어냄
	LogonDataBean m = manager.getMember(id);%>
	
<% 
	
try{//얻어낸 사용자 정보를 화면에 표시
	
%>
<form name="regFrm" method="post" onsubmit="return checkPass()" action="modifyPro.jsp">


<%}catch(Exception e){}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!DOCTYPE html>
<html lang="en">
<head>

<script type="text/javascript">
function checkPass() {
	
	if (document.regFrm.password.value=="") {
		alert("비밀번호를  입력하세요");
		document.regFrm.password.focus();
		return false;
	}
	
	
	if (document.regFrm.email.value=="") {
		alert("이메일을 입력하세요.");
		document.regFrm.email.focus();
		return false;
	}
	if (document.regFrm.password.value.length<6) {
		alert("비밀번호는 6자리 이상입니다.");
		document.regFrm.password.value="";
		document.regFrm.password.focus();
		return false;
	}
	document.regFrm.submit();
}
</script>

	<title>Mypage</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon_login.ico"/>
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
<body>


	
	<div class="container-login100">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30" >
			<form class="login100-form validate-form">
				<span class="login100-form-title p-b-37">
					Modify 
				</span>

				<div class="wrap-input100 validate-input m-b-20"  data-validate="Enter username or id">
					<input class="input100" type="text" name="id" value="<%=m.getId()%>" readonly>
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25"  data-validate="Enter password">
					<input class="input100" type="password" name="password" value="<%=m.getPassword()%>">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-25" data-validate="Enter email">
					<input class="input100" type="text" name="email" value="<%=m.getEmail()%>">
					<span class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn">
					<input type="submit" class="login100-form-btn" value="Modify"></div>
					<br>
					<br>
					
					<div class="text-center">
					<a href="deletePassword.jsp" class="txt2 hov1">
					<font color="grey">Delete my account</font>	
					</a>					</div>
			</form>

			
		</div>
	</div>
	
	

	<div id="dropDownSelect1"></div>

</body>
</form>
</html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
</html>