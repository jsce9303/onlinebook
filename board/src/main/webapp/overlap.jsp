<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.* " %>
<%


	// 1. Connection 객체 인스턴스 변수(conn)
	Connection conn = null;

	// 2. SQL 구문 선언
	String sql = "SELECT * FROM member2 WHERE id=?";
	
	// 3. 객체 인스턴스 변수 생성 초기화
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String resultText = "";
	Boolean result = false;
	
	try {
		/* 마리아 db와 연결 */
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
		
		// Connection 객체 인스턴스 변수(conn)
		conn = ds.getConnection();
		
		// preparedStatement 객체 인스턴스 변수
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("id"));
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			resultText = "이미 사용 중인 아이디입니다.";
			result = false;
		} else {
			resultText = "사용 가능한 아이디입니다.";
			result = true;
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>
<script>

	useID();
	
	function useID() {
		
	  if(<%=result %>)
	  {
		  opener.document.querySelector("#chk").checked = true;
		  opener.document.querySelector("#duplicationChk").disabled = true;
		  opener.document.querySelector("#chkResult").innerText = "아이디를 사용할 수 있습니다.";
	  } else {
		  opener.document.querySelector("#chk").checked = false;
		  opener.document.querySelector("#duplicationChk").disabled = false;
		  opener.document.querySelector("#chkResult").innerText = "이미 사용 중인 아이디입니다.";
	  }
	  
	  self.close();
	}
</script>