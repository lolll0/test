package kr.or.ddit.member.dao;

import java.sql.SQLException;

import cgbox.vo.MemberVO;



public interface IMemberDao {
	
	public String idCheck(String id);
	
	public String insertMember(MemberVO vo);
	
	
	///////////////////
	public void insertCustomerNo(int num);
	
	public int selectMaxNo();
}
