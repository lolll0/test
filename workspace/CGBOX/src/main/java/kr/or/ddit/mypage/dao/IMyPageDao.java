package kr.or.ddit.mypage.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.MemberVO;
import kr.or.ddit.mypage.vo.MtheaterVO;
import kr.or.ddit.mypage.vo.QnaVO;

public interface IMyPageDao {
	
	public MemberVO findMember(SqlMapClient client, String customer_no) throws SQLException;
	
	public String findGrade(SqlMapClient client, String grade_no) throws SQLException;
	
	public int findProduct(SqlMapClient client, String customer_no) throws SQLException;

	public int findPoint(SqlMapClient client, String customer_no) throws SQLException;
	
	public List<MtheaterVO> selectAllMtheater(SqlMapClient client) throws SQLException;
	
	public String findFavorite(SqlMapClient client, String customer_no) throws SQLException;
	
	public int updateFavorite(SqlMapClient client, Map<String, String> map) throws SQLException;
	
	public int insertFavorite(SqlMapClient client, Map<String, String> map) throws SQLException;

	public int updateMember(SqlMapClient client, MemberVO vo ) throws SQLException;
	
	public int deleteFavorite(SqlMapClient client, String customer_no) throws SQLException;

	public int deleteMember(SqlMapClient client, String customer_no) throws SQLException;
	
	public List<Map<String, Object>> reserveList(SqlMapClient client, String customer_no) throws SQLException;

	public List<Map<String, Object>> haveProduct(SqlMapClient client, String customer_no) throws SQLException;

	public List<Map<String, Object>> reviewList(SqlMapClient client, String customer_no) throws SQLException;
	
	public int deleteReview(SqlMapClient client, Map<String, String> map) throws SQLException;
	
	public List<QnaVO> getQna(SqlMapClient client, String customer_no) throws SQLException;
	
	public int deleteQna(SqlMapClient client, String qna_no) throws SQLException;
	
	public List<Map<String, Object>> payList(SqlMapClient client, String customer_no) throws SQLException;
	
}
