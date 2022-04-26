package kr.or.ddit.basic.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import kr.or.ddit.basic.mvc.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao {
	static final Logger logger = Logger.getLogger(MemberDaoImpl.class);

	//싱글톤패턴
	private static MemberDaoImpl instanse;
	private MemberDaoImpl() {}
	public static MemberDaoImpl getInstance() {
		if(instanse == null) instanse = new MemberDaoImpl();
		return instanse;
	}
	
	@Override
	public int insertMember(Connection conn, MemberVO memVo) throws SQLException {
		String sql = "insert into mymember(mem_id, mem_pass, mem_name, mem_tel, mem_addr)"
				+ " values(?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memVo.getMem_id());
		pstmt.setString(2, memVo.getMem_pass());
		pstmt.setString(3, memVo.getMem_name());
		pstmt.setString(4, memVo.getMem_tel());
		pstmt.setString(5, memVo.getMem_addr());
		
		logger.info("PreparedStatement 객체 생성");
		logger.info("실행 SQL문 : " + sql);
		logger.info("사용 데이터 : [" + memVo.getMem_id() +", " + memVo.getMem_pass()+", " + memVo.getMem_name() +", " + memVo.getMem_tel()+", " + memVo.getMem_addr());
		
		int cnt = pstmt.executeUpdate();
		logger.info("insert 작업 성공");
		
		if(pstmt != null) {
			pstmt.close();
			logger.info("PreparedStatement 객체 반납");
		}
		
		return cnt;
	}

	@Override
	public int deleteMember(Connection conn, String memId) throws SQLException {
		String sql = "DELETE FROM mymember"
				+ " WHERE mem_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memId);
		logger.info("PreparedStatement 객체 생성");
		logger.info("실행 SQL문 : " + sql);
		
		int cnt = pstmt.executeUpdate();
		logger.info("delete 작업 성공");
		
		if(pstmt != null) {
			pstmt.close();
			logger.info("PreparedStatement 객체 반납");
		}
		
		return cnt;
	}

	@Override
	public int updateMember(Connection conn, MemberVO memVo) throws SQLException {
		String sql = "update mymember"
				+ "      set mem_pass = ?,"
				+ "          mem_name = ?,"
				+ "          mem_tel = ?,"
				+ "          mem_addr =?"
				+ "    where mem_id = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memVo.getMem_pass());
		pstmt.setString(2, memVo.getMem_name());
		pstmt.setString(3, memVo.getMem_tel());
		pstmt.setString(4, memVo.getMem_addr());
		pstmt.setString(5, memVo.getMem_id());
		logger.info("PreparedStatement 객체 생성");
		logger.info("실행 SQL문 : " + sql);
		
		int cnt = pstmt.executeUpdate();
		logger.info("update 작업 성공");
		
		if(pstmt != null) {
			pstmt.close();
			logger.info("PreparedStatement 객체 반납");
		}
		
		return cnt;
	}

	@Override
	public List<MemberVO> getAllMember(Connection conn) throws SQLException {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO memVo = null;
		
		String sql = "select * from mymember";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			memVo = new MemberVO();
			memVo.setMem_id(rs.getString(1));
			memVo.setMem_name(rs.getString(2));
			memVo.setMem_pass(rs.getString(3));
			memVo.setMem_tel(rs.getString(4));
			memVo.setMem_addr(rs.getString(5));
			
			list.add(memVo);
		}
		
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		
		return list;
	}

	@Override
	public int getMemberCount(Connection conn, String memId) throws SQLException {
		String sql = "select count(*) cnt from mymember"
				+ " where mem_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memId);
		
		ResultSet rs = pstmt.executeQuery();
		int count = 0;
		if(rs.next()) {
			count = rs.getInt("cnt");
		}
		
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		
		return count;
	}

	@Override
	public int updateMember2(Connection conn, Map<String, String> paramMap) throws SQLException {
		String sql = "update mymember set " + paramMap.get("field") + " = ? where mem_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, paramMap.get("data"));
		pstmt.setString(2, paramMap.get("memid"));
		
		int cnt = pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		
		return cnt;
	}

}
