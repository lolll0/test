package kr.or.ddit.mypage.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.MemberVO;
import kr.or.ddit.mypage.vo.MtheaterVO;
import kr.or.ddit.mypage.vo.QnaVO;

public interface IMyPageService {

	
	public MemberVO findMember(String customer_no);
	
	public String findGrade(String grade_no);
	
	public int findProduct(String customer_no);
	
	public int findPoint(String customer_no);
	
	public List<MtheaterVO> selectAllMtheater();
	
	public String findFavorite(String customer_no);
	
	public int updateFavorite(Map<String, String> map);
	
	public int insertFavorite(Map<String, String> map);
	
	public int updateMember(MemberVO vo );
	
	public int deleteFavorite(String customer_no);
	
	public int deleteMember(String customer_no);
	
	public List<Map<String, Object>> reserveList(String customer_no);
	
	public List<Map<String, Object>> haveProduct(String customer_no);

	public List<Map<String, Object>> reviewList(String customer_no);
	
	public int deleteReview(Map<String, String> map);

	public List<QnaVO> getQna(String customer_no);
	
	public int deleteQna(String qna_no);
	
	public List<Map<String, Object>> payList(String customer_no);
}
