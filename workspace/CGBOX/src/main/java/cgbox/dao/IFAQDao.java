package cgbox.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cgbox.vo.FAQVO;

public interface IFAQDao {

	//FAQ 리스트 출력
	public List<FAQVO> FAQList(Map<String, Object> map) throws SQLException;
	//FAQ 상세보기
	public List<FAQVO> FAQDetail(int no) throws SQLException;
	//FAQ 총 개수
	public int totalCount(Map<String,String> map) throws SQLException;
	//FAQ 수정
	public int updateFAQ(FAQVO vo) throws SQLException;
	//FAQ 등록
	public int insertFAQ(FAQVO vo) throws SQLException;
	//FAQ 삭제
	public int deleteFAQ(int no) throws SQLException;
}
