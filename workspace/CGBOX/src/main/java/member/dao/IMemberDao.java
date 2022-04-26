package member.dao;



import java.sql.SQLException;
import java.util.Map;

import cgbox.vo.MemberVO;

/*import vo.MemberVO;*/

public interface IMemberDao {

	public MemberVO loginMember(Map<String, String> map) throws SQLException;
	
	public MemberVO selectKakao(String mail) throws SQLException;
}
