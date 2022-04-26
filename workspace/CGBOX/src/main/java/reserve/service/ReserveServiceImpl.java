package reserve.service;

import java.sql.SQLException;
import java.util.List;

import cgbox.vo.ReserveVO;
import reserve.dao.IReserveDao;
import reserve.dao.ReserveDaoImpl;
/*import vo.ReserveVO;*/

public class ReserveServiceImpl implements IReserveService {
	
	private IReserveDao dao;
	private static IReserveService service;
	private ReserveServiceImpl() {
		dao = ReserveDaoImpl.getInstance();
	}
	public static IReserveService getInstance() {
		if(service == null) service = new ReserveServiceImpl();
		
		return service;
	}
	
	@Override
	public void insertNew(ReserveVO vo) {
		try {
			dao.insertNew(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<ReserveVO> selectReserveByTicket(int tno) {
		List<ReserveVO> list = null;
		
		try {
			list = dao.selectReserveByTicket(tno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public List<ReserveVO> selectAllByscno(int scno) {
		List<ReserveVO> list = null;
		
		try {
			list = dao.selectAllByscno(scno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

}
