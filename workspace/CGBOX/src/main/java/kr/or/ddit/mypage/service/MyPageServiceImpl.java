package kr.or.ddit.mypage.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.MemberVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.mypage.dao.IMyPageDao;
import kr.or.ddit.mypage.dao.MyPageDaoImpl;
import kr.or.ddit.mypage.vo.MtheaterVO;
import kr.or.ddit.mypage.vo.QnaVO;

public class MyPageServiceImpl implements IMyPageService{
	private static IMyPageService service;
	private IMyPageDao dao;
	private SqlMapClient client;
	
	private MyPageServiceImpl() {
		dao = MyPageDaoImpl.getInstance();
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMyPageService getInstance() {
		if(service == null) service = new MyPageServiceImpl();
		return service;
	}

	@Override
	public MemberVO findMember(String customer_no) {
		MemberVO vo = null;
		
		try {
			vo = dao.findMember(client, customer_no);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		
		
		return vo;
	}

	@Override
	public String findGrade(String grade_no) {
		String str = null;
		
		try {
			str = dao.findGrade(client, grade_no);
		} catch (SQLException e) {
			str = null;
		}
		
		return str;
	}

	@Override
	public int findProduct(String customer_no) {
		int result = 0;
		
		try {
			result = dao.findProduct(client, customer_no);
		} catch (SQLException e) {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int findPoint(String customer_no) {
		int result = 0;
		
		try {
			result = dao.findPoint(client, customer_no);
		} catch (SQLException e) {
			result = 0;
		}
		
		return result;
	}

	@Override
	public List<MtheaterVO> selectAllMtheater() {
		List<MtheaterVO> list = null;
		
		try {
			list = dao.selectAllMtheater(client);
		} catch (SQLException e) {
			list = null;
		}
		
		return list;
	}

	@Override
	public String findFavorite(String customer_no) {
		String str = null;
		
		try {
			str = dao.findFavorite(client, customer_no);
		} catch (SQLException e) {
			str = null;
		}
		
		return str;
	}

	@Override
	public int updateFavorite(Map<String, String> map) {
		int result = 0;
		
		try {
			result = dao.updateFavorite(client, map);
			System.out.println(result);
		} catch (SQLException e) {
			result = 0;
		}
		return result;
	}

	@Override
	public int insertFavorite(Map<String, String> map) {
		int result = 0;
		
		try {
			result = dao.insertFavorite(client, map);
		} catch (SQLException e) {
			result = 0;
		}
		return result;
	}

	@Override
	public int updateMember(MemberVO vo) {
		int result = 0;
		
		try {
			result = dao.updateMember(client, vo);
		} catch (SQLException e) {
			result = 0;
		}
		return result;
	}

	@Override
	public int deleteFavorite(String customer_no) {
		int result = 0;
		
		try {
			result = dao.deleteFavorite(client, customer_no);
		} catch (SQLException e) {
			result = 0;
		}
		return result;
	}

	@Override
	public int deleteMember(String customer_no) {
		int result = 0;
		
		try {
			result = dao.deleteMember(client, customer_no);
		} catch (SQLException e) {
			result = 0;
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> reserveList(String customer_no) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.reserveList(client, customer_no);
		} catch (SQLException e) {
			list = null;
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> haveProduct(String customer_no) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.haveProduct(client, customer_no);
		} catch (SQLException e) {
			list = null;
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> reviewList(String customer_no) {
List<Map<String, Object>> list = null;
		
		try {
			list = dao.reviewList(client, customer_no);
		} catch (SQLException e) {
			list = null;
		}
		return list;
	}

	@Override
	public int deleteReview(Map<String, String> map) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteReview(client, map);
		} catch (SQLException e) {
			cnt = 0;
		}
		
		return cnt;
	}

	@Override
	public List<QnaVO> getQna(String customer_no) {
		List<QnaVO> list = null;
		
		try {
			list = dao.getQna(client, customer_no);
		} catch (SQLException e) {
			list = null;
		}
		return list;
	}

	@Override
	public int deleteQna(String qna_no) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteQna(client, qna_no);
		} catch (SQLException e) {
			cnt = 0;
		}
		
		return cnt;
		
	}

	@Override
	public List<Map<String, Object>> payList(String customer_no) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.payList(client, customer_no);
		} catch (SQLException e) {
			list = null;
		}
		return list;
	}
}
