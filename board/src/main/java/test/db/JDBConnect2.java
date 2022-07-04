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

	//�⺻ ������
	public JDBConnect2(String driver, String url, String id, String passwd) {
		try {
			// JDBC ����̹� �ε�
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("����̹� �ε� ����2");
			
			//Database ����
			conn = DriverManager.getConnection(url, id, passwd);
			System.out.println("DB ���� ����2");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
}
	//��ü ��ȯ
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