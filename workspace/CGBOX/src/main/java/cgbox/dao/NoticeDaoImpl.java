package cgbox.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.NoticeVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class NoticeDaoImpl implements INoticeDao {
	
	private SqlMapClient client;
	private static INoticeDao dao;
	private NoticeDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static INoticeDao getInstance() {
		if(dao==null) dao = new NoticeDaoImpl();
		return dao;
	}
	
	@Override
	public List<NoticeVO> noticeList(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("notice.noticeList", map);
	}

	@Override
	public int totalCount(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return (int) client.queryForObject("notice.totalCount", map);
	}

	@Override
	public int updateNotice(NoticeVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.update("notice.updateNotice", vo);
	}

	@Override
	public int insertNotice(NoticeVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.insert("notice.insertNotice",vo);
	}
	@Override
	public int deleteNotice(int no) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.delete("notice.deleteNotice", no);
	}
	@Override
	public List<NoticeVO> noticeDetail(int no) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("notice.noticeDetail", no);
	}

}
