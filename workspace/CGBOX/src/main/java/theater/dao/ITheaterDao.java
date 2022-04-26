package theater.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cgbox.vo.TheaterVO;

/*import vo.TheaterVO;*/

public interface ITheaterDao {
	
	public List<TheaterVO> selectAllByMtheaterNo(int no) throws SQLException;
	
	public TheaterVO selectAllByTheaterNo(int tno) throws SQLException;

	public int selectTheaterNoByScreenNo(int sno) throws SQLException;
	
	public int selectTheaterPriceByMnoAndTname(Map<String, String> map) throws SQLException;

}
