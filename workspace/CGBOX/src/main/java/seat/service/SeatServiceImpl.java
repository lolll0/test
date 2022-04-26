package seat.service;

import java.sql.SQLException;
import java.util.List;

import cgbox.vo.SeatVO;
import seat.dao.ISeatDao;
import seat.dao.SeatDaoImpl;
/*import vo.SeatVO;*/

public class SeatServiceImpl implements ISeatService {
	private ISeatDao dao;
	private static ISeatService service;
	private SeatServiceImpl() {
		dao = SeatDaoImpl.getInstance();
	}
	public static ISeatService getInstance() {
		if(service == null) service = new SeatServiceImpl();
		
		return service;
	}
	
	@Override
	public int selectSeatNo(SeatVO vo) {
		int result = 0;
		
		try {
			result = dao.selectSeatNo(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	@Override
	public SeatVO selectSeatByNo(int sno) {
		SeatVO vo = null;
		
		try {
			vo = dao.selectSeatByNo(sno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	@Override
	public List<SeatVO> selectAllBytno(int tno) {
		List<SeatVO> list = null;
		
		try {
			list = dao.selectAllBytno(tno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
