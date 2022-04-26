package kr.or.ddit.basic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import kr.or.ddit.util.DBUtil;

/*
 	회원을 관리하는 프로그램을 작성하시오.
 	(MYMEMBER 테이블 이용)
 	
 	아래 메뉴의 기능을 모두 구현하시오(CRUD기능 구현하기)
 	
 	메뉴예시)
 	------------------------
 		== 작업 선택 ==
 	  1. 자료 추가			--> insert(C)
 	  2. 자료 수정			--> update(R)
 	  3. 자료 삭제			--> delete(U)
 	  4. 전체 자료 출력		--> select(D)
 	  0. 작업 끝
 	-----------------------  
 	
 	조건)
 	1) 자료 추가에서 '회원ID'는 중복되지 않는다.(중복되면 다시 입력받는다.)
 	2) 자료 삭제는 '회원ID'를 입력 받아서 처리한다.
 	3) 자료 수정에서 '회원ID'는 변경되지 않는다.
 	
 	------------------------
 	MVC패턴, Singleton패턴 조사해오기
 */


public class JdbcTest06 {
	
	Scanner scan = new Scanner(System.in);
	
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public static void main(String[] args) {
		new JdbcTest06().start();

	}
	
	public void start() {
		while(true) {
		System.out.println("== 작업 선택 ==");
		System.out.println("1. 자료 추가 2.자료 수정 3. 자료 삭제 4. 전체 자료 출력 0. 작업 끝");
		
		int input = scan.nextInt();
	
			switch(input) {
			case 1: add();
				break;
			case 2 : update();
				break;
			case 3 : delete();
				break;
			case 4 : all();
				break;
			case 0 :
				System.out.println("프로그램을 종료 합니다.");
				System.exit(0);
			}
		}
	}

	private void all() { // 전체 출력
		try {
			conn = DBUtil.getConnection();
			
			String sql = "select * from mymember";
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			System.out.println("====== 회원 정보 출력 ======");
			
			while(rs.next()) {
				System.out.println("MEM_ID : " + rs.getString(1));
				System.out.println("MEM_NAME : " + rs.getString(2));
				System.out.println("MEM_PASS : " + rs.getString(3));
				System.out.println("MEM_TEL : " + rs.getString(4));
				System.out.println("MEM_ADDR : " + rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(stmt!=null) try {stmt.close();}catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException e) {}
			if(conn!=null) try {conn.close();}catch(SQLException e) {}
		}
		
	}

	private void delete() { // 자료 삭제 '회원ID'를 입력 받아서 처리한다.
		try {
			conn = DBUtil.getConnection();
			
			System.out.println("삭제할 회원 ID : ");
			String memId = scan.next();
			
			String sql = "delete from mymember where mem_id =  ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memId);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0) {
				System.out.println("삭제성공");
			}else {
				System.out.println("삭제실패");
			}
		} catch (SQLException e) {
			// TODO: handle exception
		} finally {
			if(stmt!=null) try {stmt.close();}catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException e) {}
			if(conn!=null) try {conn.close();}catch(SQLException e) {}
		}
		
	}

	private void update() { // 자료 수정  '회원ID'는 변경되지 않는다.
		try {
			conn = DBUtil.getConnection();
			int cnt = 0;
			do {
				System.out.println("수정할 memId : ");
				String memId = scan.next();
				String sql = "select count(*) cnt from mymember where mem_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memId);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					cnt = rs.getInt("cnt");
				}
				if(cnt<1) {
					System.out.println("memId가 없습니다.");
				}
			}while(cnt <= 0);
			
			System.out.println("MEM_NAME : ");
			String memName = scan.nextLine();
			System.out.println("MEM_PASS : ");
			String memPass = scan.nextLine();
			System.out.println("MEM_TEL : ");
			String memTel = scan.nextLine();
			System.out.println("MEM_ADDR : ");
			String memAddr = scan.nextLine();
			
			String sql1 = "update mymember set mem_name = ?, mem_pass = ?, mem_tel=?,mem_addr=?";
			
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, memName);
			pstmt.setString(2, memPass);
			pstmt.setString(3, memTel);
			pstmt.setString(4, memAddr);
			
			int res = pstmt.executeUpdate();
			
			if(res > 0) {
				System.out.println("수정완료");
			}else {
				System.out.println("수정실패");
			}
			
//		} catch (SQLException e) {
//			// TODO: handle exception
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(stmt!=null) try {stmt.close();}catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException e) {}
			if(conn!=null) try {conn.close();}catch(SQLException e) {}
		}
		
	}

	private void add() { // 자료 추가 '회원ID'는 중복되지 않는다.(중복되면 다시 입력받는다.)
		try {
			conn = DBUtil.getConnection();
			
			
			String memid = null;
			int check = 0;
			do {
				System.out.println("MEM_ID : ");
				memid = scan.next();
				
				String sql ="select count(*) cnt from mymember"
						+ " where mem_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memid);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					check = rs.getInt("cnt");
				}
				
				if(check > 0) {
					System.out.println("이미 등록된 회원아이디입니다.");
					System.out.println("다시 입력하세요.");
				}
			}while(check > 0);
			
			System.out.println("MEM_NAME : ");
			String memName = scan.next();
			
			System.out.println("MEM_PASS");
			String memPass = scan.next();
			
			System.out.println("MEM_TEL");
			String memTel = scan.next();
			
			System.out.println("MEM_ADDR");
			String memAddr = scan.next();
			
			String sql2 = "insert into mymember(mem_id, mem_name, mem_pass, mem_tel, mem_addr)"
					+ " values(?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql2);
			
			pstmt.setString(1, memid);
			pstmt.setString(2, memName);
			pstmt.setString(3, memPass);
			pstmt.setString(4, memTel);
			pstmt.setString(5, memAddr);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0) {
				System.out.println("등록 성공");
			}else {
				System.out.println("등록 실패");
			}
		} catch (SQLException e) {
			// TODO: handle exception
		} finally {
			if(stmt!=null) try {stmt.close();}catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException e) {}
			if(conn!=null) try {conn.close();}catch(SQLException e) {}
		}
		
	}
}


















