package seat.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.SeatVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;
/*import vo.SeatVO;*/

public class SeatDaoImpl implements ISeatDao {
	private SqlMapClient client;
	private static ISeatDao dao;
	private SeatDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static ISeatDao getInstance() {
		if(dao == null) dao = new SeatDaoImpl();
		
		return dao;
	}
	
	@Override
	public int selectSeatNo(SeatVO vo) throws SQLException {
		return (int) client.queryForObject("seat.selectSeatNo", vo);
	}
	@Override
	public SeatVO selectSeatByNo(int sno) throws SQLException {
		return (SeatVO) client.queryForObject("seat.selectSeatByNo", sno);
	}
	@Override
	public List<SeatVO> selectAllBytno(int tno) throws SQLException {
		return client.queryForList("seat.selectAllBytno", tno);
	}

}
