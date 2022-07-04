package test.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect2{
	
	public Connection conn;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;

	//기본 생성자
	public JDBConnect2(String driver, String url, String id, String passwd) {
		try {
			// JDBC 드라이버 로드
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("드라이버 로드 성공2");
			
			//Database 연결
			conn = DriverManager.getConnection(url, id, passwd);
			System.out.println("DB 연결 성공2");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
}
	//객체 반환
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}