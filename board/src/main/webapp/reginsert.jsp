<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.* , javax.sql.*, javax.naming.*" %>
<%	// id,passwd,email,phone,birth 파라미터값을 받아온다.
	String id 		= request.getParameter("id");
	String passwd 	= request.getParameter("passwd");
	String email	= request.getParameter("email");
	String phone	= request.getParameter("phone");
	String birth	= request.getParameter("birth");
	Timestamp time = new Timestamp(System.currentTimeMillis());
	
	// 객체 인스턴스 변수 생성 초기화
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "org.mariadb.jdbc.Driver";			// mariaDB JDBC 드라이버
	String url = "jdbc:mysql://localhost:3306/testdb3";	// mariaDB 연결 주소(DB: testdb3)
	
	try {
		// 1. JDBC 드라이버 로드
		Class.forName(driver);
		System.out.println("JDBC 드라이버 로딩 성공");
		
		// 2. Connection 객체 인스턴스 변수(conn)
		conn = DriverManager.getConnection(url, "java", "java");
		System.out.println("데이터베이스 접속 성공");

		// 3. SQL 구문 선언
		String insertSql = "insert into member2 values(?, ?, ?, ?, ?, ?, ?, now())";
		String updatelevel = "update member2 set level=level+3 where id='admin'"; // admin id에만 레벨 2를 추가함


		// 4. preparedStatement 객체 인스턴스 변수 선언 및 실행
		pstmt = conn.prepareStatement(insertSql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, email);
		pstmt.setString(4, phone);
		pstmt.setString(5, birth);
		pstmt.setTimestamp(6, time);		//따로 입력하지 않은 가입날짜를 나타낸다. TIMESTAMP는 가장 정밀한 시간을 나타낼때 사용된다.
		pstmt.setInt(7, 1);					//따로 입력하지 않은 level값에 기본적으로 1을 부여한다.
		
		
		
		int result = pstmt.executeUpdate();
		if(result != 0) {
			out.println("회원 등록 완료<br>");
		}
		
		// 가입을 시도하는 아이디가 admin일 경우 아래 SQL 구문 실행
		if(id.equals("admin")){ 
			pstmt = conn.prepareStatement(updatelevel);
			rs = pstmt.executeQuery();
		}

	}
	catch(ClassNotFoundException e) {
		System.out.println("드라이버 로드 실패");
		e.printStackTrace();
	}
	catch(SQLException e) {
		System.out.println("SQL 에러");
		e.printStackTrace();
	}
	catch(Exception e) {
		System.out.println("에러");
		e.printStackTrace();
	}finally{
		//사용한 객체를 반환한다.
		try{
			pstmt.close();
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	label {
		display: inline-block;
		width: 120px;
		margin: 5px auto;
	}
	input[type="text"], input[type="password"] {
		border: 2px solid lightcoral;
		background-color: lightpink;
	}
</style>
</head>
<body>
	<h3>아이디 : <%=id %></h3>
	<h3>비밀번호 : <%=passwd %></h3>
	<h3>이메일 : <%=email %></h3>
	<h3>휴대번호 : <%=phone %></h3>
	<h3>생년월일 : <%=birth %></h3>
	<a href="login.jsp">로그인</a>
</body>
</html>