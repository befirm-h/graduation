<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    String id=request.getParameter("id");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
function checkPass(){
	var check_id = '<%=id%>';
if (document.regFrm.password.value=="") {
	alert("비밀번호를  입력하세요");
	document.regFrm.password.focus();
	return false;
}

if (document.regFrm.password.value.length<6) {
	alert("비밀번호는 6자리 이상입니다.");
	document.regFrm.password.value="";
	document.regFrm.password.focus();
	return false;
}
if (document.regFrm.password.value==check_id) {
	alert("비밀번호는 아이디와 동일할 수 없습니다.");
	document.regFrm.password.value="";
	document.regFrm.password1.value="";
	document.regFrm.password.focus();
	return false;
}
if (document.regFrm.password.value!=document.regFrm.password1.value) {
	alert("비밀번호확인이 비밀번호와 일치하지않습니다.");
	document.regFrm.password1.value="";
	document.regFrm.password1.focus();
	return false;
}
}
</script>

	<title>Update Password</title>
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
<body>


	
	<div class="container-login100">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30" >
	<form name="regFrm" method="post" onsubmit="return checkPass()" action="pwUpdatePro.jsp">
				<span class="login100-form-title p-b-37">
					Modify Password
				</span>

				<div class="wrap-input100 validate-input m-b-25"  data-validate="Enter password">
					<input class="input100" type="password" name="password" placeholder="비밀번호">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-25"  data-validate="Enter password">
					<input class="input100" type="password" name="password1" placeholder="비밀번호확인" >
					<span class="focus-input100"></span>
				</div>
                      <input type="hidden" name="id" value="<%=id%>">
				<div class="container-login100-form-btn">
					<input type="submit" class="login100-form-btn" value="Modify"></div>
					<br>
					<br>
					
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