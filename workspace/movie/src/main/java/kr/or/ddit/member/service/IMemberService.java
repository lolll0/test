package kr.or.ddit.member.service;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService {
	
	public String idCheck(String id);
	
	public String insertMember(MemberVO vo);
	
	///////////////////
	public void insertCustomerNo(int num);
	
	public int selectMaxNo();
}
