package kr.or.ddit.basic.mvc.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.basic.mvc.dao.IMemberDao;
import kr.or.ddit.basic.mvc.dao.MemberDaoImpl;
import kr.or.ddit.basic.mvc.vo.MemberVO;
import kr.or.ddit.util.DBUtil3;
/* 
 	Service ==> 일을 수행하는 중간 관리자와 같은 역할을 수행하는 클래스
	서비스는 일이 있으면 그 일에 필요한 DAO를 호출해서 일을 처리한 후
	처리 결과를 Controller에게 전달한다.
*/

// 서비스는 DAO를 사용한다.
// 그러기 위해서는 DAO객체가 있어야한다.
public class MemberServiceImpl implements IMemberService {
	
	private IMemberDao dao;
	
	// 싱글톤 패턴
	// 1번
	private static MemberServiceImpl memSer;
	
	// 생성자
	// 2번
	private MemberServiceImpl() {
//		dao = new MemberDaoImpl();
		dao = MemberDaoImpl.getInstance();
	}
	
	// 3번
	public static MemberServiceImpl getInstance() {
		if(memSer == null) memSer = new MemberServiceImpl();
		
		return memSer;
	}
	
	@Override
	public int insertMember(MemberVO memVo) {
		Connection conn = null;
		int cnt = 0; // 반환값 변수 
		try {
			conn = DBUtil3.getConnection();
			cnt = dao.insertMember(conn, memVo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		} finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return cnt;
	}

	@Override
	public int deleteMember(String memId) {
		Connection conn = null;
		int cnt = 0; // 반환값이 저장될 변수
		try {
			conn = DBUtil3.getConnection();
			cnt = dao.deleteMember(conn, memId);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		} finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return cnt;
	}

	@Override
	public int updateMember(MemberVO memVo) {
		Connection conn = null;
		int cnt = 0;
		try {
			conn = DBUtil3.getConnection();
			cnt = dao.updateMember(conn, memVo);
		} catch (SQLException e) {
			e.printStackTrace();
			cnt = 0;
		} finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return cnt;
	}
	
//	@Override
//	public int updateMember2(MemberVO memVo) {
//		Connection conn = null;
//		int cnt = 0;
//		try {
//			conn = DBUtil3.getConnection();
//			cnt = dao.updateMember2(conn, memVo);
//		} catch (SQLException e) {
//			e.printStackTrace();
//			cnt = 0;
//		}finally {
//			if(conn!=null)try {conn.close();}catch(SQLException e) {}
//		}
//		return cnt;
//	}
	
	@Override
	public List<MemberVO> getAllMember() {
		Connection conn = null;
		List<MemberVO> memList = null;
		try {
			conn = DBUtil3.getConnection();
			memList = dao.getAllMember(conn);
		} catch (SQLException e) {
			memList = null;
			e.printStackTrace();
		} finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return memList;
	}

	@Override
	public int getMemberCount(String memId) {
		Connection conn = null;
		int count = 0;
		try {
			conn = DBUtil3.getConnection();
			count = dao.getMemberCount(conn, memId);
		} catch (SQLException e) {
			count = 0;
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int updateMember2(Map<String, String> paramMap) {
		Connection conn = null;
		int cnt = 0;
		
		try {
			conn = DBUtil3.getConnection();
			cnt = dao.updateMember2(conn, paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
			cnt = 0;
		} finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
		return cnt;
	}

	

}
