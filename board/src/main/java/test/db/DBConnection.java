package test.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
 public static Connection getCon() throws SQLException{
  Connection conn=null;
  try{
	   Class.forName("org.mariadb.jdbc.Driver");
	   String url="jdbc:mysql://localhost:3306/testdb3";
	   conn = DriverManager.getConnection(url, "java", "java");
   return conn;
  }catch(ClassNotFoundException ce){
   System.out.println(ce.getMessage());
   return null;
  }
 }
}