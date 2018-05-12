package com.insta.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnect {

	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final String USER = "custom";
	final String PASSWORD = "1111";

	
	public void dbClose(ResultSet rs, PreparedStatement pstmt) {

		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void dbClose(Connection conn) {

		try {
			if (conn != null) {
				conn.close();
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {

		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void dbClose(PreparedStatement pstmt, Connection conn) {			// 딱히 오버로딩을 할 필요는 없다.

		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Connection dbConn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로드
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD); // 데이터베이스
																		// 연결
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// statement는 db와 연결되는 connection 객체와의 의사 소통을 위해서, DB에게 명령을 내릴때 그것을 던져주는
		// 역할을 하는 인터페이스 사용자의 명령에 대응하기 위한 객체

		return conn;

	}

	public static void main(String[] args) {
		DBConnect c = new DBConnect();
		c.dbConn();
	}

}
