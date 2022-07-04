<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
<%
	if((session.getAttribute("sessionId") != null)) {	//세션값을 측정한다. 세션이 존재할경우 아래를 실행
		session.removeAttribute("sessionId");			//세션값을 삭제한다.
		response.sendRedirect("login.jsp");				//로그인 화면을 이동
		return;
	}
%>