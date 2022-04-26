package ticket.dao;

import java.sql.SQLException;
import java.util.List;

import vo.NonMemberVO;
import vo.TicketVO;

public interface ITicketDao {
	public void insertNew(int cno) throws SQLException;
	
	public TicketVO selectAllticketByNonMember(NonMemberVO nvo) throws SQLException;
	
}
