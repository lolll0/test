package cgbox.cart.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cgbox.vo.CartProdVO;
import cgbox.vo.allcartVO;

public interface ICartService {
	
	public List<allcartVO> allcart(int customerno);
    
	public String checkcart (int customerno) ;
	
	public int insertcartno(int customerno);
	public int cartnoselect (int customerno);
	 

	public int insertprod (CartProdVO cartprodVO);
	
	public int updatecount(HashMap<String, Integer> map);
	public int plusone(HashMap<String,Integer> map);
	
	
	public String checkprod (HashMap<String,Integer> map);
	
	public int selectdelete(HashMap<String,Integer> map);
	
	public int updatestatus(HashMap<String,Integer> map);
	public int updatestatusN( int customerno);
	
	
	 public int cartsum(int customerno);
	 public int sumreturn (int customerno);

	 public int paySuccessRemove(HashMap<String,Integer> map);
	 
	 public int insertpaylist(HashMap<String,Integer> map) ;
}
