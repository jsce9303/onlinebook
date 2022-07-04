<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.* , javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 1번 단계</title>
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
	h6{
		font-size:15px;
	}
</style>
</head>
<body>
	<form action="regStep2.jsp" method="POST" onsubmit="return chkForm();">
		<fieldset>
			<legend>회원가입 : 기본</legend>
			<label for="id">아이디</label>
				<input type="text" name="id" id="id" required="required" onkeydown="checkMessage()">	<!-- onkeydown은 요소를 선택하고 키를 누르면 발동되는 이벤트 -->
				<input type="hidden" name="chk" id="chk">
				<input type="button" value="중복확인" onclick="chkID()" id="duplicationChk">	<!-- 클릭시 chkID() 이벤트를 실행한다. -->
				<h6 id="chkResult">&check; 아이디 중복 확인을 반드시 진행해주세요.</h6>
			<label for="passwd1">비밀번호</label>
				<input type="password" name="passwd" id="passwd" required="required"><br>		<!-- required는 반드시 채워져 있어야 하는 입력 필드를 명시 -->
			<label for="passwd2">비밀번호 확인</label>
				<input type="password" name="passwdConfirm" id="passwdConfirm" required="required">
			<h6 id="chkConfirm"></h6>
		</fieldset>
		<p><button type="reset">다시입력</button>
		<button onclick="return chkForm()">다음단계</button></p>
	</form>
	<p>&sext; 아이디가 생각났나요? <a href="login.jsp">로그인 하러가기</a></p>
<script src="script.js"></script>
</body>
</html>