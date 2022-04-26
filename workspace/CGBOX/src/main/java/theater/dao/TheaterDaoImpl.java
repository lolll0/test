package theater.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
/*import vo.TheaterVO;*/
import cgbox.vo.TheaterVO;

public class TheaterDaoImpl implements ITheaterDao {
	
	private SqlMapClient client;
	private static ITheaterDao dao;
	private TheaterDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static ITheaterDao getInstance() {
		if(dao == null) dao = new TheaterDaoImpl();
		
		return dao;
	}
		
	@Override
	public List<TheaterVO> selectAllByMtheaterNo(int no) throws SQLException {
		return client.queryForList("theater.selectAllByMtheaterNo", no);
	}
	
	@Override
	public TheaterVO selectAllByTheaterNo(int tno) throws SQLException {
		return (TheaterVO) client.queryForObject("theater.selectAllByTheaterNo", tno);
	}
	
	@Override
	public int selectTheaterNoByScreenNo(int sno) throws SQLException {
		return (int) client.queryForObject("theater.selectTheaterNoByScreenNo", sno);
	}
	@Override
	public int selectTheaterPriceByMnoAndTname(Map<String, String> map) throws SQLException {
		return (int) client.queryForObject("theater.selectTheaterPriceByMnoAndTname", map);
	}

}
