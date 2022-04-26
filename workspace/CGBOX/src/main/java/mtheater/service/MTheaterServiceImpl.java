package mtheater.service;

import java.sql.SQLException;
import java.util.List;

import mtheater.dao.IMTheaterDao;
import mtheater.dao.MTheatherDaoImpl;
import vo.MTheaterVO;

public class MTheaterServiceImpl implements IMTheaterService {

	private IMTheaterDao dao;
	private static IMTheaterService service;
	private MTheaterServiceImpl() {
		dao = MTheatherDaoImpl.getInstance();
	}
	public static IMTheaterService getInstance() {
		if(service == null) service = new MTheaterServiceImpl();
		
		return service;
	}
	
	
	@Override
	public List<MTheaterVO> selectAll() {
		List<MTheaterVO> list = null;
		
		try {
			list = dao.selectAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return list;
	}
	
	@Override
	public MTheaterVO selectAllByName(String name) {
		MTheaterVO vo = null;
		
		try {
			vo = dao.selectAllByName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	@Override
	public String selectNameByNo(int mhno) {
		String result = null;
		
		try {
			result = dao.selectNameByNo(mhno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
