package cgbox.service;

import java.util.List;
import java.util.Map;

import cgbox.vo.MemberVO;

public interface IManagerMemberService {

	//회원 정보 출력
	public List<MemberVO> memberList(Map<String,Object> map);
		
	//page정보 구하기 
	public Map<String,Object> getPageInfo(int page,String type,String word);	
	
	//전체 회원 수 가져오기	
	public int totalCount(Map<String,String> map);	
		
	//회원 정보 수정
	public int updateMember(MemberVO vo);
	
	//회원 정보 등록
	public int insertMember(MemberVO vo);
}
