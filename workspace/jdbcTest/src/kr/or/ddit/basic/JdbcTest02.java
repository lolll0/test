package kr.or.ddit.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// 문제) 사용자로부터 LPROD_ID값을 입력 받아서 입력한 값보다 LPROD_ID가 큰 자료들을 출력하시오.

public class JdbcTest02 {
	
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		System.out.println("LPROD_ID값 입력 : ");
		int num =scan.nextInt();
		
		try {
			// 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// DB연결
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe"
											, "KHS97"
											, "java");
			
			
			// sql문 실행
			String sql = "select * from lprod where lprod_id >" + num;
			// Statement객체 생성
			stmt = conn.createStatement();
			// sql문을 DB서버로 보내서 결과를 얻어온다.
			rs = stmt.executeQuery(sql);
			
			System.out.println("==  쿼리문 처리 결과  ==");
			
			while(rs.next()) {
				
				System.out.println("lprod_id : " + rs.getInt("lprod_id"));
				System.out.println("lprod_gu : " + rs.getString("lprod_gu"));
				System.out.println("lprod_nm : " + rs.getString("lprod_nm"));
				System.out.println("----------------------------------------");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try {rs.close();}catch(SQLException e) {}
			if(stmt!=null)try {stmt.close();}catch(SQLException e) {}
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
	}

}
