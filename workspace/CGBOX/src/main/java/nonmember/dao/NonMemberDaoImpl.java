package nonmember.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import vo.NonMemberVO;

public class NonMemberDaoImpl implements INonMemberDao {

	private SqlMapClient client;
	private static INonMemberDao dao;
	private NonMemberDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static INonMemberDao getInstance() {
		if(dao == null) dao = new NonMemberDaoImpl();
		
		return dao;
	}
	
	@Override
	public void insertNonMember(NonMemberVO vo) throws SQLException {
		client.insert("nonmember.insertNonMember", vo);
	}

	@Override
	public void insertCustomer(int num) throws SQLException {
		client.insert("nonmember.insertCustomer", num);
	}

	@Override
	public int selectMaxCustomer() throws SQLException {
		return (int) client.queryForObject("nonmember.selectMaxCustomer");
	}

	@Override
	public int selectNonmemberCount(NonMemberVO vo) throws SQLException {
		return (int) client.queryForObject("nonmember.selectNonmemberCount", vo);
	}

	@Override
	public String selectNonPass(NonMemberVO vo) throws SQLException {
		return (String) client.queryForObject("nonmember.selectNonPass", vo);
	}

}
