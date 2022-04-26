package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.prod.vo.ProdVO;

public interface IProdDao {
	

	public List<ProdVO> getAllProd(SqlMapClient client, String category) throws SQLException;
	
	public int cartCount(SqlMapClient client, int cid) throws SQLException;

	public int findCart(SqlMapClient client, int cid) throws SQLException;
	
	public int insertCart(SqlMapClient client, int cid) throws SQLException;
	
	public int insertCartprod(SqlMapClient client, Map<String, Integer> map) throws SQLException;
	
	public int insertProd(ProdVO vo) throws SQLException;
	
	public int updateProd(ProdVO vo) throws SQLException;
	
	public int deleteProd(int no) throws SQLException;
}
