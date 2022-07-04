<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="membership.MemberDTO" %>
<%@ page import="membership.MemberDAO" %>

<%
	// 로그인 폼으로부터 가져온 아이디, 비밀번호
	String userid = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	System.out.println(userid);
	
	// web.xml에서 가져온 데이터베이스 연결 정보
	String mariaDriver = application.getInitParameter("MariaDBDriver");
	String mariaURL = application.getInitParameter("URL");
	String mariaId = application.getInitParameter("MariaId");
	String mariaPasswd = application.getInitParameter("MariaPasswd");
	
	// 회원 테이블 DAO를 통해 회원 정보 DTO 획득
	MemberDAO dao = new MemberDAO(mariaDriver, mariaURL, mariaId, mariaPasswd);
	MemberDTO memberDTO = dao.getMemberDTO(userid, passwd);
	dao.close();
	
	// 로그인 성공 여부에 따른 처리
	if (memberDTO.getId() != null) {
		// 로그인 성공
		session.setAttribute("sessionId", memberDTO.getId());
		session.setAttribute("level", memberDTO.getLevel());
		response.sendRedirect("Board/list.jsp");
	}
	else {
		// 로그인 실패
		request.setAttribute("loginErrMsg", "로그인 오류");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
%>