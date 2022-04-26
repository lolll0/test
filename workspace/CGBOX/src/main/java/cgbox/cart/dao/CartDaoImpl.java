package cgbox.cart.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import cgbox.vo.CartProdVO;
import cgbox.vo.allcartVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class CartDaoImpl implements ICartDao {
   
	private static ICartDao dao;
    private SqlMapClient client = SqlMapClientFactory.getSqlMapClient();
    private CartDaoImpl() {
		
	}
    public static ICartDao getInstance() {
    	if(dao ==null) {
    		dao = new CartDaoImpl();
    	}
    	return dao;
    } 
	
	@Override
	public  List<allcartVO> allcart(int customerno) throws SQLException {
		
		return client.queryForList("cart.allcart",customerno);
	}
	
	@Override
	public int insertcartno(int customerno) throws SQLException {
		int count =0;
		Object obj = client.insert("cart.insertcartno",customerno);
		 if(obj==null) {
			 count = 1;
		 }
		 return count;
	}
	@Override
	public String checkcart(int customerno) throws SQLException {

		return (String)client.queryForObject("cart.checkcart",customerno);
	}
	@Override
	
	public int insertprod(CartProdVO cartprodVO) throws SQLException {
		int count = 0;
		 Object obj = client.insert("cart.insertprod",cartprodVO);
		
		 if(obj==null) { //성공한 경우
			 count = 1;
		 }
		 
		 //실패하면 0을 반환한다
		return count ;
	}
	@Override
	public int cartnoselect(int customerno) throws SQLException {
		
		return (int) client.queryForObject("cart.cartnoselect",customerno);
	}
	@Override
	public int updatecount(HashMap<String,Integer> map) throws SQLException {
		
		return (int)client.update("cart.updatecount",map);
	}
	@Override
	public String checkprod(HashMap<String, Integer> map) throws SQLException {
		
		return (String) client.queryForObject("cart.checkprod", map);
	}
	@Override
	public int plusone(HashMap<String, Integer> map) throws SQLException {
		
		return client.update("cart.plusone",map);
	}
	@Override
	public int selectdelete(HashMap<String, Integer> map) throws SQLException {
		// TODO Auto-generated method stub
		return client.delete("cart.selectdelete",map);
	}
	@Override
	public int updatestatus(HashMap<String, Integer> map) throws SQLException {
		
		return client.update("cart.updatestatus",map);
	}
	@Override
	public int updatestatusN(int customerno) throws SQLException {
		
		return client.update("cart.updatestatusN",customerno);
	}
	@Override
	public int cartsum(int customerno) throws SQLException {
		
		return client.update("cart.cartsum",customerno);
	}
	@Override
	public int sumreturn(int customerno) throws SQLException {
		
		return (int) client.queryForObject("cart.sumreturn",customerno);
	}
	@Override
	public int paySuccessRemove(HashMap<String, Integer> map) throws SQLException {
		// TODO Auto-generated method stub
		return client.delete("pay.paySuccessRemove",map);
	}
	@Override
	public int insertpaylist(HashMap<String, Integer> map) throws SQLException {
		// TODO Auto-generated method stub
		int count =0;
	Object obj = client.insert("pay.insertpaylist",map);
	if(obj==null) {
		count =1;
	}

		return count;
	}
	
	

}
