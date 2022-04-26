package cgbox.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.MemberVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class ManagerMemberDaoImpl implements IManagerMemberDao{

	private SqlMapClient client;
	private static IManagerMemberDao dao;
	private ManagerMemberDaoImpl() {
	   
		client = SqlMapClientFactory.getSqlMapClient();
	
	}
	public static IManagerMemberDao getInstance() {
		if(dao ==null){
			dao = new ManagerMemberDaoImpl();
		}
		return dao;
	}
	
	
	@Override
	public List<MemberVO> memberList(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("member.memberList", map);
	}
	@Override
	public int totalCount(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return (int) client.queryForObject("member.totalCount", map);
	}
	@Override
	public int updateMember(MemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.update("member.updateMember", vo);
	}
	@Override
	public int insertMember(MemberVO vo) throws SQLException {
		// TODO Auto-generated method stub
		int count = 0;
		Object obj = client.insert("member.insertMember", vo);
		if(obj==null) {
			count = 1;
		}
		return count;
	}
	
	
}
