package cgbox.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cgbox.vo.EventVO;

public interface IEventDao {

	//이벤트 목록 출력
	public List<EventVO> eventList(Map<String, Object> map) throws SQLException;
	
	//총 이벤트 수
	public int totalCount(Map<String,String> map) throws SQLException;
	
	//이벤트 정보 수정
	public int updateEvent(EventVO vo) throws SQLException;
	
	//이벤트 정보 등록
	public int insertEvent(EventVO vo) throws SQLException;
	
	public int deleteEvent(int no) throws SQLException;
}
