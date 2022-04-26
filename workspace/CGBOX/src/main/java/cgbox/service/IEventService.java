package cgbox.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cgbox.vo.EventVO;

public interface IEventService {

	//이벤트 목록 출력
	public List<EventVO> eventList(Map<String, Object> map);
	
	//page정보 구하기 
	public Map<String,Object> getPageInfo(int page,String type,String word);	
	
	//전체 이벤트 수 가져오기	
	public int totalCount(Map<String,String> map);	
	
	//이벤트 정보 수정
	public int updateEvent(EventVO vo);
	
	//이벤트 정보 등록
	public int insertEvent(EventVO vo);
	
	//이벤트 삭제
	public int deleteEvent(int no);
}
