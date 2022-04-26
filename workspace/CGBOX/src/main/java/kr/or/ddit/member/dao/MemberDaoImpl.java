package kr.or.ddit.member.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.MemberVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;


public class MemberDaoImpl implements IMemberDao{
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
	public String idCheck(String id) {
		String res = null;
		
		try {
			res = (String)client.queryForObject("member.idCheck", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public String insertMember(MemberVO vo) {
		String id = null;
		
		try {
			id = (String)client.insert("member.insertMember1", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return id;
	}

	@Override
	public void insertCustomerNo(int num) {
		try {
			client.insert("member.insertCustomerNo", num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public int selectMaxNo() {
		int num = 0;
		try {
			num = (int)client.queryForObject("member.selectMaxNo");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}

	
}
