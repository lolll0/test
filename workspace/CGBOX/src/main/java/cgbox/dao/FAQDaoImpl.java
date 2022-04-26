package cgbox.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.FAQVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class FAQDaoImpl implements IFAQDao{

	private SqlMapClient client;
	private static IFAQDao dao;
	private FAQDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static IFAQDao getInstance() {
		if(dao==null) dao = new FAQDaoImpl();
		return dao;
	}
	
	@Override
	public List<FAQVO> FAQList(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("FAQ.FAQList", map);
	}

	@Override
	public List<FAQVO> FAQDetail(int no) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("FAQ.FAQDetail", no);
	}

	@Override
	public int totalCount(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return (int) client.queryForObject("FAQ.totalCount", map);
	}

	@Override
	public int updateFAQ(FAQVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.update("FAQ.updateFAQ", vo);
	}

	@Override
	public int insertFAQ(FAQVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.insert("FAQ.insertFAQ",vo);
	}

	@Override
	public int deleteFAQ(int no) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.delete("FAQ.deleteFAQ", no);
	}

}
