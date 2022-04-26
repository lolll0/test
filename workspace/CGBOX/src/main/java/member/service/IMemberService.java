package member.service;

import java.util.Map;

import cgbox.vo.MemberVO;

/*import vo.MemberVO;*/

public interface IMemberService {
	
	/**
	 * 로그인 메서드
	 * @param vo 로그인 정보
	 * @return 로그인 된 회원 정보
	 */
	public MemberVO loginMember(Map<String, String> map);
	
	public MemberVO selectKakao(String mail);
		
}
