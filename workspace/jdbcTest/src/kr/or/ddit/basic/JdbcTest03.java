package kr.or.ddit.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// 문제) LPROD_ID값을 2개를 입력 받아서 두 값들 중 작은값 부터 큰 값사이의 자료드를 출력하시오..

public class JdbcTest03 {

	public static void main(String[] args) {
		// DB작업에 필요한 객체 변수 선언
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				Scanner sc = new Scanner(System.in);
				
				System.out.println("lprod_id : ");
				int num1 = sc.nextInt();
				System.out.println("lprod_id : ");
				int num2 = sc.nextInt();
				
				int min = Math.min(num1, num2);
				int max = Math.max(num1, num2);
				
				try {
					// 1. 드라이버 로딩
					Class.forName("oracle.jdbc.driver.OracleDriver");
					
					// 2. DB연결 ==> Connection객체 생성
					conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" //  DB연결 url
													, "KHS97" // user
													, "java"); // password
					

//					String sql = "select * from lprod "
//							+ "where lprod_id >=" + min
//							+ "and lprod_id <=" + max;
					String sql = "select * from lprod "
							+ " where lprod_id between " + min
							+ " and " + max;
							
					// 4. Statement객체 생성 ==> 질의를 처리하는 객체 생성
					stmt = conn.createStatement();
					
					// 5. SQL문을 DB서버로 보내서 결과를 얻어온다.
					//    (실행할 SQL문이 select문이기 때문에 결과를 ResultSet에 저장되어 반환된다.)
					rs = stmt.executeQuery(sql);
					
					// 6. 결과 처리하기 ==> 한 레코드씩 화면에 출력하기
					//  ResultSet의 저장된 데이터를 차례로 꺼내오려면 반복문과 next()메서드를 이용한다.
					System.out.println("==  쿼리문 처리 결과  ==");
					
					// rs.next() ==> ResultSet객체의 데이터를 가리키는 포인터를 다음번째 위치로 
					//				 이동시키고 그 곳에 데이터가 있으면 true, 없으면 false를 반환한다.
					
					while(rs.next()) {
						System.out.println("lprod_id : " + rs.getInt("lprod_id"));
						System.out.println("lprod_gu : " + rs.getString("lprod_gu"));
						System.out.println("lprod_nm : " + rs.getString("lprod_nm"));
						System.out.println("----------------------------------------");
						
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} finally {
					// 7. 자원 반납
					if(rs!=null)try {rs.close();}catch(SQLException e) {}
					if(stmt!=null)try {stmt.close();}catch(SQLException e) {}
					if(conn!=null)try {conn.close();}catch(SQLException e) {}
				}
				

			}

		}