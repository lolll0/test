package ticket.service;

import java.sql.SQLException;
import java.util.List;

import ticket.dao.ITicketDao;
import ticket.dao.TicketDaoImpl;
import vo.NonMemberVO;
import vo.TicketVO;

public class TicketServiceImpl implements ITicketService {

	private ITicketDao dao;
	private static ITicketService service;
	private TicketServiceImpl() {
		dao = TicketDaoImpl.getInstance();
	}
	public static ITicketService getInstance() {
		if(service == null)service = new TicketServiceImpl();
		
		return service;
	}
	
	
	@Override
	public void insertNew(int cno) {

		try {
			dao.insertNew(cno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public TicketVO selectAllticketByNonMember(NonMemberVO nvo) {
		TicketVO vo = null;
		
		try {
			vo= dao.selectAllticketByNonMember(nvo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

}
