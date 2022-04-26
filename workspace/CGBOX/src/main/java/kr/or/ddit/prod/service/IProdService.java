package kr.or.ddit.prod.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.prod.vo.ProdVO;

public interface IProdService {

	
	public List<ProdVO> getAllProd(String category);
	
	public int cartCount(int cid);
	
	public int findCart(int cid);
	
	public int insertCart(int cid);
	
	public int insertCartprod(Map<String, Integer> map);
	
	public int insertProd(ProdVO vo);
	
	//수정
	public int updateProd(ProdVO vo);
	
	//삭제
	public int deleteProd(int no);
}
