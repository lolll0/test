package ticket.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import vo.NonMemberVO;
import vo.TicketVO;

public class TicketDaoImpl implements ITicketDao {
	
	private SqlMapClient client;
	private static ITicketDao dao;
	private TicketDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static ITicketDao getInstance() {
		if(dao == null) dao = new TicketDaoImpl();
		
		return dao;
	}
	
	
	@Override
	public void insertNew(int cno) throws SQLException {
		client.insert("ticket.insertNew", cno);
	}
	
	
	@Override
	public TicketVO selectAllticketByNonMember(NonMemberVO nvo) throws SQLException {
		return (TicketVO) client.queryForObject("ticket.selectAllticketByNonMember", nvo);
	}

}
