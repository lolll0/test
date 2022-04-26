package member.dao;

import java.sql.SQLException;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.MemberVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;
/*import vo.MemberVO;*/

public class MemberDaoImpl implements IMemberDao {
	private SqlMapClient client;
	private static IMemberDao dao;
	
	private MemberDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDao getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		
		return dao;
	}

	@Override
	public MemberVO loginMember(Map<String, String> map) throws SQLException{
		return (MemberVO)client.queryForObject("member.loginMember", map);
	}

	@Override
	public MemberVO selectKakao(String mail) throws SQLException {
		return (MemberVO) client.queryForObject("member.selectKakao", mail);
	}


}
