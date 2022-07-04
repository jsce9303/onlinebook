<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면 </title>
<style>
	label{
		display: inline-block;
		width: 120px;
		margin: 5px auto;
	}
	input[type="text"],input[type="password"],input[type="date"] {
		width: 160px;
		height: 24px;
		border: 1px solid blue;
		background-color:#A9F5A9;
	}
</style>
</head>
<body>
	<form name="frm" method="get" action="loginProcess.jsp">
		<fieldset>
			<legend>로그인</legend>
			<label for="id">아이디</label>
				<input type="text" name="id" id="id" placeholder="3자리 이상"><br>
			<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" placeholder="4자리 이상"><br>
		</fieldset>
		<p><button type="reset">다시입력</button>
		<button type="submit">로그인</button></p>
	</form>
</body>
</html>