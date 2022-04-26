package kr.or.ddit.prod.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.prod.dao.IProdDao;
import kr.or.ddit.prod.dao.ProdDaoImpl;
import kr.or.ddit.prod.vo.ProdVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class ProdServiceImpl implements IProdService {
	private static IProdService service;
	private IProdDao dao;
	private SqlMapClient client;
	
	private ProdServiceImpl() {
		dao = ProdDaoImpl.getInstance();
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IProdService getInstance() {
		if(service == null) service = new ProdServiceImpl();
		return service;
	}

	@Override
	public List<ProdVO> getAllProd(String category) {
		List<ProdVO> list = null;
		
		try {
			list = dao.getAllProd(client, category);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return list;
	}

	@Override
	public int cartCount(int cid) {
		int result =0;
		
		try {
			result = dao.cartCount(client, cid);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return result;
	}

	@Override
	public int findCart(int cid) {
		int result =0;
		
		try {
			result = dao.findCart(client, cid);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return result;
	}

	@Override
	public int insertCart(int cid) {
		int result =0;
		
		try {
			result = dao.insertCart(client, cid);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return result;
	}

	@Override
	public int insertCartprod(Map<String, Integer> map) {
		int result =0;
		
		try {
			result = dao.insertCartprod(client, map);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return result;
	}

	@Override
	public int insertProd(ProdVO vo) {
		int res=0;
		try {
			res = dao.insertProd(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateProd(ProdVO vo) {
		int res = 0;
		try {
			res = dao.updateProd(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteProd(int no) {
		int res = 0;
		try {
			res = dao.deleteProd(no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
}
