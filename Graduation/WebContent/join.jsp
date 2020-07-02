<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="Menu.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
.JoinContent {
	margin-top: 180px;
	font-family: 'Jeju Gothic', sans-serif;
}

.JoinContent table {
	width: 97%;
	align: center;
}

.JoinContent table tr th {
	line-height: 120px;
	height: 120px;
	text-align: center;
	font-size: 30px;
	color: #11214a;
	border-bottom: 3px solid;
	border-color: rgb(231, 231, 231)
}

.JoinContent table tr td {
	line-height: 50px;
	height: 50px;
	align: center;
	font-size: 18px;
}

.JoinButton {
	text-align: center;
}

.JoinButton input[type=button] {
	margin: 20px;
	background: #f1f1f1;
	color: #11214a;
	font-family: 'Jeju Gothic', sans-serif;
	width: 70px;
	height: 40px;
	border: none;
}
.JoinButton input[type=submit] {
	margin: 20px;
	background: #f1f1f1;
	color: #11214a;
	font-family: 'Jeju Gothic', sans-serif;
	width: 70px;
	height: 40px;
	border: none;
}

tr td {
	text-align: left;
	text-color: #11214a;
	align: center;
}

table input[type=button] {
	margin: 20px;
	background: #f1f1f1;
	color: #11214a;
	font-family: 'Jeju Gothic', sans-serif;
	width: 70px;
	height: 40px;
	border: none;
}

table input[type=submit] {
	margin: 20px;
	background: #f1f1f1;
	color: #11214a;
	font-family: 'Jeju Gothic', sans-serif;
	width: 70px;
	height: 40px;
	border: none;
}
</style>
<script type="text/javascript">
function inputCheck() {
	
	if (document.regFrm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.regFrm.id.focus();
		return false;
	}
	if (document.regFrm.joongbokID.value == 0) {
		alert("아이디를 중복체크 해주세요.");
		return false;
	}

	
	if (document.regFrm.password.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.regFrm.passwd.focus();
		return false;
	}

	if(document.regFrm.password.value.length<6)
	{
		alert("비밀번호는 6자리 이상입니다.");
		document.regFrm.password.value = "";
		document.regFrm.password.focus();
		return false;
	}

	if (document.regFrm.repassword.value=="") {
		alert("비밀번호를 한번 더 입력해주세요.");
		document.regFrm.repassword.focus();
		return false;
	}
	if (document.regFrm.password.value != document.regFrm.repassword.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.repassword.value = "";
		document.regFrm.repassword.focus();
		return false;
	}
	if ((document.regFrm.emailID.value == "") || (document.regFrm.emailAD.value == "")) {
		alert("이메일을 입력하세요");
		document.regFrm.emailID.focus();
		return false;
	}
	
	document.regFrm.submit();
}

function idCheck(id) {
	
	frm = document.regFrm;
	
	if (document.regFrm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.regFrm.id.focus();
		return false;
	}
	if ((id< "0" || id> "9") && (id< 'A' || id> 'Z') && (id< 'a' || id> 'z'))
	{
		alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
		document.regFrm.id.value = "";
		return false;
	}
	
	if (document.regFrm.id.value.indexOf(" ") >= 0)
	{
		alert("아이디에 공백을 사용할 수 없습니다.");
		document.regFrm.id.value = "";
		return ;
	}
	url = "confirmId.jsp?id="+id;
	window.open(url, "IdCheck","left=600, top=100, width=400, height=200, resizable=no, toolbar=no, manubar=no ");
}
</script>

	<body>

<form name="regFrm" class="form" method="post" action="joinProcess.jsp" onsubmit = "return inputCheck()">	
<div class="JoinContent">
		<table class="table" align="center">
			<tr>
				<th>회 원 가 입</th>
			</tr>
		</table>
<br>
<br>
		<table class="table" align="center">
			<table align="center">
				<tr colspan="4">
					<colgroup>
						<col width="530px" />
						<col width="150px" />
						<col width="1px" />
						<col width="1px" />
					</colgroup>
					<td></td>
					<td>아이디</td>
					<td><input type="text" name="id" id="id"  placeholder="영문 / 숫자만"></td>
					<td><input type="button" value="중복확인 " onClick="javascript:idCheck(this.form.id.value)"> 
						<input type="hidden" id="joongbokID" name="joongbokID" value=0>	</td>
				</tr>
				<tr>
					<td></td>
					<td>비밀번호</td>
					<td colsapn=5><input type="password" name="password" id="password" placeholder="6자 이상입니다."></td>
				</tr>
				<tr>
					<td></td>
					<td>비밀번호 확인</td>
					<td><input type="password" name="repassword" id="repassword"></td>
				</tr>
				<tr>
					<td></td>
					<td>이메일</td>
					<td><input type="text" id="emailID" name="emailID"></td>
					<td><center>@</center></td>
					<td><input type="text" id="emailAD" name="emailAD"></td>
				</tr>
			</table>
	</div>
	<br>
	<br>
	<br>
	
	<div class="JoinButton">
	<input type="submit" value="가입완료"> <input type="button" value="취소">
	</div>

</form>
</body>
</html>