package theater.service;

import java.util.List;
import java.util.Map;

import cgbox.vo.TheaterVO;

/*import vo.TheaterVO;*/

public interface ITheaterService {
	
	public List<TheaterVO> selectAllByMtheaterNo(int no);
	
	public TheaterVO selectAllByTheaterNo(int tno);

	public int selectTheaterNoByScreenNo(int sno);
	
	public int selectTheaterPriceByMnoAndTname(Map<String, String> map);
}
