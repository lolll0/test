package kr.or.ddit.basic.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.ddit.basic.mvc.vo.MemberVO;
// DAO ==> SQL문을 DB서버로 보내서 결과를 얻어오는 역할을 수행하는 클래스
// 인터페이스를 구현한다.
public class MemberDaoImpl implements IMemberDao{
	// 싱글톤 패턴
	// 1번
	private static MemberDaoImpl dao;
	
	// 2번
	private MemberDaoImpl() {
		
	}
	
	// 3번
	public static MemberDaoImpl getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		
		return dao;
	}
	// throws로 넘겼기때문에 try catch구문을 사용하지 않음
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
		
		int cnt = pstmt.executeUpdate();
		
		if(pstmt!=null) pstmt.close();
		
		return cnt;
	}

	@Override
	public int deleteMember(Connection conn, String memId) throws SQLException {
		String sql = "delete from mymember where mem_id = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memId);
		
		int cnt = pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		
		return cnt;
	}

	@Override
	public int updateMember(Connection conn, MemberVO memVo) throws SQLException {
		String sql = "update mymember set mem_pass = ?, mem_name = ?,"
				+ " mem_tel = ?, mem_addr = ? "
				+ " where mem_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memVo.getMem_pass());
		pstmt.setString(2, memVo.getMem_name());
		pstmt.setString(3, memVo.getMem_tel());
		pstmt.setString(4, memVo.getMem_addr());
		pstmt.setString(5, memVo.getMem_id());
		
		int cnt = pstmt.executeUpdate();
		
		if(pstmt!=null) pstmt.close();
		return cnt;
	}
	
//	@Override
//	public int updateMember2(Connection conn, MemberVO memVo) throws SQLException {
//		String updateField = null;
//		String updateData = null;
//		
//		String sql = "update mymember set " + memVo.getUpdateField()
//				+ " = ? where mem_id = ?";
//		
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, memVo.getUpdateData());
//		pstmt.setString(2, memVo.getMem_id());
//		
//		int cnt = pstmt.executeUpdate();
//		
//		if(pstmt!= null) pstmt.close();
//		return cnt;
//	}
	
	@Override
	public List<MemberVO> getAllMember(Connection conn) throws SQLException {
		List<MemberVO> memList = null; // 반환값이 저장될 변수
		String sql = "select * from mymember";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		memList = new ArrayList<MemberVO>();
		
		while(rs.next()) {
			MemberVO memVo = new MemberVO(); // 1개의 레코드가 저장될 변수
			memVo.setMem_id(rs.getString("mem_id"));
			memVo.setMem_pass(rs.getString("mem_pass"));
			memVo.setMem_name(rs.getString("mem_name"));
			memVo.setMem_tel(rs.getString("mem_tel"));
			memVo.setMem_addr(rs.getString("mem_addr"));
			
			memList.add(memVo); // List에 MemberVO객체 추가
		}
		
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		
		return memList;
	}

	@Override
	public int getMemberCount(Connection conn, String memId) throws SQLException {
		String sql = "select count(*) cnt from mymember"
				+ " where mem_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memId);
		
		ResultSet rs = pstmt.executeQuery();
		int count = 0;
		if(rs.next()) {
			count = rs.getInt("cnt");
		}
		
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		
		return count;
	}

	@Override
	public int updateMember2(Connection conn, Map<String, String> paramMap) throws SQLException {
		// key값 정보 ==> 회원ID(memid), 수정할컬럼명(field), 수정할데이터(data)
		String sql ="update mymember set "
				+ paramMap.get("field") + " = ? "
				+ " where mem_id = ? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, paramMap.get("data"));
		pstmt.setString(2, paramMap.get("memid"));
		
		int cnt = pstmt.executeUpdate();
		
		if(pstmt!=null) pstmt.close();
		
		return cnt;
	}

	

	
	
}
