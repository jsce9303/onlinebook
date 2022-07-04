<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
  <title>주문처리화면</title>
</head>
 
<body>
  <h2>주문해주셔서 감사합니다.</h2>
 
  <%
    String[] ids = request.getParameterValues("id");
    if (ids != null) {
  %>
  <%@ page import = "java.sql.*" %>
  <%
      Class.forName("org.mariadb.jdbc.Driver");
      Connection conn = DriverManager.getConnection(
    		  "jdbc:mysql://localhost:3306/testdb3", "java", "java"); 
      Statement stmt = conn.createStatement();
      String sqlStr;
      int recordUpdated;
      ResultSet rset;
  %>
      <table border=2>
        <tr>
          <th>저자</th>
          <th>제목</th>
          <th>가격</th>
          <th>수량</th>
        </tr>
  <%
      for (int i = 0; i < ids.length; ++i) {
        sqlStr = "UPDATE books SET qty = qty - 1 WHERE id = " + ids[i];
        recordUpdated = stmt.executeUpdate(sqlStr);
        sqlStr = "SELECT * FROM books WHERE id =" + ids[i];
        rset = stmt.executeQuery(sqlStr);
        while (rset.next()) {
  %>
          <tr>
            <td><%= rset.getString("author") %></td>
            <td><%= rset.getString("title") %></td>
            <td><%= rset.getInt("price") %>원</td>
            <td><%= rset.getInt("qty") %></td>
          </tr>
  <%    }
        rset.close();
      }
      stmt.close();
      conn.close();
    }
  %>
  </table>
  <a href="order.jsp"><h3>주문화면으로 돌아가기</h3></a>
</body>
</html>