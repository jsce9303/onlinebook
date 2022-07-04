<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.* , javax.sql.*, javax.naming.*" %>
<%
	//이전 페이지에서 id와 passwd값을 받아온다.
	String id 		= request.getParameter("id");
	String passwd 	= request.getParameter("passwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 2번 단계</title>
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
	<h3>신청 아이디 : <%=id %> </h3>
	<form action="reginsert.jsp" method="POST">
		<input type="hidden" name="id" value="<%=id %>">
		<input type="hidden" name="passwd" value="<%=passwd %>">
		<fieldset>
			<legend>회원가입 : 상세</legend>
			<input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>">
			<input type="hidden" name="passwd" id="passwd" value="<%=request.getParameter("passwd")%>">
			<label for="email">이메일</label>
			<input type="email" name="email" id="email" required="required" placeholder="email@email.com"><br>
			<label for="phone">휴대번호</label>
			<input type="tel" name="phone" id="phone" required="required" placeholder="000-0000-0000"><br>
			<label for="birth">생년월일</label>
			<input type="date" name="birth" id="birth" required="required"> 
		</fieldset>
		<p><button type="reset">다시입력</button>
		<button onclick="javascript:history.back();">이전단계</button>
		<input type="submit" value="다음단계"></p>
	</form>
<script src="script.js"></script>
</body>
</html>