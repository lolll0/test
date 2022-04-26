package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.catalina.connector.ClientAbortException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdDaoImpl implements IProdDao {
	
	private SqlMapClient client;
	private static IProdDao dao;
	
	private ProdDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IProdDao getInstance() {
		if(dao == null) dao = new ProdDaoImpl();
		return dao;
	}

	@Override
	public List<ProdVO> getAllProd(SqlMapClient client, String category) throws SQLException {
		
		return client.queryForList("prod.getAllProd", category);
				
	}

	@Override
	public int cartCount(SqlMapClient client, int cid) throws SQLException {
		return (int)client.queryForObject("prod.cartCount", cid);
	}

	@Override
	public int findCart(SqlMapClient client, int cid) throws SQLException {
		
		return (int)client.queryForObject("prod.findCart", cid);
	}

	@Override
	public int insertCart(SqlMapClient client, int cid) throws SQLException {
		int cnt = 0;
		Object obj = client.insert("prod.insertCart", cid);
		if(obj == null) cnt = 1;
		
		return cnt;
	}

	@Override
	public int insertCartprod(SqlMapClient client, Map<String, Integer> map) throws SQLException {
		int cnt = 0;
		Object obj = client.insert("prod.insertCartprod", map);
		if(obj == null) cnt = 1;
		return cnt;
	}

	@Override
	public int insertProd(ProdVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.insert("prod.insertProd",vo);
	}

	@Override
	public int updateProd(ProdVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.update("prod.updateProd", vo);
	}

	@Override
	public int deleteProd(int no) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.delete("prod.deleteProd", no);
	}
	
}
