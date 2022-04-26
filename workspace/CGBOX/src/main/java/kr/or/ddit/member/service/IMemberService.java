package kr.or.ddit.member.service;

import cgbox.vo.MemberVO;

public interface IMemberService {
	
	public String idCheck(String id);
	
	public String insertMember(MemberVO vo);
	
	///////////////////
	public void insertCustomerNo(int num);
	
	public int selectMaxNo();
}
