package cgbox.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cgbox.vo.MemberVO;

public interface IManagerMemberDao {

	//회원 정보 출력
	public List<MemberVO> memberList(Map<String,Object> map) throws SQLException;
	
	//총 회원수 
	public int totalCount(Map<String,String> map) throws SQLException;
	
	//회원 정보 수정
	public int updateMember(MemberVO vo) throws SQLException;
	
	//회원 정보 등록
	public int insertMember(MemberVO vo) throws SQLException;
}
