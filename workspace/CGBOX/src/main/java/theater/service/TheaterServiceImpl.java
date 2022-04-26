package theater.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cgbox.vo.TheaterVO;
import theater.dao.ITheaterDao;
import theater.dao.TheaterDaoImpl;
/*import vo.TheaterVO;*/

public class TheaterServiceImpl implements ITheaterService{

	private ITheaterDao dao;
	private static ITheaterService service;
	private TheaterServiceImpl() {
		dao = TheaterDaoImpl.getInstance();
	}
	
	public static ITheaterService getInstance() {
		if(service == null) service = new TheaterServiceImpl();
		
		return service;
	}
	@Override
	public List<TheaterVO> selectAllByMtheaterNo(int no) {
		List<TheaterVO> list = null;
		
		try {
			list = dao.selectAllByMtheaterNo(no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public TheaterVO selectAllByTheaterNo(int tno) {
		TheaterVO result = null;
		
		try {
			result = dao.selectAllByTheaterNo(tno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int selectTheaterNoByScreenNo(int sno) {
		int result = 0;
		try {
			result = dao.selectTheaterNoByScreenNo(sno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int selectTheaterPriceByMnoAndTname(Map<String, String> map) {
		int result = 0;
		try {
			result = dao.selectTheaterPriceByMnoAndTname(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
