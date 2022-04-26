package screen.dao;

import java.sql.SQLException;
import java.util.List;

import cgbox.vo.ScreenVO;

/*import vo.ScreenVO;*/

public interface IScreenDao {
	
	public List<ScreenVO> selectScreenList(ScreenVO vo) throws SQLException;
	
	public ScreenVO selectAllByno(int sno) throws SQLException;

}
