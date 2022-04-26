package reserve.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.ReserveVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;
/*import vo.ReserveVO;*/

public class ReserveDaoImpl implements IReserveDao {

	private SqlMapClient client;
	private static IReserveDao dao;
	private ReserveDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static IReserveDao getInstance() {
		if(dao == null) dao = new ReserveDaoImpl();
		
		return dao;
	}
	
	@Override
	public void insertNew(ReserveVO vo) throws SQLException {
		client.insert("reserve.insertNew",vo);
	}
	
	@Override
	public List<ReserveVO> selectReserveByTicket(int no) throws SQLException {
		return client.queryForList("reserve.selectReserveByTicket",no);
	}
	@Override
	public List<ReserveVO> selectAllByscno(int scno) throws SQLException {
		return client.queryForList("reserve.selectAllByscno", scno);
	}

}
