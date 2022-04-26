package nonmember.service;


import vo.NonMemberVO;

public interface INonMemberService {
	
	public void insertNonMember(NonMemberVO vo);
	
	public void insertCustomer(int num);
	
	public int selectMaxCustomer();

	public int selectNonmemberCount(NonMemberVO vo);
	
	public String selectNonPass(NonMemberVO vo);
	
}
