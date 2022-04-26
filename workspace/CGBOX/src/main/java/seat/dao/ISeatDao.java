package seat.dao;

import java.sql.SQLException;
import java.util.List;

import cgbox.vo.SeatVO;

/*import vo.SeatVO;*/
public interface ISeatDao {
	
	public int selectSeatNo(SeatVO vo) throws SQLException;
	public SeatVO selectSeatByNo(int sno) throws SQLException;
	public List<SeatVO> selectAllBytno(int tno) throws SQLException;
}
