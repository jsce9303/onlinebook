<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	// id 파라미터 값을 받아온다.
	String id = request.getParameter("id");
	
	//객체 인스턴스 변수 생성 초기화
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "org.mariadb.jdbc.Driver";			// mariaDB JDBC 드라이버
	String url = "jdbc:mysql://localhost:3306/testdb3";	// mariaDB 연결 주소(DB: testdb3)
	
	try {
		
		// 1. JDBC 드라이버 로드
		Class.forName(driver);
		
		// 2. Connection 객체 인스턴스 변수(conn)
		conn = DriverManager.getConnection(url,"java","java");
		
		// 3. SQL 구문 선언
		String sql = "update member2 set level=level-1 where id=?";
		
		// 4. preparedStatement 객체 인스턴스 변수(stmt) 및 SQL 실행
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.executeUpdate();
		
		// 5. 모든 절차가 끝나면 회원목록으로 이동
		response.sendRedirect("list.jsp");
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>