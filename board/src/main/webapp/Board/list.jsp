<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
		pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	//해당 페이지에선 레벨에따라 기능을 표시하므로 id와 level을 선언한다.		
	String sessionId;
	int cklevel;	// 접속자의 레벨체크
		//세션 값이 있는지 체크
	if(session.getAttribute("sessionId") != null) {					//세션값이 null이 아닐경우(존재할 경우) 아래를 실행한다.
		sessionId = (String)session.getAttribute("sessionId");		//sessionId에 세션값 저장
		cklevel = (int)session.getAttribute("level");				//cklevel에 세션 level값 저장
		out.println("<strong>" + sessionId + "</strong>님 반갑습니다.");
		out.println("당신의 레벨은 " + cklevel + "입니다.");
	}
	else {
		// 세션 값이 없으므로 login.jsp 페이지로 이동
		response.sendRedirect("login.jsp");
		return;
	}
	
	// 객체 인스턴스 변수 생성 초기화
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "org.mariadb.jdbc.Driver";			// mariaDB JDBC 드라이버
	String url = "jdbc:mysql://localhost:3306/testdb3";	// mariaDB 연결 주소(DB: testdb3)

	try {
		// 1. JDBC 드라이버 로드
		Class.forName(driver);
		System.out.println("JDBC 드라이버 로딩 성공");	// 확인용(콘솔에 표시됨)

		// 2. Connection 객체 인스턴스 변수(conn)
		conn = DriverManager.getConnection(url, "java", "java");
		System.out.println("데이터베이스 접속 성공");	// 확인용(콘솔에 표시됨)
		
		// 3. SQL 구문 선언
		String selectSql = "SELECT * FROM member2";

		// 4. preparedStatement 객체 인스턴스 변수(stmt)
		pstmt = conn.prepareStatement(selectSql);

		// 5. SQL 실행
		rs = pstmt.executeQuery();
	%>

<html>
  <head><title> 게시판 </title></head>
  
	<!-- 레벨이 4 이상부터 회원정보 조회 / 삭제 가능 -->
	<%if(cklevel==4){ %>
	<table border="1">
		<caption>회원목록</caption>
			<thead>
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이메일</th>
					<th>휴대번호</th>
					<th>생년월일</th>
					<th>등록일자</th>
					<th>회원레벨</th>
					<th>마지막 접속시간</th>
					<th>삭제</th>
					<th>레벨업</th>
					<th>레벨다운</th>
				</tr>
			</thead>
			<tbody>
<%
			// rs.next()는 각 행을 조사하여 데이터가 있으면 true로 리턴하고 다음 행으로 이동한다 - 데이터가 없을 때 까지
		while(rs.next()) {
			String id = rs.getString("id");
			String passwd = rs.getString("passwd");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String birth = rs.getString("birth");
			String regdate = rs.getString("regdate");
			int level = rs.getInt("level");
			String lasttime = rs.getString("lasttime");
			// 출력이 잘 되는지 임시 테스트하기 위한 구문
			// out.println(id + " | " + birth + " | " + regdate);
%>

			<tr>
				<td><%=id %></td>
				<td><%=passwd %></td>
				<td><%=email %></td>
				<td><%=phone %></td>
				<td><%=birth %></td>
				<td><%=regdate %></td>
				<td><%=level %></td>
				<td><%=lasttime %></td>
				<td>
		    		<a href="member_delete.jsp?id=<%=id %>">삭제</a> <!-- 삭제링크를 누르면 삭제절차 실행 -->
				</td>
				<td>
		    		<a href="member_levelup.jsp?id=<%=id %>">레벨+1</a> <!-- 레벨업을 누르면 레벨+1 실행 -->
				</td>
				<td>
		    		<a href="member_leveldown.jsp?id=<%=id %>">레벨-1</a> <!-- 레벨다운 누르면 레벨-1 실행 -->
				</td>
			</tr>
<%
		}
%>
<%
	}
%>
		</tbody>
	</table>
	<%

	

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
	}
	finally {
		try {
			//객체 반환
			rs.close();
			pstmt.close();
			conn.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	%>
  <body>
  
	<% if(cklevel>=2){%>	<!-- 레벨 2부터 게시글 조회가능 -->
 <h3> 게시글 리스트 </h3>
     <table border="2">
      <tr>
	  <td> 번호 </td>
	  <td> 제목 </td>
	  <td> 작성자 </td>
	  <td> 날짜 </td>
	  <td> 이메일 </td>
      </tr>

      <%		
	Connection con=null;
	Statement stmt=null;
         try {
        	   Class.forName("org.mariadb.jdbc.Driver");
               String url2 = "jdbc:mysql://localhost:3306/testdb3";
               con = DriverManager.getConnection(url2, "java", "java");
	}
         catch(Exception e) {
               out.println("데이터베이스 접속에 문제가 있습니다.<hr>");
               out.println(e.getMessage()); 
		e.printStackTrace(); 
         }
               stmt = con.createStatement();
               String sql = "select * from message order by id asc ";
               ResultSet rs2 = stmt.executeQuery(sql);

	if( rs2 != null) {	// 게시글 리스트 불러오기
  	 while(rs2.next())
	 {
	       int id = Integer.parseInt(rs2.getString("id"));
      %>
      

      <tr>
         <td> <%= id %></td>
         <td>    <a href=display.jsp?id=<%= id %>>  
                        <%=rs2.getString("subject")%></a></td>
         <td> <%= rs2.getString("name") %></td>
         <td> <%= rs2.getString("time") %></td>
         <td><%= rs2.getString("email") %></td>
      </tr>

      <%
	 }
	}
      %>
      
    <% 
       if( stmt!= null ) stmt.close();
       if( con!= null ) con.close();
    %>

    </table>
		 <%} %>
    
	<a href="../ebookshop/order.jsp">온라인 서점</a>
    <!-- 레벨이 3 이상부터 글쓰기 가능 -->
	<% if(cklevel>=3){%>
    <a href="write.jsp"> 게시글 쓰기 </a>
		 <%} %>
	<a href="../logOut.jsp">로그아웃</a>
  </body>
  </body>
</html>