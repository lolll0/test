package kr.or.ddit.mypage.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.MemberVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.mypage.vo.MtheaterVO;
import kr.or.ddit.mypage.vo.QnaVO;


public class MyPageDaoImpl implements IMyPageDao{
	private static IMyPageDao dao;
	
	private MyPageDaoImpl() {
	}
	
	public static IMyPageDao getInstance() {
		if(dao == null) dao = new MyPageDaoImpl();
		
		return dao;
	}

	@Override
	public MemberVO findMember(SqlMapClient client, String customer_no) throws SQLException {
		return (MemberVO)client.queryForObject("mypage.findMember", customer_no);
	}

	@Override
	public String findGrade(SqlMapClient client, String grade_no) throws SQLException {
		return (String)client.queryForObject("mypage.findGrade",grade_no); 
	}

	@Override
	public int findProduct(SqlMapClient client, String customer_no) throws SQLException {
		return (int)client.queryForObject("mypage.findProduct",customer_no); 
	}

	@Override
	public int findPoint(SqlMapClient client, String customer_no) throws SQLException {
		return (int)client.queryForObject("mypage.findPoint",customer_no);
	}

	@Override
	public List<MtheaterVO> selectAllMtheater(SqlMapClient client) throws SQLException {
		
		return client.queryForList("mypage.selectAllMtheater");
	}

	@Override
	public String findFavorite(SqlMapClient client, String customer_no) throws SQLException {
		return (String)client.queryForObject("mypage.findFavorite",customer_no); 
	}

	@Override
	public int updateFavorite(SqlMapClient client, Map<String, String> map) throws SQLException {
		return client.update("mypage.updateFavorite",map);
	}

	@Override
	public int insertFavorite(SqlMapClient client, Map<String, String> map) throws SQLException {
		int cnt = 0;
		Object obj = client.insert("mypage.insertFavorite",map);
		if(obj == null) cnt = 1;
		return cnt;
	}

	@Override
	public int updateMember(SqlMapClient client, MemberVO vo) throws SQLException {
		return client.update("mypage.updateMember", vo);
	}

	@Override
	public int deleteFavorite(SqlMapClient client, String customer_no) throws SQLException {
		return client.update("mypage.deleteFavorite",customer_no);
	}

	@Override
	public int deleteMember(SqlMapClient client, String customer_no) throws SQLException {
		return client.delete("mypage.deleteMember",customer_no);
	}

	@Override
	public List<Map<String, Object>> reserveList(SqlMapClient client, String customer_no) throws SQLException {
		return client.queryForList("mypage.reserveList", customer_no);
	}

	@Override
	public List<Map<String, Object>> haveProduct(SqlMapClient client, String customer_no) throws SQLException {
		return client.queryForList("mypage.haveProduct", customer_no);
	}

	@Override
	public List<Map<String, Object>> reviewList(SqlMapClient client, String customer_no) throws SQLException {
		return client.queryForList("mypage.reviewList", customer_no);
	}

	@Override
	public int deleteReview(SqlMapClient client, Map<String, String> map) throws SQLException {
		return client.delete("mypage.deleteReview", map);
	}

	@Override
	public List<QnaVO> getQna(SqlMapClient client, String customer_no) throws SQLException {
		return client.queryForList("mypage.getQna", customer_no);
	}

	@Override
	public int deleteQna(SqlMapClient client, String qna_no) throws SQLException {
		return client.delete("mypage.deleteQna",qna_no);
	}

	@Override
	public List<Map<String, Object>> payList(SqlMapClient client, String customer_no) throws SQLException {
		return client.queryForList("mypage.payList", customer_no);
	}
	
}
