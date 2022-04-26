package nonmember.service;

import java.sql.SQLException;

import nonmember.dao.INonMemberDao;
import nonmember.dao.NonMemberDaoImpl;
import vo.NonMemberVO;

public class NonMemberServiceImpl implements INonMemberService {
	private INonMemberDao dao;
	private static INonMemberService service;
	private NonMemberServiceImpl() {
		dao = NonMemberDaoImpl.getInstance();
	}

	public static INonMemberService getInstance() {
		if(service == null) service = new NonMemberServiceImpl();
		
		return service;
	}
	
	@Override
	public void insertNonMember(NonMemberVO vo) {
		
		try {
			dao.insertNonMember(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertCustomer(int num) {
		try {
			dao.insertCustomer(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int selectMaxCustomer() {
		int result = -1;
		
		try {
			result = dao.selectMaxCustomer();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int selectNonmemberCount(NonMemberVO vo) {
		int result = -1;
		
		try {
			result = dao.selectNonmemberCount(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	@Override
	public String selectNonPass(NonMemberVO vo) {
		String result = null;
		try {
			result = dao.selectNonPass(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
