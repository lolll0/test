package cgbox.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.EventVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class EventDaoImpl implements IEventDao {

	private SqlMapClient client;
	private static IEventDao dao;
	private EventDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static IEventDao getInsetance() {
		if(dao == null) dao = new EventDaoImpl();
		return dao;
	}
	
	@Override
	public List<EventVO> eventList(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("event.eventList", map);
	}

	@Override
	public int totalCount(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.queryForObject("event.totalCount", map);
	}
	
	@Override
	public int updateEvent(EventVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.update("event.updateEvent", vo);
	}

	@Override
	public int insertEvent(EventVO vo) throws SQLException {
//		int count = 0;
//		Object obj = client.insert("event.insertEvent",vo);
//		if(obj==null) {
//			count = 1;
//		}
//		return count;
		//selectkey로 시퀀스 쓰면 insert반환값이 null이 아니라 select한 시퀀스 값이 반환  
		return (int)client.insert("event.insertEvent",vo);
	}
	@Override
	public int deleteEvent(int no) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.delete("event.deleteEvent", no);
	}

}
