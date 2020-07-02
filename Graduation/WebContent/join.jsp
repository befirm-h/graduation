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
		alert("���̵� �Է��� �ּ���.");
		document.regFrm.id.focus();
		return false;
	}
	if (document.regFrm.joongbokID.value == 0) {
		alert("���̵� �ߺ�üũ ���ּ���.");
		return false;
	}

	
	if (document.regFrm.password.value == "") {
		alert("��й�ȣ�� �Է��� �ּ���.");
		document.regFrm.passwd.focus();
		return false;
	}

	if(document.regFrm.password.value.length<6)
	{
		alert("��й�ȣ�� 6�ڸ� �̻��Դϴ�.");
		document.regFrm.password.value = "";
		document.regFrm.password.focus();
		return false;
	}

	if (document.regFrm.repassword.value=="") {
		alert("��й�ȣ�� �ѹ� �� �Է����ּ���.");
		document.regFrm.repassword.focus();
		return false;
	}
	if (document.regFrm.password.value != document.regFrm.repassword.value) {
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		document.regFrm.repassword.value = "";
		document.regFrm.repassword.focus();
		return false;
	}
	if ((document.regFrm.emailID.value == "") || (document.regFrm.emailAD.value == "")) {
		alert("�̸����� �Է��ϼ���");
		document.regFrm.emailID.focus();
		return false;
	}
	
	document.regFrm.submit();
}

function idCheck(id) {
	
	frm = document.regFrm;
	
	if (document.regFrm.id.value == "") {
		alert("���̵� �Է��� �ּ���.");
		document.regFrm.id.focus();
		return false;
	}
	if ((id< "0" || id> "9") && (id< 'A' || id> 'Z') && (id< 'a' || id> 'z'))
	{
		alert("�ѱ� �� Ư�����ڴ� ���̵�� ����Ͻ� �� �����ϴ�.");
		document.regFrm.id.value = "";
		return false;
	}
	
	if (document.regFrm.id.value.indexOf(" ") >= 0)
	{
		alert("���̵� ������ ����� �� �����ϴ�.");
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
				<th>ȸ �� �� ��</th>
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
					<td>���̵�</td>
					<td><input type="text" name="id" id="id"  placeholder="���� / ���ڸ�"></td>
					<td><input type="button" value="�ߺ�Ȯ�� " onClick="javascript:idCheck(this.form.id.value)"> 
						<input type="hidden" id="joongbokID" name="joongbokID" value=0>	</td>
				</tr>
				<tr>
					<td></td>
					<td>��й�ȣ</td>
					<td colsapn=5><input type="password" name="password" id="password" placeholder="6�� �̻��Դϴ�."></td>
				</tr>
				<tr>
					<td></td>
					<td>��й�ȣ Ȯ��</td>
					<td><input type="password" name="repassword" id="repassword"></td>
				</tr>
				<tr>
					<td></td>
					<td>�̸���</td>
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
	<input type="submit" value="���ԿϷ�"> <input type="button" value="���">
	</div>

</form>
</body>
</html>