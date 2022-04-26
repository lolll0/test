package cgbox.service;

import java.util.List;
import java.util.Map;

import cgbox.vo.FAQVO;

public interface IFAQService {

	//FAQ 리스트 출력
	public List<FAQVO> FAQList(Map<String, Object> map);
	//FAQ 상세보기
	public List<FAQVO> FAQDetail(int no); 
	//page정보 구하기 
	public Map<String,Object> getPageInfo(int page,String type,String word);	
	//FAQ 총 개수
	public int totalCount(Map<String,String> map);
	//FAQ 수정
	public int updateFAQ(FAQVO vo);
	//FAQ 등록
	public int insertFAQ(FAQVO vo);
	//FAQ 삭제
	public int deleteFAQ(int no);
	
}
