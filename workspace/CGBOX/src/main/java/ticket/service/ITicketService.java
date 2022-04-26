package ticket.service;

import java.util.List;

import vo.NonMemberVO;
import vo.TicketVO;

public interface ITicketService {
	public void insertNew(int cno);
	public TicketVO selectAllticketByNonMember(NonMemberVO nvo);
}
