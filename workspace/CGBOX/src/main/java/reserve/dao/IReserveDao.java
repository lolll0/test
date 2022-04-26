package reserve.dao;

import java.sql.SQLException;
import java.util.List;

import cgbox.vo.ReserveVO;

/*import vo.ReserveVO;*/

public interface IReserveDao {
	
	public void insertNew(ReserveVO vo) throws SQLException;
	
	public List<ReserveVO> selectReserveByTicket(int no) throws SQLException; 
	
	public List<ReserveVO> selectAllByscno(int scno) throws SQLException;
}
